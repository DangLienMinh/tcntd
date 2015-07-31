<?php
$uploadErrorMessages = array(
  '', //Файл был успешно загружен на сервер.,
  'Размер принятого файла превысил максимально допустимый размер.', //  ini_get('upload_max_filesize')
  'Размер загружаемого файла превысил максимально допустимый размер.',  //  MAX_FILE_SIZE в HTML-форме
  'Загружаемый файл был получен только частично.',
  'Файл не был загружен.',
  'Неизвестная ошибка загрузки файла (5).',
  'Отсутствует временная папка.',
  'Не удалось записать файл на диск',
  'PHP-расширение остановило загрузку файла.',
  'Неизвестная ошибка загрузки файла (9).', //  ошибка в move_uploaded_file
  'Неизвестная ошибка загрузки файла (10).' //  $_FILES - пустой массив
);

//  загрузка документов на сервер

$uploadDir = '/documents/';
$index = 0;
foreach ($_FILES as $ind => $file) {
  if( $file['error'] != UPLOAD_ERR_OK ) {
    break;
  }

  if( move_uploaded_file( $file['tmp_name'], $_SERVER['DOCUMENT_ROOT'] . $uploadDir . $file['name'] ) == false ) {
    $file['error'] = 9;
    break;
  }

  //  обработка загрузки файла частями - начало      
  //  
  //  $pattern - разбираю имя файла на составляющие
  //  0       =>  имя файла
  //  'name'  =>  имя файла до разбиения на части
  //  'from'  =>  начальный номер части
  //  'to'    =>  конечный номер части
  //  'total' =>  количество частей
  $pattern = '/(?P<name>.*)\.(?P<from>\d+)-?(?P<to>\d*)\.(?P<total>\d*)$/';
  //  если загружена часть файла
  if( preg_match( $pattern, $file['name'], $fileInfo ) ) {
    //  ищу все части загруженного файла
    $fileParts = glob( $_SERVER['DOCUMENT_ROOT'] . $uploadDir . $fileInfo['name'] . '*', GLOB_NOCHECK );
    foreach( $fileParts as $index => $part ) {
      if( preg_match( $pattern, $part, $fileParts[$index] ) ) {
        $fileParts[$index]['to'] || ($fileParts[$index]['to'] = $fileParts[$index]['from']);
        unset( $fileParts[$index][1], $fileParts[$index][2], $fileParts[$index][3], $fileParts[$index][4] ); 
      }
    }

    //  ищу части, которые можно объединить
    $parts = count( $fileParts );
    for( $i = 0; $i < $parts; $i++ ) {
      if( !$fileParts[$i] ) continue;

      for( $o = 0; $o < $parts; $o++ ) {
        if( !$fileParts[$o] ) continue;

        if( $i == $o ) continue;  //  не сравнивать части между собой

        //  объединяю части
        if( $fileParts[$i]['to'] + 1 == $fileParts[$o]['from'] ) {
          $outFile  = fopen( $fileParts[$o][0], 'r' );
          $inFile   = fopen( $fileParts[$i][0], 'a' );
          while( !feof($outFile) ) {
            fwrite( $inFile , fread( $outFile, 32768 ) );
          }
          fclose( $outFile );
          fclose( $inFile );

          //  корректирую информацию об объединенной части
          $fileParts[$i]['to'] = $fileParts[$o]['to'];
          $oldFileName = $fileParts[$i][0];
          $fileParts[$i][0] = $fileParts[$i]['name'] . '.' . $fileParts[$i]['from'] . '-' . $fileParts[$i]['to'] . '.' . $fileParts[$i]['total'];
          rename( $oldFileName, $fileParts[$i][0] );
        }

        //  удаляю ненужную часть
        if( $fileParts[$i]['from'] <= $fileParts[$o]['from'] && $fileParts[$o]['to'] <= $fileParts[$i]['to'] ) {
          unlink( $fileParts[$o][0] );
          $fileParts[$o] = NULL;
        }

        //  если объединены все
        if( $fileParts[$i]['to'] - $fileParts[$i]['from'] + 1 == $fileParts[$i]['total'] ) {
          rename( $fileParts[$i][0], $fileParts[$i]['name'] );
          $file['name'] = $fileInfo['name'];
          break 2;
        }
      }
    }        
  }
  //  обработка загрузки файла частями - конец
}

// Required: anonymous function reference number as explained above.
$funcNum  = filter_input( INPUT_GET, 'CKEditorFuncNum', FILTER_VALIDATE_INT );
$fileName = ( $_FILES && $_FILES[$ind]['error'] == UPLOAD_ERR_OK ) ? 'http://' . $_SERVER['SERVER_NAME'] . $uploadDir . $_FILES[$ind]['name'] : '';
$message  = $uploadErrorMessages[$_FILES ? $_FILES[$ind]['error'] : 10];
echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction({$funcNum}, '{$fileName}', '{$message}');</script>";