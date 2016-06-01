json.array!(@pmus) do |pmu|
  json.extract! pmu, :id, :produce, :village, :location, :size, :plants, :production, :facilities, :certification, :project_id, :latitude, :longitude
  json.url pmu_url(pmu, format: :json)
end
