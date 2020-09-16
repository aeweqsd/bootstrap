
$('#show_login').on('click',function(){
				$('#loginModal').modal('show');
});

		
$(document).on('click', '#show_Register', function () {
	window.open("beforeSignUp","Register","width=800,height=700 location=yes");
});
 $('#Check_overlap').on('click',function(){
	$('#check_info').remove();
	var id =$('#id').val();
	$.ajax('Check_overlap',{
		type:'get',
		dataType:"json",
		data:{
			id:id
			},
		success:function(msg){
			console.log(msg.overlap);
			if(!msg.overlap){
				$('#check').append('<div class="alert alert-success" id="check_info" role="alert">Possible</div>');
			}else{
				$('#check').append('<div class="alert alert-danger"id="check_info" role="alert">check id again</div>');
			}
			
		},
		error:function(request,status,error){
		}
			

		});



	 })