class CharacterDetailMiner

  def mine
    base_url = "http://starwars.com"

    characters = Character.all

    characters.each do |character| 
      doc = Nokogiri::HTML(open(base_url + character.url))

      image_url = doc.css(".size5of12 img")[0]["src"]
      puts image_url

      description = []
      doc.css(".biography p").each do |node|
        description << node.text.gsub(/\s+/, " ").strip
      end

      character.update(image_url: image_url, description: description.join("||"))
      character.save!

      puts "Saved #{character.name}"
    end
  end

end
