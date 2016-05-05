$(function() {
	var linkedInInfo = {
		response_type: 'code',
		client_id: '750xw4xmip7wuc',
		redirect_uri: 'http://localhost:5000',
		state: 'DCEeFWf45A53sdfKef424'
	};
	full_url = 'https://www.linkedin.com/uas/oauth2/authorization?response_type=code&client_id=750xw4xmip7wuc&redirect_uri=http://localhost:5000&state=DCEeFWf45A53sdfKef424'
	var url_start = 'https://www.linkedin.com/uas/oauth2/authorization?';
	$('#linkedinButton').click(function() {
		request_url = url_start + decodeURIComponent($.param(linkedInInfo,true));

		console.log(request_url);
		console.log(full_url);
		window.open(request_url);
	});
		
});