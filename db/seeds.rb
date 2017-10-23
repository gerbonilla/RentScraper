#immobilienscout24
url = "https://www.immobilienscout24.de/Suche/S-/P-1/Wohnung-Miete/Berlin/Berlin"
html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

page_numbers = html_doc.search('option').children.last.text.to_i

page_numbers.times do |page|
  puts "Currently on page #{page+1}"
  url = "https://www.immobilienscout24.de/Suche/S-/P-#{page + 1}/Wohnung-Miete/Berlin/Berlin"
  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)
  html_doc.search('.result-list-entry__data').each do |element|
    begin
  # description
  description_container = element.children[1].children[0]
  description = ""
  description_container.children.each { |a| description = a.inner_text if a.text?}

  # address
  address_container = element.children[2]
  address_link = address_container.children[1]
  address = address_link.children[0].children.text

  # rent
  info_container = element.children[3].children[1]
  rent = info_container.children[0].children[0].children[0].text
  if rent[0...-2][-3] == "," || rent[0...-2][-3] == "."
    rent = rent.gsub(/\D/, '').to_i
  else
    rent = rent.gsub(/\D/, '').to_i * 100
  end

  # size
  size = info_container.children[0].children[1].children[0].text
  if size.include?(",") || size.include?(".")
    size = size.gsub(/\D/, '').to_f / 100
  else
    size = size.gsub(/\D/, '').to_f
  end

  # rooms
  rooms = info_container.children[0].children[2].children[0].text
  if rooms.include?(",") || rooms.include?(".")
    rooms = rooms.gsub(/\D/, '').to_f / 100
  else
    rooms = rooms.gsub(/\D/, '').to_f
  end

  # source
  source = "www.immobilienscout24.de"

  # source_id
  source_id = element.children[1].attribute('data-go-to-expose-id').value

  # tags
  tags=[]
  element.css('li').each {|tag| tags << tag.text }

  Flat.create!(description: description, address: address, rent_cents: rent, size: size, rooms: rooms, source: source, source_id: source_id, tags: tags)
  puts "Flat Created #{rent}"
rescue
  puts "there was an error and could not save the flat"
end
end

end


