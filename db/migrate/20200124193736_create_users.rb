class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nik
      t.string :name
      t.string :alamat

      t.timestamps
    end
  end
end
