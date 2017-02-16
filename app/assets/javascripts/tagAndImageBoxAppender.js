$(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper1         = $(".input_fields_wrap1"); //Fields wrapper
    var wrapper2         = $(".input_fields_wrap2"); //Fields wrapper

    $("#add_field_button1").click(function(e) {
      e.preventDefault();
      $(wrapper1).append('<div><input class="string url required" type="url" name="artifact[image_url][]" id="artifact_image_url" required="required" aria-required="true" > <a href="#" class="remove_field"><i class="fa fa-trash"></i></a></div>'); //add input box
    });

    $("#add_field_button2").click(function(e) {
      e.preventDefault();
      $(wrapper2).append('<div></i><input style="width:20%;display:inline-block;" class="string optional" type="text" name="artifact[content_tag][]" id="artifact_content_tag"><a href="#" class="remove_field"> <i class="fa fa-trash"></i></a></div>'); //add input box
    });
    $(wrapper1).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault();
        $(this).parent('div').remove();
    })
    $(wrapper2).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault();
        $(this).parent('div').remove();
    })
});