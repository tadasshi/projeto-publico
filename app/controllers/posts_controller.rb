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

    prepare_meta_tags title: 'Posts'

  end

  # GET /posts/1
  # GET /posts/1.json
  def show

    description = ActionView::Base.full_sanitizer.sanitize(@post.description)

    image = ''

    if !@post.image_url.nil?
      image = 'http://' + request.host + @post.image_url
    end

    prepare_meta_tags(title: @post.title + ' - Blog | Mastering PNL',
                      description: @post.description,
                      keywords: '',
                      image: @post.image_url,
                      og: {
                          title: @post.title,
                          description: description,
                          image: image,
                          type: 'article',
                          'image:type': 'image/jpg',
                          updated_time: @article.updated_at.strftime('%FT%T')
                      },
                      article: {
                          #tag: @article.tag_list,
                          author: '947897365241721',
                          section: 'Blog',
                          published_time: @post.created_at.strftime('%FT%T'),
                          modified_time: @post.updated_at.strftime('%FT%T')
                      },
                      twitter: {
                          title: @post.title,
                          card: '',
                          description: description,
                          image: image
                      })
  end

  # GET /posts/new
  def new
    @post = Post.new
    prepare_meta_tags noindex: true
  end

  # GET /posts/1/edit
  def edit
    prepare_meta_tags noindex: true
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end
