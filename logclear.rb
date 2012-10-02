# coding: utf-8
require 'httpclient'

client = HTTPClient.new
url = ARGV[0].to_s
user = ARGV[1].to_s
password = ARGV[2].to_s

unless url.empty?
  client.set_auth(url, user, password)
  client.get_content(url)
end
