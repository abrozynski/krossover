json.array!(@rewards) do |reward|
  json.extract! reward, :id, :title, :description, :kredit
  json.url reward_url(reward, format: :json)
end
