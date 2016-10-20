class BiographiesController < ApplicationController
  before_action :set_biography, only: [:show]

  # GET /biographies
  # GET /biographies.json
  def index
    if params[:search]
      @biographies = Biography.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @biographies = Biography.order("created_at DESC").page params[:page]
    end

    prepare_meta_tags title: 'Biografias'

    @banner = Banner.where(name: 'biography').take
  end

  # GET /biographies/1
  # GET /biographies/1.json
  def show

    @biographies = Biography.where("id != '#{@biography.id}'").order("RANDOM()").limit(5)

    image = ''

    if !@biography.image_url.nil?
      image = 'https://' + request.host + @biography.image_url
    end

    prepare_meta_tags(title:       @biography.title + ' - Biografias',
                      description: @biography.summary,
                      keywords:    '',
                      image:       image,
                      og:          {
                          title:        @biography.title,
                          description:  @biography.summary,
                          image:        image,
                          type:         'article',
                          'image:type': 'image/jpg',
                          updated_time: @biography.updated_at.strftime('%FT%T')
                      },
                      article:     {
                          #tag: @article.tag_list,
                          author:         '947897365241721',
                          section:        'Biografias',
                          published_time: @biography.created_at.strftime('%FT%T'),
                          modified_time:  @biography.updated_at.strftime('%FT%T')
                      },
                      twitter:     {
                          title:       @biography.title,
                          card:        '',
                          description: @biography.summary,
                          image:       image
                      })

    @banner = Banner.where(name: 'biography').take
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_biography
    @biography = Biography.find(params[:id])
  end
end
