json.array! @events do |event|
  json.extract! event, :id, :name, :description, :start_date, :end_date
end
