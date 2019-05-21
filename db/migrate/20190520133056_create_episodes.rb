class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.references :drama, foreign_key: true
      t.string :episode
      t.timestamps

      t.index [:drama_id, :episode], unique: true

    end
  end
end
