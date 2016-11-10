json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :year, :payble, :note, :tenant_id
  json.url agreement_url(agreement, format: :json)
end
