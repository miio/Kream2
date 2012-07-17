require 'tweetstream'
require 'pusher'
require './kream_common.rb'

TweetStream::Client.new.track('j-pop', '#miiodev') do |status|
  puts "#{status.id}/#{status.user.id}/#{status.text}"
  pusher_status = {
    :status_id => status.id,
    :user_id => status.user.id,
    :user_name => status.user.name,
    :screen_name => status.user.screen_name,
    :text => status.text,
    :profile_img => status.user.profile_image_url,
    :client => status.source
  }
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
