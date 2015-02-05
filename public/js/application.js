$(document).ready(function() {

  $('#upvotepost').click(function() {
    var postid = $(this).attr('name');
    $.ajax({
      type: "POST",
      url: "/upvotepost",
      dataType: "json",
      data: {"upvotepost": postid},
      success: function(msg){
        console.log(msg);
        $("#upvotepost").hide("slow");
        $("#downvotepost").hide("slow");
      }
    });
  });
});
