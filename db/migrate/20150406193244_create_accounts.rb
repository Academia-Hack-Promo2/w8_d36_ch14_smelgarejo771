class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :client, index: true, foreign_key: true, null: false
      t.string :number, uniqueness: true, limit: 20, null: false
      t.integer :type, null: false
      t.decimal :balance, null: false

      t.timestamps null: false
    end
  end
end
