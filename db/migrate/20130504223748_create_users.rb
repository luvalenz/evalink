class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :university
      t.string :profession
      t.string :job_id
      t.integer :cpp
      t.integer :c
      t.integer :ruby
      t.integer :php
      t.integer :python
      t.integer :company_id
      t.timestamps
    end
  end
end
