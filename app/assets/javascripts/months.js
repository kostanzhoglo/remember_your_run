$(function () {

  $(".js-month-info").on('click', function() {
    var id = $(this).data("id");

    $.get("/months/" + id + ".json", function(data) {
      // $(".avg_pace-" + id).html(data);
      // $(".month_name-" + id).text(data["name"]);
      $(".month_goal-" + id).html(data["goal"]);
      $.each(data, function(key, value) {
        console.log(key + " : " + value)
      });


      // $(".month_run_name" + id).text(data["run"]["name"]);
    });

  });

});


// $(function () {
//   $(".js-month-info").on('click', function(e) {
//     alert("you clicked this link")
//     e.preventDefault();
//   });
// })
