$(function () {

  $(".js-month-info").on('click', function() {
    var id = $(this).data("id");

    $.get("/months/" + id + ".json", function(data) {
      // $(".avg_pace-" + id).html(data);
      // $(".month_name-" + id).text(data["name"]);
      $(".month_goal-" + id).html(data["goal"]);
      let output = "";
      $.each(data["runs"], function(key, value) {
        output += " " + data["goal"]

        console.log(key + " : " + value.distance)
        console.log(key + " : " + value.duration)
        console.log(key + " : " + value.date)
        console.log(key + " : " + value.name)
        console.log(key + " : " + value.pace_per_mile)

      });
      $(".test").text(output);

      // $(".month_run_name" + id).text(data["runs"]["name"]);
    });

  });

});


// $(function () {
//   $(".js-month-info").on('click', function(e) {
//     alert("you clicked this link")
//     e.preventDefault();
//   });
// })
