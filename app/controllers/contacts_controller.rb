class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_form_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = "Can not send Message"
      render :new
    end
  end

  private 
  def contact_form_params
    params.require(:contact).permit(:name, :email, :message, :nickname)
  end
end
