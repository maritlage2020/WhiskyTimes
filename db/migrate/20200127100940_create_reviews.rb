class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :title
      t.string :image_id
      t.text :body
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
