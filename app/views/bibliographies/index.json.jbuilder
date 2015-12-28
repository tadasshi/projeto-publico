json.array!(@bibliographies) do |bibliography|
  json.extract! bibliography, :id, :title, :slug, :description, :amazon_afiliate_link, :image
  json.url bibliography_url(bibliography, format: :json)
end
