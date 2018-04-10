class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true,
    format: {with: /\A[a-zA-Z0-9_-]+\z/, message: "only allow lettters, numbers, dash, and underscore"},
    length: {minimum: 3, too_short: "must be at least 3 characters long"}
  validates :email, confirmation: true, uniqueness: true
  validates :email_confirmation, presence: true
  validates :password, presence: true, length: {in: 6..20, wrong_length: "cannot be shorter than 6 and longer than 20 characters"}
end
