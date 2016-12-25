$(document).ready(function() {
  $('#poseBuilder').hide();
})

function setValue() {
  $('#poseBuilder').hide();
  var selection_value = $('select[name="sequence[pose_ids][]').val();
  if (selection_value == 'new') {
    $('#poseBuilder').show();
  }
}
