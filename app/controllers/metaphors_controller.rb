class MetaphorsController < ApplicationController
  before_action :set_metaphor, only: [:show]
  #caches_page :index

  # GET /metaphors
  # GET /metaphors.json
  def index
    if params[:search]
      @metaphors = Metaphor.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @metaphors = Metaphor.order("created_at DESC").page params[:page]
    end

    prepare_meta_tags title: 'Metáforas'

    @banner = Banner.where(name: 'metaphor').take
  end

  # GET /metaphors/1
  # GET /metaphors/1.json
  def show
    @banner = Banner.where(name: 'metaphor').take

    @metaphors = Metaphor.where("id != '#{@metaphor.id}'").order("RANDOM()").limit(5)

    image = @banner.banner_images.first.image_url

    prepare_meta_tags(title:       @metaphor.title + ' - Metáforas',
                      description: @metaphor.summary,
                      keywords:    '',
                      image:       image,
                      og:          {
                          title:        @metaphor.title,
                          description:  @metaphor.summary,
                          image:        image,
                          type:         'article',
                          'image:type': 'image/jpg',
                      },
                      article:     {
                          #tag: @article.tag_list,
                          author:  '947897365241721',
                          section: 'Metáforas'
                      },
                      twitter:     {
                          title:       @metaphor.title,
                          card:        '',
                          description: @metaphor.summary,
                          image:       image
                      })

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_metaphor
    @metaphor = Metaphor.find(params[:id])
  end
end
