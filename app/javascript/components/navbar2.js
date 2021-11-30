import $ from 'jquery';


const navbarShiz = () => {
	if( 'ontouchstart' in window ){ var click = 'touchstart'; }
	else { var click = 'click'; }


	$('div.burger').on(click, (event) => {

			if( !$(this).hasClass('open') ){ openMenu(); }
			else { closeMenu(); }

	});


	$('div.menu ul li a').on(click, (e) => {
		e.preventDefault();
		closeMenu();
	});
}

const openMenu = () => {

  $('div.circle').addClass('expand');

  $('div.burger').addClass('open');
  $('div.x, div.y, div.z').addClass('collapse');
  $('.menu li').addClass('animate');

  setTimeout( () => {
    $('div.y').hide();
    $('div.x').addClass('rotate30');
    $('div.z').addClass('rotate150');
  }, 70);
  setTimeout( () => {
    $('div.x').addClass('rotate45');
    $('div.z').addClass('rotate135');
  }, 120);
}

const closeMenu = () => {

  $('div.burger').removeClass('open');
  $('div.x').removeClass('rotate45').addClass('rotate30');
  $('div.z').removeClass('rotate135').addClass('rotate150');
  $('div.circle').removeClass('expand');
  $('.menu li').removeClass('animate');

  setTimeout( () => {
    $('div.x').removeClass('rotate30');
    $('div.z').removeClass('rotate150');
  }, 50);
  setTimeout( () => {
    $('div.y').show();
    $('div.x, div.y, div.z').removeClass('collapse');
  }, 70);

}


export { navbarShiz }
