class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :except => [:show, :index]

  # GET /posts
  # GET /posts.json
  def index
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC").page params[:page]
    else
      @posts = Post.order("created_at DESC").page params[:page]
    end

    prepare_meta_tags title: 'Blog'

    @banner = Banner.where(name: 'post').take
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

    @posts = Post.where("id != '#{@post.id}'").order("RANDOM()").limit(5)

    image = ''

    if !@post.image_url.nil?
      image = 'https://' + request.host + @post.image_url
    end

    prepare_meta_tags(title:       @post.title + ' - Blog',
                      description: @post.summary,
                      keywords:    '',
                      image:       image,
                      og:          {
                          title:        @post.title,
                          description:  @post.summary,
                          image:        image,
                          type:         'article',
                          'image:type': 'image/jpg',
                          updated_time: @post.updated_at.strftime('%FT%T')
                      },
                      article:     {
                          #tag: @article.tag_list,
                          author:         '947897365241721',
                          section:        'Blog',
                          published_time: @post.created_at.strftime('%FT%T'),
                          modified_time:  @post.updated_at.strftime('%FT%T')
                      },
                      twitter:     {
                          title:       @post.title,
                          card:        '',
                          description: @post.summary,
                          image:       image
                      })

    @banner = Banner.where(name: 'post').take
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end
end
