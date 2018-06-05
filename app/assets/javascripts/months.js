$(function () {

  $(".js-month-info").on('click', function() {
    var id = $(this).data("id");

    $.get(`/months/${id}.json`, function(data) {

      // fetch(`/months/${id}.json`)
      //   .then(res => res.json())
      //   .then(data => (data))
      $('#run_container-' + id).html('')
      $(".month_goal-" + id).html(data["goal"]);

      // $.each(data["runs"], function(key, value) {
      data["runs"].forEach(run => {
        console.log(run)
      // })

        // $("#run_distance-" + id).append((key + 1) + " distance: " + value.distance + "<br>")
        // $("#run_duration-" + id).append((key + 1) + " time: " + value.duration + "<br>")
        // $("#run_date-" + id).append((key + 1) + " date:" + value.date + "<br>")
        // $("#run_name-" + id).append((key + 1) + " name:" + value.name + "<br>")
        // $("#run_container-" + id).append((key + 1) + " pace_per_mile:" + value.pace_per_mile + "<br>")

      });
    });
  });
});

function Run(run) {
  this.id = run.id
  this.date = run.date
  this.name = run.name
  this.distance = run.distance
  this.duration = run.duration
  this.pace_per_mile = run.pace_per_mile
  this.number_intervals = run.number_intervals
  this.interval_length = run.interval_length
  this.rest_between_interval = run.rest_between_interval
  this.notes = run.notes
}


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
