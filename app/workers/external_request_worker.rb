require 'sidekiq'
require 'sidekiq-status'

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|

    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes # default
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|

    chain.add Sidekiq::Status::ServerMiddleware, expiration: 30.minutes # default
  end
  config.client_middleware do |chain|

    chain.add Sidekiq::Status::ClientMiddleware, expiration: 30.minutes # default
  end
end

class ExternalRequestWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(isbn)
    ExternalBook.create( worker_id: self.jid, isbn: isbn, data: Books::OpenLibraryService.new.book_info(isbn))
  end
end
