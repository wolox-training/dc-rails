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
    external_book = ExternalBook.create(
      isbn: isbn,
      data: Books::OpenLibraryService.new.book_info(isbn)
    )
    store external_book_id: external_book.id.to_s
  end
end
