# creates an array of objects with id, name, and address
json.array! @restaurants do |restaurant|
  json.extract! restaurant, :id, :name, :address
end
