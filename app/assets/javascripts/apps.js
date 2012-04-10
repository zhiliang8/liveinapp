//= require jquery.autogrow
//= require jquery.rating
$(function(){
	$('#app-tab textarea').autogrow();
	// $('#app-star').rating();
	$("#latest-news h2 a").toggle(function() {
	  $("#latest-news #news-form").show();
	}, function(){
	  $("#latest-news #news-form").hide();
	})
	$("#latest-news #news-form .cancel").click(function() {
	  $("#latest-news h2 a").click();
	})
})
