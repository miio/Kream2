#-*- encoding: utf-8 -*- 
require 'sinatra'
require 'erb'
require './kream_config.rb'

get '/' do
  @pusher_key = Pusher.key
  erb :index
end
