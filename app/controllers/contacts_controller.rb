# encoding: utf-8
class ContactsController < ApplicationController

  def post_params
    params.require(:contact).permit( :name, :email, :phone, :subject,:message)
  end
  def new
    @c=Contact.new
  end
  def create
    @c=Contact.new(post_params)
    if verify_recaptcha
      if @c.save
          redirect_to contacts_new_path, :notice => "Cảm ơn bạn đã gửi liên hệ cho nhà trường !"
        else
          render "new"
        end
    else

      flash[:error] = "Captcha nhập chưa đúng, Vui lòng nhập lại!"
      flash.delete(:recaptcha_error)
      render "new"
    end

  end
end
