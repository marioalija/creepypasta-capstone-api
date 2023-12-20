class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.integer :user_id
      t.string :name
      t.string :image
      t.string :description
      t.string :category

      t.timestamps
    end
  end
end
