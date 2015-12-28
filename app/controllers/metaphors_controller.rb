class MetaphorsController < ApplicationController
  before_action :set_metaphor, only: [:show, :edit, :update, :destroy]

  # GET /metaphors
  # GET /metaphors.json
  def index
    @metaphors = Metaphor.all
  end

  # GET /metaphors/1
  # GET /metaphors/1.json
  def show
  end

  # GET /metaphors/new
  def new
    @metaphor = Metaphor.new
  end

  # GET /metaphors/1/edit
  def edit
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
      params.require(:metaphor).permit(:title, :slug, :description)
    end
end
