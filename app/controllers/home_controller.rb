class HomeController < ApplicationController
  def index
    prepare_meta_tags title: 'Página Inicial'
    @contact = Contact.new
  end

  def contact
    prepare_meta_tags title: 'Contato'
    @contact = Contact.new

  end

  def send_email
    email = Contact.new(contact_params)
    UserNotifier.send_signup_email(email).deliver
    redirect_to contato_path, notice: 'Email enviado, aguarde o nosso retorno!'
  end

  def about_us
    prepare_meta_tags title: 'Sobre nós'
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
