module Books
  class OpenLibraryService
    def book_info(isbn)
      Books::ResponseAdapter
        .book_info(HttpService.new(uri: base_uri + isbn_query(isbn)).request_get)
    end

    private

    def base_uri
      'https://openlibrary.org/api/books'
    end

    def isbn_query(isbn)
      "?bibkeys=ISBN:#{isbn}&format=json&jscmd=data"
    end
  end
end
