function toggle_subject(){
  $("#toggle-btn").bind("click", function(){
    $(this).parent().parent().siblings("div").toggle();
    if($(this).text() == "Hide"){
      $(this).text("Show");
    }else{
      $(this).text("Hide");
    }
  });
}
$(document).ready(function(){
  toggle_subject();
});
