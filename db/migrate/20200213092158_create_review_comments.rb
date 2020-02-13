class CreateReviewComments < ActiveRecord::Migration[5.2]
  def change
    create_table :review_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
