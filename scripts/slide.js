slide = 0;
i = 0;
slidetimer = setInterval(next,2000);
function upd() {
	i = 0;
	while (i < s) {
		if (i == slide) {
			document.getElementById("img" + i.toString()).style.display = "block";
		} else {
			document.getElementById("img" + i.toString()).style.display = "none"; 
		}
		i++;
	}
	clearInterval(slidetimer);
	slidetimer = setInterval(next,2000);
}
function prev() {
	if (slide > 0) {
		slide--;
	} else {
		slide = s-1;
	}
	upd();
}
function next() {
	if (slide < s-1) {
		slide++;
	} else {
		slide = 0;
	}
	upd();
}

