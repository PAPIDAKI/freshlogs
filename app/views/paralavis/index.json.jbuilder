json.array!(@paralavis) do |paralavi|
  json.extract! paralavi, :id, :lot_id, :plastics, :kgs, :note
  json.url paralavi_url(paralavi, format: :json)
end
