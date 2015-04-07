class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, presence: true, limit: 20, null: false
      t.string :last_name, presence: true, limit: 20, null: false
      t.integer :credential, presence: true, uniqueness: true, null: false
      t.text :addres, presence: true, null: false
      t.string :local_phone, presence: true, limit: 11, null: false
      t.string :movil_phone, limit: 11, null: true

      t.timestamps null: false
    end
  end
end
