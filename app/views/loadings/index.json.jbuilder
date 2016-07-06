json.array!(@loadings) do |loading|
  json.extract! loading, :id, :date, :customer, :eta, :delivered
  json.url loading_url(loading, format: :json)
end
