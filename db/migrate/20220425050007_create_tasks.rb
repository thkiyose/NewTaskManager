class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title, not_null:true
      t.text :detail
      t.integer :importance, not_null:true
      t.date :limit
      t.references :user

      t.timestamps
    end
  end
end
