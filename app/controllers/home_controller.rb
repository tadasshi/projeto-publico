class HomeController < ApplicationController
  def index
    prepare_meta_tags title: 'Página Inicial'
  end

  def contact
    prepare_meta_tags title: 'Contato'
  end

  def about_us
    prepare_meta_tags title: 'Sobre nós'
  end
end
