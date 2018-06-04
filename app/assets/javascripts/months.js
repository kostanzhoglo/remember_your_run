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

        console.log("Run " + (key + 1) + " distance: " + value.distance)
        console.log("Run " + (key + 1) + " time: " + value.duration)
        console.log("Run " + (key + 1) + " date:" + value.date)
        console.log("Run " + (key + 1) + " name:" + value.name)
        $(".run_container").append("  Run " + (key + 1) + " pace_per_mile:" + value.pace_per_mile + "<br>")

      });
      $(".test").text(output);

      // $(".month_run_name" + id).text(data["runs"]["name"]);
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
