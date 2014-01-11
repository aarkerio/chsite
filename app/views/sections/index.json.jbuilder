json.array!(@sections) do |section|
  json.extract! section, :id, :description, :order, :img
  json.url section_url(section, format: :json)
end
