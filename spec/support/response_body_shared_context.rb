module Response
  module JSONParser
    def parsed_response_body
      JSON.parse(response.body)
    end
  end
end
