$(function () {

  $(".js-month-info").on('click', function() {
    var id = $(this).data("id");
    $.get("/months/" + id + "/info", function(data) {
      $("#avg_pace-" + id).text(data);
    });
  });

});
