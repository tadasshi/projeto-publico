class BibliographiesController < ApplicationController
  before_action :set_bibliography, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]
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

  end

  # GET /bibliographies/1
  # GET /bibliographies/1.json
  def show
    prepare_meta_tags(title: @bibliography.title,
                      description: @bibliography.description,
                      keywords: '',
                      image: @bibliography.image_url,
                      twitter: {card: ''})

  end

  # GET /bibliographies/new
  def new
    @bibliography = Bibliography.new
    prepare_meta_tags noindex: true
  end

  # GET /bibliographies/1/edit
  def edit
    prepare_meta_tags noindex: true
  end

  # POST /bibliographies
  # POST /bibliographies.json
  def create
    @bibliography = Bibliography.new(bibliography_params)

    respond_to do |format|
      if @bibliography.save
        format.html { redirect_to @bibliography, notice: 'Bibliography was successfully created.' }
        format.json { render :show, status: :created, location: @bibliography }
      else
        format.html { render :new }
        format.json { render json: @bibliography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bibliographies/1
  # PATCH/PUT /bibliographies/1.json
  def update
    respond_to do |format|
      if @bibliography.update(bibliography_params)
        format.html { redirect_to @bibliography, notice: 'Bibliography was successfully updated.' }
        format.json { render :show, status: :ok, location: @bibliography }
      else
        format.html { render :edit }
        format.json { render json: @bibliography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bibliographies/1
  # DELETE /bibliographies/1.json
  def destroy
    @bibliography.destroy
    respond_to do |format|
      format.html { redirect_to bibliographies_url, notice: 'Bibliography was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bibliography
    @bibliography = Bibliography.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bibliography_params
    params.require(:bibliography).permit(:title, :description, :image, :amazon_afiliate_link, :year, :author, :pages, :thickness)
  end
end
