class AddValueToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_foods, :value, :integer
  end
end
