class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
