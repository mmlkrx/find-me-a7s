require 'mail'

class Mailer
  attr_accessor :email_body

  def deliver
    mail = Mail.new do
      from    'myawesome@scraper.bot'
      to      'mmloker@gmail.com'
      subject "Looks like I've found something"
      body    email_body
    end

    mail.delivery_method :sendmail

    mail.deliver
  end
end
