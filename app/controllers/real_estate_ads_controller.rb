class RealEstateAdsController < ApplicationController
  before_action :set_real_estate_ad, only: [:show, :update, :destroy]

  # GET /real_estate_ads
  def index
    @real_estate_ads = RealEstateAd.all

    render json: @real_estate_ads
  end

  # GET /real_estate_ads/1
  def show
    render json: @real_estate_ad
  end

  # POST /real_estate_ads
  def create
    @real_estate_ad = RealEstateAd.new(real_estate_ad_params)

    if @real_estate_ad.save
      render json: @real_estate_ad, status: :created, location: @real_estate_ad
    else
      render json: @real_estate_ad.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /real_estate_ads/1
  def update
    if @real_estate_ad.update(real_estate_ad_params)
      render json: @real_estate_ad
    else
      render json: @real_estate_ad.errors, status: :unprocessable_entity
    end
  end

  # DELETE /real_estate_ads/1
  def destroy
    @real_estate_ad.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate_ad
      @real_estate_ad = RealEstateAd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def real_estate_ad_params
      params.require(:real_estate_ad).permit(:title, :description, :price)
    end
end
