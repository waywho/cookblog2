class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :instruction
      t.string :image
      t.integer :row_order
      t.belongs_to :recipe

      t.timestamps null: false
    end
    add_index :steps, :row_order
    add_index :steps, :recipe_id
  end
end
