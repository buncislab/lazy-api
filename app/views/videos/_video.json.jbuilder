json.extract! video, :id, :title, :url, :description, :user_id, :kelas_id, :created_at, :updated_at
json.url video_url(video, format: :json)
