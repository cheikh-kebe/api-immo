class AddReferenceUserToRealEstateAd < ActiveRecord::Migration[6.1]
  def change
    add_reference :real_estate_ads, :user, null: false, foreign_key: true
  end
end
