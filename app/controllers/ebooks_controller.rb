class EbooksController < ApplicationController
  before_action :set_ebook, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, :except => [:show, :index]
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

  end

  # GET /ebooks/1
  # GET /ebooks/1.json
  def show

    image = ''

    if !@ebook.image_url.nil?
      image = 'http://' + request.host + @ebook.image_url
    end
    
    prepare_meta_tags(title: @ebook.title + ' - Ebooks',
                      description: @ebook.summary,
                      keywords: '',
                      image: @ebook.image_url,
                      og: {
                          title: @ebook.title,
                          description: @ebook.summary,
                          image: image,
                          type: 'article',
                          'image:type': 'image/jpg',
                          updated_time: @ebook.updated_at.strftime('%FT%T')
                      },
                      twitter: {
                          title: @ebook.title,
                          card: '',
                          description: @ebook.summary,
                          image: image
                      })

  end

  # GET /ebooks/new
  def new
    @ebook = Ebook.new
    prepare_meta_tags noindex: true
  end

  # GET /ebooks/1/edit
  def edit
    prepare_meta_tags noindex: true
  end

  # POST /ebooks
  # POST /ebooks.json
  def create
    @ebook = Ebook.new(ebook_params)

    respond_to do |format|
      if @ebook.save
        format.html { redirect_to @ebook, notice: 'Ebook was successfully created.' }
        format.json { render :show, status: :created, location: @ebook }
      else
        format.html { render :new }
        format.json { render json: @ebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebooks/1
  # PATCH/PUT /ebooks/1.json
  def update
    respond_to do |format|
      if @ebook.update(ebook_params)
        format.html { redirect_to @ebook, notice: 'Ebook was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebook }
      else
        format.html { render :edit }
        format.json { render json: @ebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebooks/1
  # DELETE /ebooks/1.json
  def destroy
    @ebook.destroy
    respond_to do |format|
      format.html { redirect_to ebooks_url, notice: 'Ebook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ebook
    @ebook = Ebook.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ebook_params
    params.require(:ebook).permit(:title, :description, :image, :value, :url)
  end
end
