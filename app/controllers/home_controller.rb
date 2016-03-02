class HomeController < ApplicationController
  def index
    prepare_meta_tags title: 'Página Inicial'
    @contact = Contact.new
  end

  def contact
    prepare_meta_tags title: 'Contato'
  end

  def send_email
    c = Contact.new(contact_params)
    c.deliver
    redirect_to root_path, notice: 'Bibliography was successfully created.'
  end

  def about_us
    prepare_meta_tags title: 'Sobre nós'
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
