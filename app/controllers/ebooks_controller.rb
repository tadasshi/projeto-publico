class EbooksController < ApplicationController
  before_action :set_ebook, only: [:show]
  layout 'ebook_dedicated', only: [:show]
  #caches_page :index, :show

  # GET /ebooks
  # GET /ebooks.json
  def index
    if params[:search]
      @ebooks = Ebook.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @ebooks = Ebook.order("created_at DESC").page params[:page]
    end

    prepare_meta_tags title: 'Ebooks'

    @banner = Banner.where(name: 'ebook').take
  end

  # GET /ebooks/1
  # GET /ebooks/1.json
  def show

    image = ''

    if !@ebook.image_url.nil?
      image = @ebook.image_url
    end

    prepare_meta_tags(title:       @ebook.title + ' - Ebooks',
                      description: @ebook.summary,
                      keywords:    '',
                      image:       @ebook.facebook_image_url,
                      og:          {
                          title:        @ebook.title,
                          description:  @ebook.summary,
                          image:        @ebook.facebook_image_url,
                          type:         'article',
                          'image:type': 'image/jpg',
                          updated_time: @ebook.updated_at.strftime('%FT%T')
                      },
                      article:     {
                          #tag: @article.tag_list,
                          author:         '947897365241721',
                          section:        'Blog',
                          published_time: @ebook.created_at.strftime('%FT%T'),
                          modified_time:  @ebook.updated_at.strftime('%FT%T')
                      },
                      twitter:     {
                          title:       @ebook.title,
                          card:        '',
                          description: @ebook.summary,
                          image:       @ebook.facebook_image_url
                      })

    @banner = Banner.where(name: 'ebook').take
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ebook
    @ebook = Ebook.find(params[:id])
  end
end
