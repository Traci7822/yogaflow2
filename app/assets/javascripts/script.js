$(document).ready(function() {
  $('.poseBuilder').hide();

});

function setValue(poseNumber) {
  for (var i = 0; i < $('.poseBuilder').length; i++) {
    var id = $('.poseBuilder')[i].id
    if (id.slice(-1) == poseNumber) {
      var selection_value = $('select[name="sequence[pose_ids][]')[i].value
      if (selection_value == "new") {
        $("#" + id + ".poseBuilder").show();
      }
    }
  }
}
