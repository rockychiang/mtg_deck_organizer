class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :cost
      t.string :card_type
      t.string :card_subtype
      t.string :card_text
      t.string :power
      t.string :toughness
    end
  end
end
