//= require jquery


$(document).on('click', '.btn-add-subrole', function(e) {
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

document.addEventListener("DOMContentLoaded", function() {
  const clickableRows = document.querySelectorAll('.clickable-row');
  clickableRows.forEach(row => {
    row.addEventListener('click', function() {
      window.location.href = this.dataset.href;
    });
  });
});