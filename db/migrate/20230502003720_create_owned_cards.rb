class CreateOwnedCards < ActiveRecord::Migration[7.0]
  def change
    create_table :owned_cards do |t|
      t.string :card_id
      t.string :image
      t.string :condition
      t.string :language
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
