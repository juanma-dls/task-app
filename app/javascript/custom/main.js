//= require jquery


$(document).on('click', '.btn-add-subrole', function(e) {
  console.log("hola")
  e.preventDefault();
  var form = $(this).closest('form');
  var fields = form.find('.user-subrole:first').clone();
  form.find('.user-subrole:last').after(fields);
});

$(document).on('click', '.btn-remove-subrole', function(e) {
  e.preventDefault();
  var form = $(this).closest('form');
  var fieldsCount = form.find('.user-subrole').length;
  if (fieldsCount > 1) {
    $(this).closest('.user-subrole').remove();
  }
});