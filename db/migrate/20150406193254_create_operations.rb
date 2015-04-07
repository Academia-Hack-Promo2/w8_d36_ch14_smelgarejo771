class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.references :account, index: true, foreign_key: true, null: false
      t.string :type, presence: true, limit: 20, null: false
      t.string :origin_acc, presence: true, limit: 20, null: false
      t.string :destiny_acc, presence: true, limit: 20, null: false
      t.decimal :amount, presence: true, null: false
      # t.date :date, null: false

      t.timestamps null: false
    end
  end
end
