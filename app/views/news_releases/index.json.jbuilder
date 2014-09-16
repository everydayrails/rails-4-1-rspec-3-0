json.array!(@news_releases) do |news_release|
  json.extract! news_release, :id, :title, :released_on, :body
  json.url news_release_url(news_release, format: :json)
end
