$(document).on("turbolinks:load",function(){$(".alert, .notice").delay(4e3).fadeOut(1e3),$(".rating").raty({path:"/assets",scoreName:"comment[rating]"}),$(".rated").raty({path:"/assets",readOnly:!0,score:function(){return $(this).attr("data-score")}}),$(".img-zoom").elevateZoom()});