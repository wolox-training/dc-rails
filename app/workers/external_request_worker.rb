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
