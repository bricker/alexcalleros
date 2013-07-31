Shadowbox.loadSkin('classic', '/js/shadowbox/skin'); // use the "classic" skin
Shadowbox.loadLanguage('en', '/js/shadowbox/lang'); // use the English language
Shadowbox.loadPlayer(['img', 'iframe', 'qt', 'flv'], '/js/shadowbox/player'); // use img and qt players

function multiOnLoad(){ Shadowbox.init(); };

window.onload = multiOnLoad;

