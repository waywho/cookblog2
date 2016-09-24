class CreateIngredientForms < ActiveRecord::Migration
  def change
    create_table :ingredient_forms do |t|
      t.decimal :amount
      t.string :unit
      t.belongs_to :ingredient, index: true, foreign_key: true
      t.string :processed_form
      t.belongs_to :recipe, index: true

      t.timestamps null: false
    end
  end
end
