json.array!(@metaphors) do |metaphor|
  json.extract! metaphor, :id, :title, :slug, :description
  json.url metaphor_url(metaphor, format: :json)
end
