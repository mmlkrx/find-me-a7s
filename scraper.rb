require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader :url

  def initialize(url)
    @url  = URI.parse(url)
    @page = Nokogiri::HTML(open(url))
  end

  def find_me_a_cheap_a7s_please
    links = links_to_offers
    links.select! do |link|
      is_about_a7s?(link)
    end
    return links if links.empty?
    links.map { |link| link_to_a7s(link) }
  end

  private

  attr_reader :page

  def links_to_offers
    page.css('a').select{|link| link['id'] =~ /thread_title/}
  end

  def is_about_a7s?(link)
    link.text.downcase.include? '7s'
  end

  def link_to_a7s(link)
    url.scheme + '://' + url.host + '/' + link['href']
  end
end
