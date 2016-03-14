MasteringPnl
=============================

## 1.0

* [Cadastrar Ebook](https://masteringpnl.fetchapp.com/admin/products/new)
* Implementar contato (falta mandar email)
* Implementar link para amazon em ebooks
* Microdata

## 2.0

* Add profissionais
* Add instituições
* Add artigos
* Add videos
* Add eventos
* Add notícias
* Add biografias
* Adiconar formulário newsletter

## 3.0

* [Integrar autenticaçao com midias sociais](https://github.com/intridea/omniauth)
* [Implementar testes](https://github.com/rspec/rspec-rails)
* Implementar i18n
* Implementar GeoTargetings
* [Implementar comentarios para ebooks/](http://www.rubydoc.info/gems/acts_as_commentable/4.0.2)
* [Implementar comentarios para metaforas](http://www.rubydoc.info/gems/acts_as_commentable/4.0.2)
* [Implementar comentarios para bibliografias](http://www.rubydoc.info/gems/acts_as_commentable/4.0.2)
* Link para relatar bug

## Links úteis para o deploy

* [Deploying a Rails App on Ubuntu 14.04 with Capistrano, Nginx, and Puma](https://www.digitalocean.com/community/tutorials/deploying-a-rails-app-on-ubuntu-14-04-with-capistrano-nginx-and-puma)

* [/usr/bin/env: passenger: No such file or directory ](https://github.com/capistrano/passenger/issues/26)
> rvm @global do gem install passenger
> set :passenger_restart_with_touch, true

* [There was an error while trying to load the gem 'uglifier'.](http://stackoverflow.com/questions/34420554/there-was-an-error-while-trying-to-load-the-gem-uglifier-bundlergemrequire)
> sudo apt-get install nodejs

* [Can't find the 'libpq-fe.h header when trying to install pg gem](http://stackoverflow.com/questions/6040583/cant-find-the-libpq-fe-h-header-when-trying-to-install-pg-gem)
> sudo apt-get install libpq-dev


* [How To Add Swap on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04)

* [gem install rails fails on ubuntu](http://stackoverflow.com/questions/29317640/gem-install-rails-fails-on-ubuntu)
> sudo apt-get install libgmp-dev

* [change postgre pass](http://dba.stackexchange.com/questions/24774/postgresql-changing-password-for-a-user-is-not-working)

* [Devise secret Key](http://stackoverflow.com/questions/18080910/devise-secret-key-was-not-set)
> config/initializers/devise.rb

* [Setup Capistrano on LOCAL](https://gist.github.com/stevenyap/9130882)
