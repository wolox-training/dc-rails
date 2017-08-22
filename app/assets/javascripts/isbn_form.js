$(document).ready(function(){
  $("#isbn-form")
  .on("ajax:success", function(ev, data, status, xhr) {
    showTable();
  })
  .on("ajax:error", function(ev, xhr, status, error) {
    console.log(e, xhr, status, error);
  });

  var showTable = function() {
    $('#book-table').css("display", "block");
  };
});
