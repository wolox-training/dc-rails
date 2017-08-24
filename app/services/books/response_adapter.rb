module Books
  class ResponseAdapter
    def self.book_info(response)
      JSON.parse(response).each do |key, value|
        @book = value
        @book.store(key.split(':')[0].downcase , key.split(':')[1])
      end
      @book.slice('isbn', 'title', 'subtitle', 'number_of_pages', 'authors')
    end
  end
end
