class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :genre_id, null: false
      t.integer :home_appliance_id, null: false
      t.string :star
      t.text :review_contents
      t.timestamps
    end
  end
end
