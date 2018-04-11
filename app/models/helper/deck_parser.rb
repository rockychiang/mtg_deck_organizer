class DeckParser

  def self.run(deck, deck_list)
    card_list = deck_list.strip.split("\n").map do |line|
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

    if !card_list.include?("error")
      deck.cards.clear
      card_list.each do |card|
        deck.cards << card[0]
        deck.deck_cards.find_by(card_id: card[0].id).update(quantity: card[1])
      end
    else
      raise "error in deck list"
    end
  end

  private



end
