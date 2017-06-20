twitter_rest_client = TwitterBot.get_twitter_rest_client
twitter_stream_client = TwitterBot.get_twitter_stream_client

twitter_stream_client.on_event(:follow) do |event|
  follow_user_name = event[:source][:screen_name]
  twitter_rest_client.follow(follow_user_name)
end
# userの情報を取得するAPI(Stream Api)にアクセスする
twitter_stream_client.userstream