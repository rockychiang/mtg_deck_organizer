class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :password, presence: true
end
