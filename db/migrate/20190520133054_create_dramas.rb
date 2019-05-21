class CreateDramas < ActiveRecord::Migration[5.2]
  def change
    create_table :dramas do |t|
      t.string :title_japanese
      t.string :title_english
      t.integer :year
      t.integer :month
      t.string :drama_url

      t.timestamps
    end
  end
end
