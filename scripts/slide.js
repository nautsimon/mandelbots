//everything's a global because i'm lazy and this is all the JS on the page anyways
slidenum = 9; // number of slides
slidelinks = ["pics/Picture1.png","pics/Picture2.jpg","pics/Picture3.jpg","pics/Picture4.png","pics/Picture5.png","pics/Picture6.jpg","pics/Picture7.jpg","pics/Capture.PNG","pics/Picture9.png"]; //empty array for slide links
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

