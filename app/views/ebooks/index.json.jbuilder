json.array!(@ebooks) do |ebook|
  json.extract! ebook, :id, :title, :description, :image, :value
  json.url ebook_url(ebook, format: :json)
end
