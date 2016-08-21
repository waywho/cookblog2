class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :content
      t.string :keywords
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :recipes, :user_id
  end
end
