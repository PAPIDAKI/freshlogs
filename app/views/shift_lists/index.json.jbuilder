json.array!(@shift_lists) do |shift_list|
  json.extract! shift_list, :id, :course_id, :tenant_id, :start_at, :end_at, :note
  json.url shift_list_url(shift_list, format: :json)
end
