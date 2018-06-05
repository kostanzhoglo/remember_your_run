$(function () {

  $(".js-month-info").on('click', function() {
    var id = $(this).data("id");

    $.get("/months/" + id + ".json", function(data) {
      // $(".avg_pace-" + id).html(data);
      // $(".month_name-" + id).text(data["name"]);
      $(".month_goal-" + id).html(data["goal"]);
      let output = "";
      $.each(data["runs"], function(key, value) {
        // output += " " + data["goal"]

        $("#run_distance-" + id).append((key + 1) + " distance: " + value.distance + "<br>")
        $("#run_duration-" + id).append((key + 1) + " time: " + value.duration + "<br>")
        $("#run_date-" + id).append((key + 1) + " date:" + value.date + "<br>")
        $("#run_name-" + id).append((key + 1) + " name:" + value.name + "<br>")
        $("#run_container-" + id).append((key + 1) + " pace_per_mile:" + value.pace_per_mile + "<br>")

      });

    });

  });

  function Run(date, name, distance, duration, pace_per_mile) {
    this.date = date
    this.name = name
    this.distance = distance
    this.duration = duration
    this.pace_per_mile = pace_per_mile
  }

});


// $(function () {
//   $(".js-month-info").on('click', function(e) {
//     alert("you clicked this link")
//     e.preventDefault();
//   });
// })
