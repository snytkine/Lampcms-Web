$(document).ready(function(){
	$("li.nav a").each(function(){
		if(this.href.search(location.pathname.split("/")[1]) != -1 ){
		$(this).parent("li").addClass("active");
		}
	})
})