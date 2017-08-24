class HttpService
  require 'rest-client'

  def initialize(params)
    @uri = params[:uri]
  end

  def request_get
    response = RestClient.get @uri
    response.body
  rescue
    false
  end
end
