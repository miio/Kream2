require 'tweetstream'
require 'pusher'
require './kream_common.rb'

TweetStream::Client.new.track('#testmiio', '#miiodev') do |status|
  puts "#{status.id}/#{status.user.id}/#{status.text}"
  pusher_status = {:status_id => status.id, :user_id => status.user.id, :text => status.text}
  Pusher['broadcast'].trigger('an_event', pusher_status)
  KreamPost.transaction do
    t = KreamPost.new
    t.id = status.id
    t.twitter_id = status.user.id
    t.tweet = status.text
    t.tweet_obj = status
    t.save!
  end
end
