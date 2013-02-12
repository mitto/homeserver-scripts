# coding: utf-8
require 'pp'
require 'httpclient'
require 'optparse'

connection_setting = {
  :uri => '',
  :port => 80,
  :username => '',
  :password => '',
  :auth => false
}

option = OptionParser.new do |opt|
  opt.version = '0.0.1'
  opt.on('--uri VALUE', '接続するURIを指定') do |v|
    connection_setting[:uri] = v
  end
  opt.on('-p VALUE', '--port VALUE', '接続先のポート番号を指定') do |v|
    connection_setting[:port] = v.to_i
  end
  opt.on('-u VALUE', '--username VALUE', '認証用のユーザー名を指定') do |v|
    connection_setting[:username] = v
  end
  opt.on('-p VALUE', '--password VALUE', '認証用のパスワードを指定') do |v|
    connection_setting[:password] = v
  end
  opt.on('--auth', '認証を使う場合に指定') do |v|
    connection_setting[:auth] = v
  end
end

begin
  option.permute!(ARGV)
rescue => exception
  puts exception
  abort
end


begin
  client = HTTPClient.new
  client.set_auth(connection_setting[:uri], connection_setting[:username], connection_setting[:password]) if connection_setting[:auth]
  client.get_content(connection_setting[:uri])
rescue
end
