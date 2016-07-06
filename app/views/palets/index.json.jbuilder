json.array!(@palets) do |palet|
  json.extract! palet, :id
  json.url palet_url(palet, format: :json)
end
