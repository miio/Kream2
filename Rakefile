#!/usr/bin/env rake
require './kream_common.rb'
task :migrate do
  ActiveRecord::Migrator.migrate('migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
end
