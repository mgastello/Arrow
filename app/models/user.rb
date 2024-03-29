# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  first_name      :string           not null
#  last_name       :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password

    validates :first_name, :last_name, :email, :session_token, presence: true
    validates :email, length: { in: 3..255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :email, :session_token, uniqueness: true
    validate :custom_password_validation, on: :create, if: :password
    validates :password, length: { in: 8..20 }, allow_nil: true

    before_validation :ensure_session_token

    has_many :cart_items,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: :CartItem,
      dependent: :destroy

    has_many :reviews,
      primary_key: :id,
      foreign_key: :author_id,
      class_name: :Review,
      dependent: :destroy

    has_many :favorites,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: :Favorite,
      dependent: :destroy

    def self.find_by_credentials(email, password)
      user = User.find_by(email: email)
  
      if user && user.authenticate(password)
        user
      else
        nil
      end
    end
    
    def reset_session_token!
      self.session_token = generate_unique_session_token
      self.save!
      self.session_token
    end

    private

    def generate_unique_session_token
        token = SecureRandom::urlsafe_base64
        while User.exists?(session_token: token)
            token = SecureRandom::urlsafe_base64
        end

        token
    end

    def ensure_session_token
        self.session_token ||= generate_unique_session_token
    end

    def custom_password_validation
        valid_patterns = [
            /^(?=.*[a-z])(?=.*[A-Z])(?!.*[<>\s]).{8,20}$/,
            /^(?=.*[a-z])(?=.*\d)(?!.*[<>\s]).{8,20}$/,
            /^(?=.*[a-z])(?=.*[^<>\w\s])(?!.*[<>\s]).{8,20}$/, 
            /^(?=.*[A-Z])(?=.*[^<>\w\s])(?!.*[<>\s]).{8,20}$/, 
            /^(?=.*[A-Z])(?=.*\d)(?!.*[<>\s]).{8,20}$/, 
            /^(?=.*\d)(?=.*[^<>\w\s])(?!.*[<>\s]).{8,20}$/
        ]

        valid_password = valid_patterns.any? { |pattern| password.match?(pattern) }

        unless valid_password
            errors.add(:password, "must contain: 8-20 characters. And 2 of the following: Lowercase letters, Uppercase letters, Numbers, Special characters, except < >")
        end
    end
end