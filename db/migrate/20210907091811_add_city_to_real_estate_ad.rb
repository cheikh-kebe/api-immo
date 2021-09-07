class AddCityToRealEstateAd < ActiveRecord::Migration[6.1]
  def change
    add_column :real_estate_ads, :city, :string
  end
end
