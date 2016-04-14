MasteringPnl
=============================

## 1.0

* (pronto)[Cadastrar Ebook](https://masteringpnl.fetchapp.com/admin/products/new)
* (falta mandar email)Implementar contato
* (pronto)Implementar link para amazon em ebooks
* (Incompleto)Microdata
* Customizar páginas 404, 422 e 500
* Testes Automatizados

## 2.0

* Add profissionais
* Add instituições
* (pronto)Add posts
* Add videos
* Add eventos
* (pronto)Add biografias
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

## 4.0

* Automatizar posts, no twitter, facebook e google+ 
* [Repost Google+](https://github.com/google/google-api-ruby-client)
* [Repost twitter](https://github.com/sferik/twitter)
* [Repost facebook](https://github.com/arsduo/koala)
* [Repost facebook - alternativa](https://github.com/nov/fb_graph2)

* [links de compartilhar](https://github.com/hermango/shareable)
* [network](https://rubygems.org/gems/social_stream)

## 5.0

* [Profiling](http://blog.scoutapp.com/articles/2015/09/16/profiling-rails-with-stackprof) 

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
