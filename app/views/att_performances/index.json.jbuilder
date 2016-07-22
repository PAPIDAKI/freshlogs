json.array!(@att_performances) do |att_performance|
  json.extract! att_performance, :id, :attendance_id, :tenant_id, :work_position, :cartons_packed, :late_arrival, :early_leave
  json.url att_performance_url(att_performance, format: :json)
end
