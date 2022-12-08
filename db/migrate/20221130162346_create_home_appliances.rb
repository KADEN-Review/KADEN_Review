class CreateHomeAppliances < ActiveRecord::Migration[6.1]
  def change
    create_table :home_appliances do |t|
      t.references :genre, foreign_key: true
      t.string :model_number, null: false

      t.timestamps
    end
  end
end
