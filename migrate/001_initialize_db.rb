class InitializeDb < ActiveRecord::Migration
	def up
		create_table :kream_tracking_tables do |t|
			t.string	:tag
		end
		create_table :kream_posts do |t|
			t.integer	:twitter_id
			t.string	:tweet
			t.text		:tweet_obj
			t.timestamps
		end
		create_table :kream_recorders do |t|
			t.datetime	:start_date
			t.datetime	:end_date
		end
	end
end
