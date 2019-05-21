class CreateQas < ActiveRecord::Migration[5.2]
  def change
    create_table :qas do |t|
      t.references :episode
      t.integer :order_in_episode
      t.string :question
      t.string :answer
      t.string :soundfile

      t.timestamps
    end
  end
end
