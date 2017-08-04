RSpec.shared_context 'Response Body' do
  def parsed_response_body
    JSON.parse(response.body)
  end
end
