$(() => {

  $(".js-month-info").on('click', function(e) {
    e.preventDefault()
    history.pushState(null, null, "months")
    const id = $(this).data("id");
    $.get(`/months/${id}.json`, (month) => {
      $('.month_container-' + id).html('')
      $('.month_attributes-' + id).html('')
      const newMonth = new Month(month)
      const monthInfo = newMonth.formatMonth()
      $('.month_attributes-' + id).append(monthInfo)

      monthTable(id);
      month["runs"].forEach(run => {
        const newRun = new Run(run)
        const runRowHtml = newRun.formatRuns()
        $('.myTable tr:last').after(runRowHtml)
      });
      // $('.month_container-' + id).append(`</table>`)
    });
  });


  // $('input').removeAttr('data-disable-with')
  $('.new_run_form').submit(function(e) {
    e.preventDefault();
    const values = $(this).serialize();
    const posting = $.post(`${this.action}`, values);
    posting.done(function(run) {
      const newRun = new Run(run)
      const runRowHtml = newRun.formatRuns()
      $('#display_month tbody').append(runRowHtml)
    });
  });

});

function Month(month) {
  this.id = month.id
  this.name = month.name
  this.year = month.year
  this.goal = month.goal
  this.month_mileage = month.month_mileage
  this.month_pace = month.month_pace
}

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

Month.prototype.formatMonth = function() {
let monthInfo = `
    <p>Goal: ${this.goal}</p>
    <p>Mileage: ${this.month_mileage}</p>
    <p>Month Average Pace: ${this.month_pace}</p>
    <strong><a href="/months/${this.id}">Make a New Run for This Month</a><strong>
    `
  return monthInfo
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

let monthTable = function(id) {
  // var id = $(".js-month-info").data("id");
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
