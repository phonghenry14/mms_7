//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require jquery_nested_form
//= require_tree .

function check_only_one_checkbox(checkbox) {
  $(checkbox).closest(".table").find("input[type='checkbox']")
    .not(this).prop("checked", false);
  $(checkbox).prop("checked", true)
}
