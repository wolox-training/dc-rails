class HttpService
  require 'rest-client'

  def initialize(params)
    @uri = params[:uri]
  end

  def request
    begin
      RestClient.get @uri
    rescue
      false
    end
  end
end
