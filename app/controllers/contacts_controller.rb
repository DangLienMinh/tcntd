class ContactsController < ApplicationController
  def post_params
    params.require(:contact).permit( :name, :email, :phone, :subject,:message)
  end
  def new
    @c=Contact.new
  end
  def create
    @c=Contact.new(post_params)

    if @c.save
      redirect_to contacts_new_path, :notice => "Them ok"
    else
      render "new"
    end

  end
end
