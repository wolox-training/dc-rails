class ExternalRequestWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(isbn)
    external_book = ExternalBook.create(
      isbn: isbn,
      data: Books::OpenLibraryService.new.book_info(isbn)
    )
    if external_book.valid?
      store external_book_id: external_book.id.to_s
    else
      raise external_book.errors.to_s
  end
end
