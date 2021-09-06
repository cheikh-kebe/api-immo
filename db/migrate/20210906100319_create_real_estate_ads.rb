class CreateRealEstateAds < ActiveRecord::Migration[6.1]
  def change
    create_table :real_estate_ads do |t|

      t.timestamps
    end
  end
end
