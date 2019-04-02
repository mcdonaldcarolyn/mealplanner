class CreateMealsIngredients < ActiveRecord::Migration[5.2]

    def change
      create_table :meals_ingredients do |t|
        t.integer :amount
        t.belongs_to :meal
        t.belongs_to :ingredient
      end
    end
end