class CreateValidations < ActiveRecord::Migration
  def change
    create_table :validations do |t|
      t.string :comment
      t.integer :ability_id
      t.integer :user_id
      t.timestamps
    end
  end
end
