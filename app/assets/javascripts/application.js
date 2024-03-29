// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require mask_money
//= require_tree .
function remove_fields(link, name_remove) {
	if (jQuery('.ico-hifen:visible').size()>1){
		$(link).prev("input[type=hidden]").val("1");
    	$(link).closest(".sideBySide").hide();
   	}else{
   		alert('Deve existir pelo menos um '+name_remove);
   	}
}

function add_fields(link, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(".sideBySide:last").after(content.replace(regexp, new_id));
    
}
jQuery(function() {
  jQuery(".pagination a").live("click", function() {
    jQuery.getScript(this.href);
    return false;
  });
  
});
