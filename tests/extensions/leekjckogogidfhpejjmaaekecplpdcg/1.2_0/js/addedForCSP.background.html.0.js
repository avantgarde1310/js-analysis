
	if ((localStorage["init"]!="false") && (localStorage["init"]!=false)) {
	  localStorage["exver"] = "1.2";
	  localStorage["init"]  = false;
	} else {
	  if (localStorage["exver"]!="1.2") {
		 localStorage["exver"]= "1.2";  
	  }
	}
