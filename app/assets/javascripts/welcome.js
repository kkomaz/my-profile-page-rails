$(document).ready(function() {
	$('.main_navigation__hamburger').click(function(e) {
		e.stopPropagation();
		$('.main_navigation__personal-information').toggleClass('active');
	});

	$(document).click(function() {
		$('.main_navigation__personal-information').removeClass('active');
	});
});
