json.array!(@institutions) do |institution|
  json.extract! institution, :id, :name, :email, :phone, :website, :description, :website
  json.url institution_url(institution, format: :json)
end
