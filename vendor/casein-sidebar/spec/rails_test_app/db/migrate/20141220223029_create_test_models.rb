class CreateTestModels < ActiveRecord::Migration
  def change
    create_table :test_models do |t|
      html5_fields = %w( search telephone date datetime datetime_local month week url email color time number range )
      html5_fields.each do |fld|
        t.string "my_#{fld}"
      end
      t.timestamps null: false
    end
  end
end
