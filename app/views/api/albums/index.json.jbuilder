json.array! @albums do |album|
  json.
  extract! album, :id, :title, :description
  json.photos album.photos, :id, :title, :url
end

