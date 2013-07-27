Shadowbox.loadSkin('classic', '/js/shadowbox/skin'); // use the "classic" skin
Shadowbox.loadLanguage('en', '/js/shadowbox/lang'); // use the English language
Shadowbox.loadPlayer(['img', 'iframe', 'qt', 'flv'], '/js/shadowbox/player'); // use img and qt players

function multiOnLoad(){
	MM_preloadImages('/images/about_over.png','/images/resume_over.png','/images/contact_over.png','/images/reel_over.png','/images/youtube_over.png','/images/vimeo_over.png','/images/musicvideos_over.png','/images/shortfilms_over.png','/images/trailers_over.png','/images/featured_over.png','/images/thumbs/twobirds_over.png','/images/thumbs/twobirds1_over.png','/images/thumbnails/anotherway_over.png','/images/thumbnails/anotherway2_over.png','/images/thumbnails/gutter_over.png','/images/thumbnails/reunion_over.png','/images/industry_over.png','/images/thumbnails/spongebob_over.png');
						 Shadowbox.init();
};

window.onload = multiOnLoad;

