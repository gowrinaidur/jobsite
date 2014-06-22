json.array!(@admins) do |admin|
  json.extract! admin, :id, :status
  json.url admin_url(admin, format: :json)
end
