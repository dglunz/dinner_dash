json.array!(@address) do |address|
  json.extract! address, :id, :street_name, :street_number,
                         :city, :state, :zip_code
  json.url address_url(address, format: :json)
end
