json.array!(@examples) do |example|
  json.extract! example, :title, :text, :year
  json.url example_url(example, format: :json)
end
