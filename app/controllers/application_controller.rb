class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags, if: "request.get?"

  def prepare_meta_tags(options={})
    site_name = 'MasteringPNL'
    title = [controller_name, action_name].join(" ")
    description = 'Grupo com o propósito de desenvolver, adaptar e difundir as ferramentas da PNL aliado com a psicologia, para todos que desejam bem estar psicológico.'
    image = options[:image] || 'your-default-image-url'
    current_url = request.url

    # Let's prepare a nice set of defaults
    defaults = {
        site: site_name,
        title: title,
        image: image,
        description: description,
        keywords: %w[pnl psicologia],
        twitter: {
            site_name: site_name,
            site: '@masteringpnl',
            card: 'summary',
            description: description,
            image: image
        },
        og: {
            url: current_url,
            site_name: site_name,
            title: title,
            image: image,
            description: description,
            type: 'website'
        }
    }

    options.reverse_merge!(defaults)

    set_meta_tags options
  end
end
