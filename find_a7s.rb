require './mail_template.rb'
require './mailer.rb'
require './scraper.rb'

scraper = Scraper.new
mailer  = Mailer.new

links = scraper.find_me_a_cheap_a7s_please

email_body = MailTemplate.get(links)

mailer.email_body = email_body

mailer.deliver
