$(document).ready(function(){
  $("#isbn-form")
  .submit(function (ev) {
    ev.preventDefault();
    $.ajax({
      url: '/api/v1/books/isbn',
      type: 'post',
      data: JSON.stringify({ book: { isbn: $("#book_isbn")[0].value}}),
      contentType: 'application/json',
      dataType: 'json',
      success: function(data,status) {
        getBookInfo(data.request);
      }
    });
    return false;
  })

  var getBookInfo = function(jobId) {
    return $.ajax({
      url: '/api/v1/books/isbn_status',
      type: 'post',
      data: JSON.stringify({ worker: { id: jobId }}),
      contentType: 'application/json',
      dataType: 'json',
      success: function(data,status) {
        addBook(data.data);
        showTable();
      },
      error: function (xhr,status,error) {
        setTimeout(function (){
          getBookInfo(jobId);
        }, 2000);
      }
    });
  }

  var addBook = function(bookData) {
    let newRecord = `<tr><td>${bookData.title}</td><td>${bookData.subtitle}</td>
    <td>${bookData.authors[0].name}</td><td>${bookData.isbn}</td>
    <td>${bookData.number_of_pages}</td></tr>`;
    $('#book-table tr:last').after(newRecord);
  }

  var showTable = function() {
    $('#book-table').css("display", "block");
  };
});
