class MetaphorsController < ApplicationController
  before_action :set_metaphor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :except => [:show, :index]
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

  end

  # GET /metaphors/1
  # GET /metaphors/1.json
  def show

    @metaphors = Metaphor.where("id != '#{@metaphor.id}'").order("RANDOM()").limit(5)

    image = ''

    if !@metaphor.image_url.nil?
      image = 'http://' + request.host + @metaphor.image_url
    end

    prepare_meta_tags(title: @metaphor.title + ' - Metáforas',
                      description: @metaphor.summary,
                      keywords: '',
                      image: @metaphor.image_url,
                      og: {
                          title: @metaphor.title,
                          description: @metaphor.summary,
                          image: image,
                          type: 'article',
                          'image:type': 'image/jpg',
                      },
                      article: {
                          #tag: @article.tag_list,
                          author: '947897365241721',
                          section: 'Metáforas'
                      },
                      twitter: {
                          title: @metaphor.title,
                          card: '',
                          description: @metaphor.summary,
                          image: image
                      })


  end

  # GET /metaphors/new
  def new
    @metaphor = Metaphor.new
    prepare_meta_tags noindex: true
  end

  # GET /metaphors/1/edit
  def edit
    prepare_meta_tags noindex: true
  end

  # POST /metaphors
  # POST /metaphors.json
  def create
    @metaphor = Metaphor.new(metaphor_params)

    respond_to do |format|
      if @metaphor.save
        format.html { redirect_to @metaphor, notice: 'Metaphor was successfully created.' }
        format.json { render :show, status: :created, location: @metaphor }
      else
        format.html { render :new }
        format.json { render json: @metaphor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metaphors/1
  # PATCH/PUT /metaphors/1.json
  def update
    respond_to do |format|
      if @metaphor.update(metaphor_params)
        format.html { redirect_to @metaphor, notice: 'Metaphor was successfully updated.' }
        format.json { render :show, status: :ok, location: @metaphor }
      else
        format.html { render :edit }
        format.json { render json: @metaphor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metaphors/1
  # DELETE /metaphors/1.json
  def destroy
    @metaphor.destroy
    respond_to do |format|
      format.html { redirect_to metaphors_url, notice: 'Metaphor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_metaphor
    @metaphor = Metaphor.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def metaphor_params
    params.require(:metaphor).permit(:title, :description, :image)
  end
end
