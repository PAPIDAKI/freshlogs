json.array!(@attendances) do |attendance|
  json.extract! attendance, :id, :shift_list_id, :worker_id
  json.url attendance_url(attendance, format: :json)
end
