class Deck < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
  validates :format, presence: true

end
