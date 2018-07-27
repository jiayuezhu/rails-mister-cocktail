class AddForeignKey < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :doses, :cocktails
    add_foreign_key :doses, :ingredients
  end
end
