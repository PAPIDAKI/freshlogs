json.array!(@workers) do |worker|
  json.extract! worker, :id, :name, :mobile, :tenant_id, :course_id
  json.url worker_url(worker, format: :json)
end
