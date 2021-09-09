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

  def send_password_reset
    self.reset_password_token = generate_base64_token
    self.reset_password_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver_now
  end

  def password_token_valid?
    (self.reset_password_sent_at + 1.hour) > Time.zone.now
  end

  def reset_password(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end

  private

  def generate_base64_token
    test = SecureRandom.urlsafe_base64
  end
end
