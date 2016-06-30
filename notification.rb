class Notification
  attr_reader :message, :title, :url

  def initialize(message:, title: "", url: "")
    @message = message
    @title   = title
    @url     = url
  end
end
