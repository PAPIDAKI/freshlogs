json.array!(@loose_berries) do |loose_berry|
  json.extract! loose_berry, :id, :purchase_id, :tenant_id, :kg, :note
  json.url loose_berry_url(loose_berry, format: :json)
end
