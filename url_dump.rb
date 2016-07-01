class UrlDump
  def self.dump(url)
    File.open('urls.dump', 'a') do |file|
      file.puts url
    end
  end
end
