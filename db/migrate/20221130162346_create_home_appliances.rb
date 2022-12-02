class CreateHomeAppliances < ActiveRecord::Migration[6.1]
  def change
    create_table :home_appliances do |t|
      t.integer :review_id
      t.integer :genre_id, null: false
      t.string :model_number, null: false
      t.string :body_size

      t.timestamps
    end
  end
end
