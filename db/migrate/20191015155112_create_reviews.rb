class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :reviewee
      t.references :reviewer

      t.timestamps
    end
    add_foreign_key :reviews, :users, column: :reviewee_id
    add_foreign_key :reviews, :users, column: :reviewer_id
  end
end
