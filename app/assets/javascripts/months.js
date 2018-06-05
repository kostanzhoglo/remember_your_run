$(function () {

  $(".js-month-info").on('click', function() {
    var id = $(this).data("id");

    $.get(`/months/${id}.json`, function(data) {

      // fetch(`/months/${id}.json`)
      //   .then(res => res.json())
      //   .then(data => (data))

      $(".month_goal-" + id).html(data["goal"]);

      $.each(data["runs"], function(key, value) {

        $("#run_distance-" + id).append((key + 1) + " distance: " + value.distance + "<br>")
        $("#run_duration-" + id).append((key + 1) + " time: " + value.duration + "<br>")
        $("#run_date-" + id).append((key + 1) + " date:" + value.date + "<br>")
        $("#run_name-" + id).append((key + 1) + " name:" + value.name + "<br>")
        $("#run_container-" + id).append((key + 1) + " pace_per_mile:" + value.pace_per_mile + "<br>")

      });

    });

  });

  // function Run(date, name, distance, duration, pace_per_mile) {
  //   this.date = date
  //   this.name = name
  //   this.distance = distance
  //   this.duration = duration
  //   this.pace_per_mile = pace_per_mile
  // }

});




// Something kept breaking where instead of rendering JSON, the functions
//   below were trying to render my application.html.erb page.
// THOUGHTS??

// $(() => {
//   bindClickHandlers()
// })
//
// const bindClickHandlers = () => {
//   $(".js-month-info").on('click', (e) => {
//     var id = $(this).data("id")
//      $.get("/months/" + id + ".json", function(data) {


    // fetch(`/months/${id}.json`)
    //   .then(res => res.json())
    //   .then(data => (data))


//     console.log(data)
//     })
// })
// }
