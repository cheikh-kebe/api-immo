class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  after_create :welcome_send

  devise :database_authenticatable, :jwt_authenticatable, :registerable,
         :recoverable, jwt_revocation_strategy: JwtDenylist
  validates :email, uniqueness: true
  validates_format_of :email, with: /@/
  has_many :real_estate_ads, dependent: :destroy
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
