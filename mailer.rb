require 'mail'

class Mailer
  attr_accessor :email_body

  def initialize
    Mail.defaults do
      delivery_method :sendmail
    end
  end

  def deliver
    $fu_mail_gem = email_body
    Mail.deliver do
      from    'myawesome@scraper.bot'
      to      'mmloker@gmail.com'
      subject "Looks like I've found something"
      body    $fu_mail_gem
    end
  end
end
