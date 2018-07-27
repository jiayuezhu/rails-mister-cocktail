class CreateDoses < ActiveRecord::Migration[5.2]
  def change
    create_table :doses do |t|
      t.text :description
      t.integer :cocktail_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
