json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :name, :email
  json.url newsletter_url(newsletter, format: :json)
end
