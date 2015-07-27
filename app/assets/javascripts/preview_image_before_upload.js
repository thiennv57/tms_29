function PreviewImage(image_id) {
  var oFReader = new FileReader();
  oFReader.readAsDataURL($("#user_picture")[0].files[0]);
  oFReader.onload = function(oFREvent) {
    $("#"+image_id).attr("src", oFREvent.target.result);  
  };
}
