class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :genre_id
      t.integer :home_appliance_id, null: false
      t.integer :score
      t.string :star
      t.string :review_title, null: false
      t.text :review_contents, null: false
      t.timestamps
    end
  end
end
