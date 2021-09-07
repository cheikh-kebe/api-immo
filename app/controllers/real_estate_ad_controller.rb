class RealEstateAdController < ApplicationController
  def index
    render json: RealEstateAd.all 
  end

  def show
    render json: RealEstateAd.find(params[:id])
  end
end
