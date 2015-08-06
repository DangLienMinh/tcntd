/**
 * Created by Thuykaka on 05/08/2015.
 */
$(function(){
	$('.fancybox').fancybox();
    if(document.getElementById('admin_user_is_admin') && 	 document.getElementById('admin_user_is_admin').checked==true){
        $('#admin_user_page_id').parent().hide();
        $('#admin_user_page_id').val(null);
    }else{
        $('#admin_user_page_id').parent().show();
        $('#admin_user_page_id').val($('#admin_user_page_id option:first').val());
    }
    if(window.location.href.toString().includes("new") && window.location.href.toString().includes("admin_users")){
  	$('#admin_user_password_current_input').hide();
    }
    if(window.location.href.toString().includes("edit") && window.location.href.toString().includes("admin_users")){
    var x= $('#admin_user_id').val().toString();
    $('.cancel').empty();
    $('.cancel').append('<a href="/admin/admin_users/'+x+'">Cancel</a>');
    }
    if(window.location.href.toString().includes("admin_users")){
    var x= window.location.href.toString().slice(-1);
    $("#wrapper").append('<div id="inline1" style="width:400px;display: none;"><form novalidate="novalidate" class="formtastic admin_user" id="edit_admin_user" action="/admin/admin_users/'+x+'"accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="_method" value="patch"><fieldset class="inputs"><legend><span>Nhập thông tin chi tiết</span></legend><ol><li class="password input optional stringish" id="admin_user_password_current_input"><label for="admin_user_password_current" class="label">Mật khẩu hiện tại</label><input id="admin_user_password_current" type="password" name="admin_user[password_current]"></li><li class="password input required stringish" id="admin_user_password_input"><label for="admin_user_password" class="label">Mật khẩu mới<abbr title="required">*</abbr></label><input maxlength="72" id="admin_user_password" type="password" name="admin_user[password]"></li><li class="password input optional stringish" id="admin_user_password_confirmation_input"><label for="admin_user_password_confirmation" class="label">Nhập lại mật khẩu mới</label><input id="admin_user_password_confirmation" type="password" name="admin_user[password_confirmation]"></li></ol></fieldset><fieldset class="actions"><ol><li class="action input_action " id="admin_user_submit_action"><input type="submit" name="commit" value="Update Admin user"></li><li class="cancel"><a href="/admin/admin_users/'+x+'">Cancel</a></li></ol></fieldset></form></div>');
    }
});