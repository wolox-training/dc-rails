$(document).ready(function(){
  $("#suggestion-form")
    .on("ajax:success", function(e, data, status, xhr) {
      addSuggestion(getFormData());
      showTable();
    })
    .on("ajax:error", function(e, xhr, status, error) {
      console.log(e, xhr, status, error);
    });

  var showTable = function() {
    $('#suggestion-table').css("display", "block");
  };

  var getFormData = function(){
    return $('form').serializeArray().slice(2,9);
  };

  var addSuggestion = function(suggestions) {
    let newRecord = '<tr>'
    suggestions.map(function(s){
      newRecord = `${newRecord}<td>${s.value}</td>`;
    });
    newRecord = newRecord + '</tr>';
    $('#suggestion-table tr:last').after(newRecord);
  }
});
