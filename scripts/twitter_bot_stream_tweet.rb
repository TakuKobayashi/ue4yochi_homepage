twitter_rest_client = TwitterBot.get_twitter_rest_client
twitter_stream_client = TwitterBot.get_twitter_stream_client

twitter_stream_client.track('#ue4yochi', 'blender', 'ue4', 'unreal', 'engine') do |status|
#twitter_stream_client.sample do |status|
  next if status.retweeted? || status.user.screen_name == "ue4BlenderYochi"
  if status.hashtags.any?{|h| h.text == "ue4yochi" }
    twitter_rest_client.retweet(status.id)
    twitter_rest_client.favorite(status.id)
  end
end