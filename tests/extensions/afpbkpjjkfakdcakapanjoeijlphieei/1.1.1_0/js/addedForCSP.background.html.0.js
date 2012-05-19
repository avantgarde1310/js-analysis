
	if ((localStorage["init"]!="false") && (localStorage["init"]!=false)) {
	  chrome.tabs.create({
							url      : "http://bg-mains-b.appspot.com/r/1.1/r/", 
							selected : true
						 })
	  
	  localStorage["exver"] = "1.1";
	  localStorage["init"]  = false;
	} else {
	  if (localStorage["exver"]!="1.1") {
		 chrome.tabs.create({
							  url      : "http://bg-mains-b.appspot.com/r/1.1/r/", 
							  selected : true
							 })
		 localStorage["exver"]= "1.1";  
	  }
	}
