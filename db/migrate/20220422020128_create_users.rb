class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, not_null: true
      t.string :email, not_null: true
      t.string :password_digest

      t.timestamps
      t.index :email, name: "index_users_on_email", unique: true
    end
  end
end
