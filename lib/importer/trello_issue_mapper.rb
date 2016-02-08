module TrelloImporter
  class Mapper
    def self.map_from_trello(trello_hash)
      body = "#{trello_hash["name"]}<br><br>#{trello_hash["desc"]}<br><br><a href=\"#{trello_hash["url"]}\">View on Trello.</a>"

      {"body" => body, "title" => trello_hash["name"]}
    end
  end
end
