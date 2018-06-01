$(function () {
  $(".js-month-info").on('click', function() {
    var id = $(this).data("id");
    $.get("/months/" + id + "/info", function(data) {
      $("#avg_pace-" + id).html(data);
    });
  });
});


// $(function () {
//   $(".js-month-info").on('click', function(e) {
//     alert("you clicked this link")
//     e.preventDefault();
//   });
// })
