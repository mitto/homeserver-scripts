# coding: utf-8
require 'httpclient'

url="http://192.168.10.100/sel.html?ClearEvent=Clear+Event+Log"

client = HTTPClient.new
client.set_auth(url, 'admin', 'admin')
client.get_content(url)
