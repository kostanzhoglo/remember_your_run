$(function () {

  $(".js-month-info").on('click', function(e) {
    e.preventDefault()
    history.pushState(null, null, "months")
    // getMonths()
    var id = $(this).data("id");
    $.get(`/months/${id}.json`, function(data) {
      $('.month_container-' + id).html('')
      $(".month_goal-" + id).html(data["goal"]);
      monthTable();
      // $.each(data["runs"], function(key, value) {
      data["runs"].forEach(run => {
        let newRun = new Run(run)
        let runRowHtml = newRun.formatRuns()
        // $('.month_container-' + id).append(runRowHtml)
        $('.myTable tr:last').after(runRowHtml)
      });
      $('.month_container-' + id).append(`</table>`)
    });
  });
});

$(function () {
  $('month_form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();
    alert("we r hack3rz");
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

Run.prototype.formatRuns = function() {
  let runHtml = `
    <tr>
      <td><a href="/runs/${this.id}">${this.date}</a></td>
      <td>${this.name}</td>
      <td>${this.distance}</td>
      <td>${this.duration}</td>
      <td>${this.pace_per_mile}</td>
      <td>${this.number_intervals}</td>
      <td>${this.interval_length}</td>
      <td>${this.rest_between_interval}</td>
      <td>${this.notes}</td>
    </tr>
  `
  return runHtml
}

let monthTable = function() {
  var id = $(".js-month-info").data("id");
  $('.month_container-' + id).append(`
    <table class="myTable">
      <tr>
        <th>Date</th>
        <th>Name</th>
        <th>Distance (Miles)</th>
        <th>Time</th>
        <th>Pace / Mile</th>
        <th>Number of Intervals</th>
        <th>Interval Length</th>
        <th>Rest Between Intervals</th>
        <th>Notes</th>
      </tr>
    `)
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
//     e.preventDefault()
//     console.log('hello')

//     var id = $(this).data("id")
//      $.get("/months/" + id + ".json", function(data) {
    // fetch(`/months/${id}.json`)
    //   .then(res => res.json())
    //   .then(data => (data))


//     console.log(data)
//     })

//   })
// }
