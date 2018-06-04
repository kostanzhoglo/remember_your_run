# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
  $(".js-next-run").on("click", function() {
    var nextId = parseInt($(".js-next-run").attr("data-id")) + 1;
    $.get("/runs/" + nextId + ".json", function(data) {
      // var run = data;
      $("#runDate").text(data["date"]);
      $("#runName").text(data["name"]);
      $(".runDistance").text(run["distance"]);
      // $(".runPacePerMile").text(run["pace_per_mile"]);
      // $(".runNumberIntervals").text(run["number_intervals"]);
      // $(".runIntervalLength").text(run["interval_length"]);
      // $(".runRestBetween").text(run["rest_between_interval"]);
      // re-set the id to current on the link
      $(".js-next-run").attr("data-id", data["id"]);
    });
  });
});
