class DeckParser

  def self.parse(deck, deck_list)
    list = deck_list.split("\n")
    list.each do |line|
      line.strip!
      name = line.sub(/\A[0-9]+x\s/, "").strip
      db_card = MTG::Card.where(name: name).all.first
      card = Card.find_or_create_by(name: db_card.name)
      if !card.id
        card.cost = db_card.mana_cost
        card.card_type = db_card.types.join(" ")
        card.card_subtype = db_card.subtypes.join(" ")
        card.card_text = db_card.text
        card.power = db_card.power
        card.toughness = db_card.toughness
        card.save
      end
      quantity = line.match(/\A[0-9]+/).strip.to_i
      deck_cards = DeckCard.find_or_create_by(deck_id: deck.id, card_id: card.id)
      deck_cards.quantity = quantity
      deck_cards.save
    end
  end

end
