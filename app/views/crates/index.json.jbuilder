json.array!(@crates) do |crate|
  json.extract! crate, :id, :tenant_id, :driver_id, :from_pmu_id, :to_pmu_id, :crates, :note
  json.url crate_url(crate, format: :json)
end
