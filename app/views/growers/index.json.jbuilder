json.array!(@growers) do |grower|
  json.extract! grower, :id, :name, :address, :phone, :mobile, :vat, :picture
  json.url grower_url(grower, format: :json)
end
