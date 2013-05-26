class CreateVotacions < ActiveRecord::Migration
  def change
    create_table :votacions do |t|
      t.boolean :done
      t.integer :user_id
      t.integer :expertise_id
      t.timestamps
    end
  end
end
