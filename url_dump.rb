class UrlDump
  def self.dump(url)
    File.open('urls.dump', 'a') do |file|
      file.puts url
    end
  end

  def self.find(url)
    File.open('urls.dump', 'a+') do |file|
      file.lazy.select do |line|
        line.include?(url)
      end.first
    end
  end
end
