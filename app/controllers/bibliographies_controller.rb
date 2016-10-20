class BibliographiesController < ApplicationController
  before_action :set_bibliography, only: [:show]
  #caches_page :index

  # GET /bibliographies
  # GET /bibliographies.json
  def index

    if params[:search]
      @bibliographies = Bibliography.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @bibliographies = Bibliography.order("created_at DESC").page params[:page]
    end

    prepare_meta_tags title: 'Bibliografias'

    @banner = Banner.where(name: 'bibliography').take
  end

  # GET /bibliographies/1
  # GET /bibliographies/1.json
  def show

    @bibliographies = Bibliography.where("id != '#{@bibliography.id}'").order("RANDOM()").limit(5)

    image = ''

    if !@bibliography.image_url.nil?
      image = 'https://' + request.host + @bibliography.image_url
    end

    prepare_meta_tags(title:       @bibliography.title + ' - Bibliografias',
                      description: @bibliography.summary,
                      keywords:    '',
                      image:       image,
                      og:          {
                          title:        @bibliography.title,
                          description:  @bibliography.summary,
                          image:        image,
                          type:         'article',
                          'image:type': 'image/jpg'
                      },
                      article:     {
                          #tag: @article.tag_list,
                          author:  '947897365241721',
                          section: 'Bibliografias'
                      },
                      twitter:     {
                          title:       @bibliography.title,
                          card:        '',
                          description: @bibliography.summary,
                          image:       image
                      })

    @banner = Banner.where(name: 'bibliography').take
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bibliography
    @bibliography = Bibliography.find(params[:id])
  end
end
