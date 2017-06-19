namespace :batch do
  task event_crawl: :environment do
    Event.import_events!
  end

  task bot_tweet: :environment do
    Event.where("started_at > ?", Time.current).find_each do |event|
      if event.hackathon_event? && !TwitterBot.exists?(from: event)
        TwitterBot.tweet!(text: event.generate_tweet_text, from: event, options: {lat: event.lat, long: event.lon})
      end
    end
  end
end