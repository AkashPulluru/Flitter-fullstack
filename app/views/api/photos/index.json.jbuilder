json.array! @photos do |photo|
  json.extract! photo, :id, :title, :description, :url, :created_at
end