class HttpService
  require 'rest-client'

  def initialize(params)
    @uri = params[:uri]
  end

  def get_request
    response = RestClient.get @uri
    response.body
  rescue
    false
  end
end
