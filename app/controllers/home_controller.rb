class HomeController < ApplicationController
  def index
  end

  def contact
    @contact = Contact.new
  end

  def about_us
  end

  def deliver

    @contact = Contact.new(contact_params)

    @contact.request = request

    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
    end

    render :contact
  end

  private
  def contact_params
    params.require(:ContactForm).permit(:name, :email, :subject, :body)
  end
end
