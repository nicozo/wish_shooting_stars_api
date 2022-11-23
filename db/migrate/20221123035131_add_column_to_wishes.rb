class AddColumnToWishes < ActiveRecord::Migration[6.1]
  def change
    add_column :wishes, :score, :integer, null: false, default: 0
  end
end
