class MailTemplate
  def self.get(links)
    links = generate_links(links)
    <<~EMAIL
      <p>Hey there, I've found a link. Hopefully it's an a7s!</p>
      <br>
      <br>
      #{links.join('')}
    EMAIL
  end

  def self.generate_links(links)
    links.map.with_index do |link, i|
      "<a href=\"#{link}\" target=\"_blank\">#{i + 1}. Link</a><br>"
    end
  end
end
