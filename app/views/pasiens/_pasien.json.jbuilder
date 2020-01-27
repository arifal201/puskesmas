json.extract! pasien, :id, :nik, :name, :alamat, :created_at, :updated_at
json.url pasien_url(pasien, format: :json)
