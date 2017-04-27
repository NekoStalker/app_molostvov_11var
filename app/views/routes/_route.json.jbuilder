json.extract! route, :id, :rname, :city_id, :rdesc, :rprice, :created_at, :updated_at
json.url route_url(route, format: :json)
