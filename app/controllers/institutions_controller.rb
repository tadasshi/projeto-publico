class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show]

  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.all
  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_institution
      @institution = Institution.find(params[:id])
    end
end
