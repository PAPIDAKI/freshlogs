json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :price, :note, :tenant_id, :pmu_id
  json.url purchase_url(purchase, format: :json)
end
