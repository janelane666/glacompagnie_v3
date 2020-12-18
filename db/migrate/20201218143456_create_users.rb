class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.datetime :birthdate
      t.string :address
      t.string :zipcode
      t.string :city
      t.string :country
      t.string :phone
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
