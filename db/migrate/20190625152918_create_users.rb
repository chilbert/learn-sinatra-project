class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :username
      u.string :password
      u.string :first_name
      u.string :last_name
    end
  end
end
