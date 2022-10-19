class CreateWishes < ActiveRecord::Migration[6.1]
  def change
    create_table :wishes do |t|
      t.string :title,    null: false
      t.boolean :success, null: false, default: false

      t.timestamps
    end
  end
end
