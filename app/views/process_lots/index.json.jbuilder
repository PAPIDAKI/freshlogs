json.array!(@process_lots) do |process_lot|
  json.extract! process_lot, :id, :date, :lot, :quantity, :note
  json.url process_lot_url(process_lot, format: :json)
end
