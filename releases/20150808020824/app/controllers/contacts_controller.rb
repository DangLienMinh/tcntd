# encoding: utf-8
class ContactsController < ApplicationController
  def contact_params
    params.require(:contact).permit( :name, :email, :phone, :subject,:message)
  end
  def new
    @c=Contact.new
  end
  def create
    @c=Contact.new(contact_params)
    if verify_recaptcha
      if @c.save
        redirect_to new_contact_path, :notice => "Cảm ơn bạn đã gửi liên hệ!"
      else
        @error_string=""
        @c.errors.full_messages.each do |message|
          @error_string+=message+"<br>"
        end
        redirect_to new_contact_path,:flash => {  :error =>@error_string}
      end
    else

      flash[:error] = "Captcha nhập chưa đúng, Vui lòng nhập lại!"
      flash.delete(:recaptcha_error)
      render "new"
    end
  end

end
