class CreateExpertises < ActiveRecord::Migration
  def change
    create_table :expertises do |t|
      t.string :area
      t.string :institution
      t.string :cargo
      t.integer :positive
      t.integer :negative
      t.integer :user_id

      t.timestamps
    end
  end
end
