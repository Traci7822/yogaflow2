$(document).ready(function() {
  $('.poseBuilder').hide();
  // $('.addMorePoses').click(function() {
  //   var additionalPoses = $('.newSequencePoses').clone();
  //   for (var i = 4; i < additionalPoses.length; i++) {
  //     var id = additionalPoses.find('.poseBuilder')[i].id
  //     var newId = id.slice(0, -1) + (parseInt(id[12]) + 5)
  //     additionalPoses.find('.poseBuilder')[i].id = newId
  //     debugger;
  //   }
    //add another 5 pose selectors
  // })
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
