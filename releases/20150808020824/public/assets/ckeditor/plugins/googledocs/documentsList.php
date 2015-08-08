<?php
$documentsDir = '/documents/';
$documents = array();
$fileNames = glob( $_SERVER['DOCUMENT_ROOT'] . $documentsDir . '*.*' );
foreach( $fileNames as $fileName )
{
  $document = basename( $fileName );
  $documents[] = array( 'name'=>$document, 'url'=>'http://' . $_SERVER['SERVER_NAME'] . $documentsDir . $document );
}
echo json_encode( $documents );