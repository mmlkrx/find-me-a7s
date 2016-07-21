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
      url.nil? ? nil : strip_newline(url)
    end
  end

  private

  def strip_newline(string)
    string[0..-2]
  end
end
