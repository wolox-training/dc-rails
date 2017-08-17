class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]
  # Hooks
  before_validation :generate_verification_code, on: :create
  validates :first_name, :last_name, :email, :locale, presence: true

  has_many :rents, dependent: :delete_all
  has_many :book_suggestions, dependent: :delete_all

  def generate_verification_code
    self.verification_code = AuthenticableEntity.verification_code
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      password = Devise.friendly_token[0,20]
      user = User.create(first_name: data["name"], email: data["email"],
        password: password, password_confirmation: password
      )
    end
    user
  end
end
