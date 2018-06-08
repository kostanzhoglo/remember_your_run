
$(function () {
  // only to be used if js-next-run link doesn't appear when page initially loads.  It does in my app, so this isn't necessary.
  // $(document).on('click', "js-next-run", function () {
  $(".js-next-run").on("click", function() {
    let nextId = parseInt($(".js-next-run").attr("data-id"))
    console.log(nextId)
    $.get(`/runs/${nextId}/next`, function(run) {
      $("#runMessage").text(`You Went for a Run on ${run["date"]}`);
      $("#runDate").text(run["date"]);
      $("#runName").text(run["name"]);
      $("#runDistance").text(run["distance"]);
      $("#runDuration").text(run["duration"]);
      $("#runPacePerMile").text(run["pace_per_mile"]);
      $("#runNumberIntervals").text(run["number_intervals"]);
      $("#runIntervalLength").text(run["interval_length"]);
      $("#runRestBetween").text(run["rest_between_interval"]);
      $("#runNotes").text(run["notes"]);
      // re-set the id to current on the link. Next line gives you access to the following nextId. So you can access the logic of your runs_controller and run.rb NEXT functions.
      $(".js-next-run").attr("data-id", run["id"]);
    });
  });
});
