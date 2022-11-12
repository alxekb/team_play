class CreateHalls < ActiveRecord::Migration[7.0]
  def change
    create_table :halls do |t|
      t.string :address
      t.integer :capacity
      t.string :name
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
