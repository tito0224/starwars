require "open-uri"

class CharacterMiner
  def mine
    base_url = "http://starwars.com"
    seed_url = base_url + "/explore/encyclopedia/characters/1/all/"

    doc = Nokogiri::HTML(open(seed_url))

    pagination_links = doc.css("li.fix a").collect { |a| a["href"] }
    pagination_links.each do |link|
      if link != nil 
        doc = Nokogiri::HTML(open(base_url + link))
      end

      doc.css(".js-item").each do |node|
        name = node.css(".h25").text
        short_desc = node.css(".subhead").text
        url = node.css("a")[0]["href"]

        character = Character.find_or_initialize_by(name: name)
        character.update(name: name, short_desc: short_desc, url: url)
        character.save!
      end
    end
  end
end