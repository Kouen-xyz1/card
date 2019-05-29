class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :encrypted_password, :string, null: true, default: nil
  end
end
