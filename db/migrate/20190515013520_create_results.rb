class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :user, foreign_key: true

      t.references :qa, foreign_key: true
      t.string :result

      t.timestamps
      t.index [:user_id, :qa_id, :result], unique: true
    end
  end
end
