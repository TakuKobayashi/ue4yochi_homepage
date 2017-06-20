twitter_rest_client = TwitterBot.get_twitter_rest_client
twitter_stream_client = TwitterBot.get_twitter_stream_client

tracking_users = [
  "historia_Inc",
  "ProposerTogebu",
  "EpicGames",
  "blenderjp",
  "UnrealEngineJP",
  "GhostBrain3dex",
  "YuukiOgino",
  "muripo_life",
  "rarihoma"
]

keywords = [
  '#ue4yochi',
  'blender',
  'ue4',
  'unreal',
  'engine',
  'atnd'
]

twitter_stream_client.track(keywords) do |status|
#twitter_stream_client.sample do |status|
  next if status.retweeted? || status.user.screen_name == "ue4BlenderYochi"
  if status.hashtags.any?{|h| h.text == "ue4yochi" }
    twitter_rest_client.retweet(status.id)
    twitter_rest_client.favorite(status.id)
  else
    tweet_text = ApplicationRecord.basic_sanitize(status.text).downcase
    if keywords.any?{|keyword| tweet_text.include?(keyword) } && tracking_users.include?(status.user.screen_name)
      twitter_rest_client.retweet(status.id)
      twitter_rest_client.favorite(status.id)
    end
  end
end