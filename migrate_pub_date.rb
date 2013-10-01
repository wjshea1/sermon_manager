#!/usr/bin/ruby
require 'rubygems'
require 'mysql2'


TimeFmtStr="%Y-%m-%d %H:%M:%S"
client = Mysql2::Client.new(:host => "localhost", :username => "root", :database =>
    "cc_rails_db")

client2 = Mysql2::Client.new(:host => "us-cdbr-east-04.cleardb.com", :username => "b4d307d3294233", :password =>"1443e59e",:database =>
    "ad_5eb6722885d57c7")


client2.query("select * from sermon").each do |row|
	client.query("update sermon set publish_date='#{row['pub_date']}' where audio_url = '#{row['audio_file_location']}'") 
end
client2.close
client.close
