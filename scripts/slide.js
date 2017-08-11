//everything's a global because i'm lazy and this is all the JS on the page anyways
slidenum = 0; // number of slides
slidelinks = []; //empty array for slide links
slideid = ""; // slideshow id
slide = 0; // current slide
function setslideshow(rid, rslidenum,rslidelinks ) {
	slideid = rid;
	slidenum = rslidenum;
	slidelinks = rslidelinks
	slidetimer = setInterval(next,5000);
	upd();
}

function upd() {	
	document.getElementById(slideid).style.backgroundImage = "url('" + slidelinks[slide] + "')";
	clearInterval(slidetimer);
	slidetimer = setInterval(next,5000);
}
function prev() {
	if (slide > 0) {
		slide--;
	} else {
		slide = slidenum-1;
	}
	upd();
}
function next() {
	if (slide < slidenum-1) {
		slide++;
	} else {
		slide = 0;
	}
	upd();
}

