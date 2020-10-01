/*!
 * Start Bootstrap - SB Admin 2 v3.3.7+1 (http://startbootstrap.com/template-overviews/sb-admin-2)
 * Copyright 2013-2016 Start Bootstrap
 * Licensed under MIT (https://github.com/BlackrockDigital/startbootstrap/blob/gh-pages/LICENSE)
 */
$(function() {
	$('#side-menu').metisMenu();
});
$(function() {
	console.log("emtpy");
	if (title_nav == "") {
		$(".page-header").html("Welcome to YEDAM!!");
	}
})
// Loads the correct sidebar on window load,
// collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
	$(window).bind(
					"load resize",
					function() {
						var topOffset = 50;
						var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
						if (width < 768) {
							$('div.navbar-collapse').addClass('collapse');
							topOffset = 100; // 2-row-menu
						} else {
							$('div.navbar-collapse').removeClass('collapse');
						}

						var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
						height = height - topOffset;
						if (height < 1)
							height = 1;
						if (height > topOffset) {
							$("#page-wrapper").css("min-height", (height) + "px");
						}
					});

	var url = window.location;
	var path = window.location.pathname;
	// var element = $('ul.nav a').filter(function() {
	// return this.href == url;
	// }).addClass('active').parent().parent().addClass('in').parent();
	var element = $('ul.nav a').filter(
			function() {

				if (this.href == url) {
					if (title_nav) {
						console.log("==========="+title_nav);
					}
					console.dir($(this));
					$(".page-header").html($(this).parent().parents("li").find("a:first").text() + "▶" + $(this).html() + ":" + title_nav);
					// var heading1 = $(".panel-heading").html();
					// $(".panel-heading").html($(this).html() + title_nav)
				}
				return this.href == url;

			}).addClass('active').parent();

	while (true) {
		if (element.is('li')) {
			element = element.parent().addClass('in').parent();
		} else {
			break;
		}
	}
});
