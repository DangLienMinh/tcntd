class SessionsController < Devise::SessionsController
  # skip_before_filter :require_no_authentication, :only => [:new]  
  # prepend_before_filter :captcha_valid, :only => [ :create]
  # def captcha_valid
  #   if verify_recaptcha
  #     super
  #   else
  #     build_resource
  #     flash[:error] = "Captcha has wrong, try a again."
  #     respond_with_navigational(resource) { render :new }
  #   end    
  # end
  skip_before_filter :require_no_authentication, :only => [:new]  


  def create
    if verify_recaptcha
      #flash[:error] = "Captcha has wrong, try a again."
      #super
    else
      build_resource
      flash[:error] = "Captcha has wrong, try a again."
      respond_with_navigational(resource) { render :new }
    end    
  end
end