json.array!(@events) do |event|
  json.extract! event, :id, :name, :user_id, :description, :date, :active
  json.url event_url(event, format: :json)
end
