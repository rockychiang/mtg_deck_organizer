class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :deck_cards
  has_many :cards, through: :deck_cards
  validates :name, presence: true
  validates :format, presence: true

end
