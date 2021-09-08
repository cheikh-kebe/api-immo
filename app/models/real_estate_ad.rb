class RealEstateAd < ApplicationRecord
    validates :title, :description, presence: true
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1}
    belongs_to :user, optional: true
    has_one_attached :image
end
