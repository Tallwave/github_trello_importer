require "net/http"
require "json"

module TrelloImporter
  class Importer
    def initialize(json_file, owner, repo, token)
      @json_file = json_file
      @owner = owner
      @repo = repo
      @token = token
    end

    def import
      file_contents = read_file @json_file
      import_json(file_contents) unless file_contents.nil?
    end

    private

    def import_json(json_obj)
      if json_obj.class == Hash
        if json_obj["cards"].nil?
          puts "Could not find 'cards' key"
        else
          all_cards = json_obj["cards"]
          import_json_array all_cards
        end
      else
        puts "Unknown object: #{json_obj.class}"
      end
    end

    def import_json_array(json_array)
      json_array.each do |json_hash|
        import_json_hash json_hash
      end
    end

    def import_json_hash(trello_hash)
      gh_hash = TrelloImporter::Mapper.map_from_trello trello_hash
      create_issue(gh_hash)
    end

    def create_issue(json_obj)
      uri = TrelloImporter.make_uri @owner, @repo, @token
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.scheme == "https"
      request = Net::HTTP::Post.new uri.request_uri
      request.content_type = "application/json"
      request.body = json_obj.to_json
      handle_response http.request(request)
    end

    def read_file(filename)
      path = full_path filename
      if File.exist? path
        raw_text = File.read path
        JSON.parse raw_text
      else
        handle_missing_file path
        nil
      end
    end

    def full_path(filename)
      return filename if File.dirname(filename) != "."
      "#{Dir.pwd}/#{filename}"
    end

    def handle_response(response)
      error_handler = ErrorHandler.new
      if error_handler.response_has_error response
        error_handler.handle_error error_handler.error_message(response.body), true
      end
    end

    def handle_missing_file(filename)
      puts "Cannot open file: #{filename}"
    end
  end
end
