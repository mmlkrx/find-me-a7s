require 'nokogiri'
require 'open-uri'

class Scraper
  attr_reader :base_url, :url_path, :page

  class NoA7sError < StandardError; end

  def initialize
    @base_url = ENV['BASE_URL'] || 'http://www.dslr-forum.de/'
    @url_path = ENV['URL_PATH'] || 'forumdisplay.php?f=109&order=desc&page=1'
    @page     = Nokogiri::HTML(open(full_url))
  end

  def find_me_a_cheap_a7s_please
    links = all_offer_links
    links.select! do |link|
      is_about_a7s?(link)
    end
    fail NoA7sError, "Didn't find an a7s :(" if links.empty?
    links.map{|link| link_to_a7s(link) }
  end

  private

  def all_offer_links
    page.css('a').select{|link| link['id'] =~ /thread_title/}
  end

  def full_url
    base_url + url_path
  end

  def is_about_a7s?(link)
    link.text.downcase.include? 'a7s'
  end

  def link_to_a7s(link)
    base_url + link['href']
  end
end
