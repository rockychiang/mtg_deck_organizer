class DeckParser

  def self.run(deck, deck_list)
    card_list = parse_deck(deck_list)
    if !card_list.include?("error")
      update_deck(deck, card_list)
    else
      raise "error(s) in deck list"
    end
  end

  private

  def self.parse_deck(deck_list)
    deck_list.strip.split("\n").map do |line|
      line.strip!

      name = line.sub(/\A[0-9]+x\s/, "").strip
      quantity = line.to_i
      card = Card.where("name like ?", name).first || Card.build_from_sdk(name: name)

      if card && quantity > 0
        [card, quantity]
      else
        "error"
      end
    end
  end

  def self.update_deck(deck, card_list)
    deck.cards.clear
    card_list.each do |card|
      deck.cards << card[0]
      deck.save
      deck.deck_cards.find_by(card_id: card[0].id).update(quantity: card[1])
    end
  end

end
