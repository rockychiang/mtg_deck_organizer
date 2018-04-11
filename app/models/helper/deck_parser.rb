class DeckParser

  def self.parse(deck, deck_list)
    cards = deck_list.split("\n")
    cards.each do |card|
      card.strip!
      name = card.sub(/\A[0-9]+x\s/, "").strip
      quantity = card.match(/\A[0-9]+/).strip.to_i
    end
  end

end
