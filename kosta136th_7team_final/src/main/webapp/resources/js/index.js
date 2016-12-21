
$(document).ready(function() {
	var options = {
		videoId: 'H9P_wkq08XA', 
		//videoId: 'TYa9JNicEts',
		start: 10
	};

	$('#wrapper').tubular(options);
	
<<<<<<< HEAD
});
=======
}); 

function getEmail() {
	
	var email = $("#email").val();
	var pattern = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	if( pattern.test(email) ) 
	{
		alert("메일 주소가 올바르게 입력되었습니다." + email);
		$.ajax({
			type : 'post',
			url : '/getEmail',
			headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method_Overrride" : "POST",
			},
			dataType : 'text',
			data : JSON.stringify(email),
		});
	} 
	else 
	{
		alert("메일 주소가 유효하지 않습니다." + email);
	}
	
}

>>>>>>> refs/remotes/origin/master
