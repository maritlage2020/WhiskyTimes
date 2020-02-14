class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.string :title, null: false
      t.string :review_image_id
      t.text :body, null: false
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
