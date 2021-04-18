class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name,      null: false
      t.string :name_kana, null: false
      t.integer :price,     null: false
      t.boolean :availability, null: false, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
