class HttpService
  require 'rest-client'

  def initialize(params)
    @uri = params[:uri]
  end

  def request
    RestClient.get @uri
  rescue
    false
  end
end
