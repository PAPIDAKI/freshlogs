json.array!(@workgroups) do |workgroup|
  json.extract! workgroup, :id, :title
  json.url workgroup_url(workgroup, format: :json)
end
