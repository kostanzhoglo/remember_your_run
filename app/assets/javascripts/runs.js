
$(function () {
  $(".js-next-run").on("click", function() {
    var nextId = parseInt($(".js-next-run").attr("data-id")) + 1;
    // console.log(nextId)
    $.get("/runs/" + nextId + ".json", function(run) {
      // var run = data;
      $("#runDate").text(run["date"]);
      $("#runName").text(run["name"]);
      $("#runDistance").text(run["distance"]);
      $("#runDuration").text(run["duration"]);
      $("#runPacePerMile").text(run["pace_per_mile"]);
      $("#runNumberIntervals").text(run["number_intervals"]);
      $("#runIntervalLength").text(run["interval_length"]);
      $("#runRestBetween").text(run["rest_between_interval"]);
      // re-set the id to current on the link
      $(".js-next-run").attr("data-id", run["id"]);
    });
  });


});
