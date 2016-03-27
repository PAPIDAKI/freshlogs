json.array!(@projects) do |project|
  json.extract! project, :id, :title, :details, :expected_completion_date, :tenant
  json.url project_url(project, format: :json)
end
