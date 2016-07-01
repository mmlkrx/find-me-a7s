require './notification.rb'
require './notifier.rb'
require './scraper.rb'
require './url_dump.rb'

scraper  = Scraper.new
notifier = Notifier.new(user: ENV['USER'], token: ENV['TOKEN'])

urls = scraper.find_me_a_cheap_a7s_please

urls.each { |url| UrlDump.dump(url) }

notification = Notification.new(
                 message: "Hey, I've found #{urls.count} url(s)",
                 title:   'Sony a7s',
                 url:     urls.first,
               )

notifier.notify(notification)
