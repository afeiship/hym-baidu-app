require "json"
require "uri"
require "net/http"
require "logger"

# https://ruby-doc.org/stdlib-2.1.3/libdoc/net/http/rdoc/Net/HTTP.html

config = "/Users/feizheng/git-oschina/backup-mac-files/auto-sign-security/baidu-app/config_fei.json"
uri = URI("https://mmall.baidu.com/mall/api/task/do-sign")
cookie = JSON.parse File.read(config)

# 输出到指定文件
logger = Logger.new("./logs/do-sigin.log", "daily")
logger.level = Logger::INFO
logger.datetime_format = "%Y-%m-%d %H:%M:%S"

# http:
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

# request:
req = Net::HTTP::Post.new(uri)
req["Cookie"] = URI.encode_www_form(cookie)

# send request:
res = http.request(req)
logger.info res.body
