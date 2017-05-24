$(document).on('turbolinks:load', function(){
    $(".alert, .notice").delay(4000).fadeOut(1000);
    $(".rating").raty({ path: "/assets", scoreName: "comment[rating]"});
    $(".rated").raty({ path: "/assets", 
    	readOnly: true,
    	score: function() {
      		return $(this).attr("data-score");
        }
    });
    $(".img-zoom").elevateZoom();
});
    
    
