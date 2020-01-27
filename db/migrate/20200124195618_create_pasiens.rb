class CreatePasiens < ActiveRecord::Migration[5.1]
  def change
    create_table :pasiens do |t|
      t.string :nik
      t.string :name
      t.text :alamat

      t.timestamps
    end
  end
end
