class ErealEstateAddsController < ApplicationController
  before_action :set_ereal_estate_add, only: [:show, :update, :destroy]

  # GET /ereal_estate_adds
  def index
    @ereal_estate_adds = ErealEstateAdd.all

    render json: @ereal_estate_adds
  end

  # GET /ereal_estate_adds/1
  def show
    render json: @ereal_estate_add
  end

  # POST /ereal_estate_adds
  def create
    @ereal_estate_add = ErealEstateAdd.new(ereal_estate_add_params)

    if @ereal_estate_add.save
      render json: @ereal_estate_add, status: :created, location: @ereal_estate_add
    else
      render json: @ereal_estate_add.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ereal_estate_adds/1
  def update
    if @ereal_estate_add.update(ereal_estate_add_params)
      render json: @ereal_estate_add
    else
      render json: @ereal_estate_add.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ereal_estate_adds/1
  def destroy
    @ereal_estate_add.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ereal_estate_add
      @ereal_estate_add = ErealEstateAdd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ereal_estate_add_params
      params.require(:ereal_estate_add).permit(:title, :description, :price)
    end
end
