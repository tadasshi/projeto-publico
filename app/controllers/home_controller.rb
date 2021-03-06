class HomeController < ApplicationController
  def index
    prepare_meta_tags title: 'Página Inicial'
    @contact = Contact.new
    @newsletter = Newsletter.new

    @banner = Banner.where(name: 'home').take
  end

  def contact
    prepare_meta_tags title: 'Contato'
    @contact = Contact.new
    @banner = Banner.where(name: 'contact').take
  end

  # def send_email
  #   email = Contact.new(contact_params)
  #   email.save
  #   #UserNotifier.send_signup_email(email).deliver
  #   redirect_to contato_path, notice: 'Email enviado, aguarde o nosso retorno!'
  # end

  def about_us
    prepare_meta_tags title: 'Sobre nós'
    @banner = Banner.where(name: 'about_us').take
  end

  # private
  #   def contact_params
  #     params.require(:contact).permit(:name, :email, :message)
  #   end
end
