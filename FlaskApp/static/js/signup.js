
// Handle the successful return from the API call
function onSuccess(data) {
	name = data["firstName"] + " " + data["lastName"];
	console.log(name);
	console.log(data);
}

// Handle an error response from the API call
function onError(error) {
	console.log(error);
}

// Use the API call wrapper to request the member's basic profile data
function getProfileData() {
	alert('getting data');
	IN.API.Raw("/people/~").result(onSuccess).error(onError);
	/*IN.API.Profile("me").fields("first-name", "last-name","email-address").result(
		function (data) {
			console.log(data);
		}).error(function (error) {
			console.log(error);
		});*/
}
function onLinkedInLoad (){
	if (IN.User.isAuthorized()){
		getProfileData();
	}
	else {
		console.log("Could not be authorized");
	}
	//IN.EVENT.on(IN, "auth", getProfileData);
	//alert('here');
	/*$.ajax({
		url: '/signUpLinkedIn',
		data: $('form').serialize(),
		type: 'POST',
		success: function(response) {
			console.log(response);
		},
		error: function(error) {
			console.log(error);
		}
	});*/
}
$(function() {
    $('#btnSignUp').click(function() {
 
        $.ajax({
            url: '/signUp',
            data: $('form').serialize(),
            type: 'POST',
            success: function(response) {
                console.log(response);
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
	var linkedInInfo = {
		response_type: 'code',
		client_id: '750xw4xmip7wuc',
		redirect_uri: 'http://localhost:5000',
		state: 'DCEeFWf45A53sdfKef424'
	};
	var url_start = 'https://www.linkedin.com/uas/oauth2/authorization?';
	$('#linkedinButton').click(function() {
		event.preventDefault();
		IN.User.authorize(onLinkedInLoad);

/* 		request_url = url_start + decodeURIComponent($.param(linkedInInfo,true));

		popupWindow = window.open(request_url,'_self');
		alert(window.location.href);
		popupWindow.addEventListener('load', 
			function(){
				alert('here');
				var callback_url = popupWindow.location.href;
				alert(callback_url)
			});
		console.log('there'); */
	});
	

});