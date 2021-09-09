class RealEstateAdsController < ApplicationController
  before_action :set_real_estate_ad, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: %i[create edit update destroy ]
  before_action :is_authorized_user, only: %i[update destroy ]

  def my_ads
    @my_ads = RealEstateAd.all.where(user_id: current_user.id)
    render json:   @my_ads.map{|ad|
      ad.as_json.merge(image_path: url_for(ad.image),email: ad.user.email, user_id:ad.user.id)
    }
  end
  def index
    @real_estate_ads = RealEstateAd.all
    render json: @real_estate_ads.map{|ad|
      ad.as_json.merge(image_path: url_for(ad.image),email: ad.user.email)
    }
  end

  def show
    render json: @real_estate_ad.as_json.merge(image_path: url_for(@real_estate_ad.image),email: @real_estate_ad.user.email)
  end

  def create
    @real_estate_ad = RealEstateAd.new(real_estate_ad_params)
    @real_estate_ad.user_id = current_user.id
    @image = params[:image]
    if @image.present?
      @real_estate_ad.image.attach(@image)
    else
      @real_estate_ad.image.attach(io: File.open(File.join(Rails.root,'app/assets/images/default.jpeg')), filename: 'default.jpeg')
    end

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
    def set_real_estate_ad
      @real_estate_ad = RealEstateAd.find(params[:id])
    end

    def real_estate_ad_params
      params.permit(:title, :description, :price, :city, :user_id, :image, :id)
    end
end
