class CreateErealEstateAdds < ActiveRecord::Migration[6.1]
  def change
    create_table :ereal_estate_adds do |t|
      t.string :title
      t.text :description
      t.int :price

      t.timestamps
    end
  end
end
