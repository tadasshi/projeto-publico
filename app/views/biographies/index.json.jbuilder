json.array!(@biographies) do |biography|
  json.extract! biography, :id, :title, :description, :image
  json.url biography_url(biography, format: :json)
end
