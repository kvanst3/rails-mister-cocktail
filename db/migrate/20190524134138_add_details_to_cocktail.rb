class AddDetailsToCocktail < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :detail, :string
  end
end
