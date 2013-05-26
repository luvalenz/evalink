class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :name
      t.string :description
      t.integer :user_id
      t.string :area
      t.timestamps
    end
  end
end
