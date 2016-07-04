require "net/https"

class Notifier
  def initialize(user:, token:)
    @url   = URI.parse("https://api.pushover.net/1/messages.json")
    @req   = Net::HTTP::Post.new(url.path)
    @res   = Net::HTTP.new(url.host, url.port)
    @user  = user
    @token = token
  end

  def notify(notification)
    req.set_form_data({
      :token   => token,
      :user    => user,
      :title   => notification.title,
      :message => notification.message,
      :url     => notification.url,
      })

    res.use_ssl = true
    res.verify_mode = OpenSSL::SSL::VERIFY_PEER
    res.start { |http| http.request(req) }
  end

  private

  attr_reader :user, :token, :url, :req, :res
end
