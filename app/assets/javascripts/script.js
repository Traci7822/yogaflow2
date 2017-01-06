$(document).ready(function() {
  $('.poseBuilder').hide();

  if (window.location.hash && window.location.hash == '#_=_') {
    window.location.hash = '';
    window.location.href = window.location.href.split('#')[0]
  }

  $('body').on('change', '#sequence_options', function() {
    window.location = window.location + "sequence/" + this.value
  });

  $("#go-back").on('click', function() {
    window.location = "http://localhost:3000"
  });
});

function setValue(poseNumber) {
  for (var i = 0; i < $('.poseBuilder').length; i++) {
    var id = $('.poseBuilder')[i].id
    if (id.slice(-1) == poseNumber) {
      var selection_value = $('select[name="sequence[pose_ids][]')[i].value
      if (selection_value == "new") {
        $("#" + id + ".poseBuilder").show();
      } else {
        $("#" + id + ".poseBuilder").hide();
      }
    }
  }
}
