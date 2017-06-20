twitter_rest_client = TwitterBot.get_twitter_rest_client
twitter_stream_client = TwitterBot.get_twitter_stream_client

twitter_stream_client.track('#ue4yochi', 'blender', 'ue4', 'unreal', 'engine') do |status|
  p status.to_json
end