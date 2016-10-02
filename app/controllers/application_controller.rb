class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags, if: "request.get?"
  before_action :prepare_json_dl, if: "request.get?"
  layout :layout_by_resource


  #include ActionView::Helpers::TextHelper

  def prepare_json_dl()
    @json_Organization = JSON.generate(
        [{'@context': 'http://schema.org',
          '@type': 'Organization',
          'url': 'https://masteringpnl.com',
          'name': 'Mastering PNL',
          'sameAs': %w(https://www.facebook.com/masteringpnl https://google.com/+Masteringpnl_channel https://twitter.com/masteringpnl https://youtube.com/c/Masteringpnl_channel),
          'logo': 'https://masteringpnl.com/assets/logo-8f19e14f9561fc3683926e0dba8c42b21f2d090176e69a1ecd599452615efb36.png'
         }]
    )

    @json_Elements = JSON.generate(
        [{
             '@context': 'http://schema.org',
             '@type': 'SiteNavigationElement',
             'name': 'Blog',
             'url': "https://#{request.host}/blog"
         }, {
             '@context': 'http://schema.org',
             '@type': 'SiteNavigationElement',
             'name': 'Ebooks',
             'url': "https://#{request.host}/ebooks"
         }, {
             '@context': 'http://schema.org',
             '@type': 'SiteNavigationElement',
             'name': 'Metaforas',
             'url': "https://#{request.host}/metaphors"
         }, {
             '@context': 'http://schema.org',
             '@type': 'SiteNavigationElement',
             'name': 'Bibliografias',
             'url': "https://#{request.host}/bibliographies"
         }, {
             '@context': 'http://schema.org',
             '@type': 'SiteNavigationElement',
             'name': 'Biografias',
             'url': "https://#{request.host}/biographies"
         }, {
             '@context': 'http://schema.org',
             '@type': 'SiteNavigationElement',
             'name': 'Sobre nós',
             'url': "https://#{request.host}/sobre-nos"
         }, {
             '@context': 'http://schema.org',
             '@type': 'SiteNavigationElement',
             'name': 'Contato',
             'url': "https://#{request.host}/contato"
         }]
    )

    @json_Website = JSON.generate(
        [{
             '@context': 'http://schema.org',
             '@type': 'WebSite',
             'name': 'Mastering PNL',
             'url': "https://#{request.host}",
             'potentialAction': {
                 '@type': 'SearchAction',
                 'target': "https://#{request.host}/blog?utf8=✓&search={search_term_string}",
                 'query-input': 'required name=search_term_string'
             }, 'sameAs': %w(https://www.facebook.com/masteringpnl https://google.com/+Masteringpnl_channel https://twitter.com/masteringpnl https://youtube.com/c/Masteringpnl_channel)
         }]
    )

  end


  def prepare_meta_tags(options={})
    site_name = 'MasteringPNL'
    #title = [controller_name, action_name].join(" ")
    description = 'Grupo com o propósito de desenvolver, adaptar e difundir as ferramentas da PNL aliado com a psicologia, para todos que desejam bem estar psicológico.'
    #image = options[:image] || 'your-default-image-url'
    current_url = url_for(:only_path => false, :protocol => :https)

    # Let's prepare a nice set of defaults
    defaults = {
        site: site_name,
        #title: title,
        #image: image,
        reverse: true,
        description: description,
        #keywords: %w[pnl psicologia],
        twitter: {
            site_name: site_name,
            site: '@masteringpnl',
            card: 'summary',
            description: description,
            #image: image
        },
        og: {
            locale: 'pt_BR',
            type: 'website',
            url: current_url,
            site_name: site_name
        },
        fb: {
            profile_id: '947897365241721',
            #app_id: '238224526567263',
            #admins, #A Facebook app ID
        },
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end

  protected

  def layout_by_resource
    if devise_controller?
      'dashboard'
    else
      'application'
    end
  end
end
