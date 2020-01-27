class Pasien < ApplicationRecord
    validates :nik, presence: true, uniqueness: true
    validates :name, presence: true 
    validates :alamat, presence: true
end
