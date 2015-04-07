class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :account, index: true, foreign_key: true, null: false
      t.string :type, limit: 20, null: false
      t.string :origin_acc, limit: 20, null: false
      t.string :destiny_acc, limit: 20, null: false
      t.decimal :amount, null: false
      # t.date :date, null: false

      t.timestamps null: false
    end
  end
end
