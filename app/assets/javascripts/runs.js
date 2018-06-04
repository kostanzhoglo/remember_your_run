
$(function () {
  $(".js-next-run").on("click", function() {
    var nextId = parseInt($(".js-next-run").attr("data-id")) + 1;
    console.log(nextId)
    $.get("/runs/" + nextId + ".json", function(data) {
      // var run = data;
      $("#runDate").text(data["date"]);
      $("#runName").text(data["name"]);
      $(".runDistance").text(data["distance"]);
      // $(".runPacePerMile").text(run["pace_per_mile"]);
      // $(".runNumberIntervals").text(run["number_intervals"]);
      // $(".runIntervalLength").text(run["interval_length"]);
      // $(".runRestBetween").text(run["rest_between_interval"]);
      // re-set the id to current on the link
      $(".js-next-run").attr("data-id", data["id"]);
    });
  });


});
