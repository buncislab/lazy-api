json.extract! materi, :id, :title, :file, :description, :user_id, :kelas_id, :created_at, :updated_at
json.url materi_url(materi, format: :json)
