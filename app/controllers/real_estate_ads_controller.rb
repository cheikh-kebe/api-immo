class RealEstateAdsController < ApplicationController
  before_action :set_real_estate_ad, only: [:show, :update, :destroy]
  #before_action :authenticate_user!, only: %i[create edit update destroy ]
  #before_action :is_authorized_user, only: %i[update destroy ]


  def my_ads
    @my_ads = RealEstateAd.all.where(user_id: current_user.id)

    render json: @my_ads.map{|ad|
      ad.as_json.merge(image_path: ad.image.public_url)
    }
  end
    # GET /real_estate_ads
  def index
    @real_estate_ads = RealEstateAd.all

    render json: @real_estate_ads.map{|ad|
      ad.as_json.merge(image_path: ad.image.public_url,email: ad.user.email)
    }
  end

  # GET /real_estate_ads/1
  def show
    render json: @real_estate_ad.as_json.merge(image_path: ad.image.public_url,email: @real_estate_ad.user.email)
  end

  # POST /real_estate_ads
  def create
    @real_estate_ad = RealEstateAd.new(real_estate_ad_params)
    @real_estate_ad.user_id = current_user.id
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

    if @real_estate_ad.destroy
      render json: { message: 'Ad deleted' }, status: :ok
    else
      render json: @real_estate_ad.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_real_estate_ad
      @real_estate_ad = RealEstateAd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def real_estate_ad_params
      params.require(:real_estate_ad).permit(:title, :description, :price, :city, :user_id)
    end
end
