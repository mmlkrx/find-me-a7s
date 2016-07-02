class UrlDump
  def self.dump(url)
    File.open('urls.dump', 'a') do |file|
      file.puts url
    end
  end

  def self.find(url)
    File.open('urls.dump', 'a+') do |file|
      url = file.lazy.select do |line|
              line.include?(url)
            end.first
      url.nil? ? nil : url[0..-2]
    end
  end
end
