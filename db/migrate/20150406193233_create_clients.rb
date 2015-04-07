class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, limit: 20, null: false
      t.string :last_name, limit: 20, null: false
      t.integer :credential, uniqueness: true, null: false
      t.text :addres, null: false
      t.string :local_phone, limit: 11, null: false
      t.string :movil_phone, limit: 11, null: true

      t.timestamps null: false
    end
  end
end
