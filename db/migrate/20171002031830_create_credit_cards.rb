class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.string :card_name
      t.string :card_number
      t.integer :mount
      t.integer :year
      t.string :cvv
      t.timestamps
    end
  end
end
