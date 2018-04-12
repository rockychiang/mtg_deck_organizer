class Card < ActiveRecord::Base
  has_many :deck_cards
  has_many :decks, through: :deck_cards
  validates :name, presence: true
  validates :card_type, presence: true

  def quantity(deck_id)
    self.deck_cards.where(deck_id: deck_id, card_id: self.id).first.quantity
  end

  def update_from_sdk
    if !!self.name
      db_card = MTG::Card.where(name: self.name).all.first
      if !!db_card
        self.name = db_card.name
        self.cost = db_card.mana_cost
        self.card_type = db_card.types.join(" ")
        # card.card_supertype = db_card.supertypes.join(" ") if !!db_card.supertypes
        self.card_subtype = db_card.subtypes.join(" ") if !!db_card.subtypes
        self.card_text = db_card.text
        self.power = db_card.power
        self.toughness = db_card.toughness
        self.save
      else
        nil
      end
    else
      nil
    end
  end

  def self.build_from_sdk(name: card_name)
    Card.new.tap do |card|
      card.name = name
      card.update_from_sdk
    end
  end

end
