json.array!(@bibliographies) do |bibliography|
  json.extract! bibliography, :id, :title, :description, :image, :amazon_afiliate_link
  json.url bibliography_url(bibliography, format: :json)
end
