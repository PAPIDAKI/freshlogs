$(document).ready(function(){

	$('.weighing_line_item_fields').keyup(function(){


		// $(function() {
		//     $("#price, #qty").keyup(function() {
		//         var p = $("#price").val();
		//         var q = $("#qty").val();
		//         $("#amount").val(q * p);
		//     });
		// });
	    // $(".mixed_weight,.crates,.crate_weight,.palets,.palet_weight").keyup(function(){
	 		
	 		// var thiss= $(this);
	 		// var parent_nested_item=thiss.parent('.nested-fields'),
	 		// var mixed_weight= parent_nested_item.find('.mixed_weight').val();
	 		var mixed_weight=$('.mixed_weight').val();
	 		var crates = $('.crates').val();
	 		//get values from preseted inputs 
	 		var crate_weight=$('.crate_weight').val();
	 		var palets =$('.palets').val();
	 		var palet_weight=$('.palet_weight').val();
			
				console.log(mixed_weight);
				console.log(crates);
				console.log(crate_weight);
				console.log(palets);
				console.log(palet_weight);
			var net_weight=(mixed_weight-(crates*crate_weight)-(palets*palet_weight));    
			    console.log(net_weight);
			 var mixed_crate_weight=(mixed_weight/crates);
				 console.log(mixed_crate_weight);
			 $('.out').text(net_weight);  
			 $('.mixed_crate_weight').text(mixed_crate_weight);
			 $('.lot_plastics').text(crates);

			 //fill up net kg and plastics on lot form 
			 //for posting to server 
			 //temporary out of use for updating to heroku
			 $('#kg').val(net_weight);
			 $('#plastics').val(crates);
			  $('#crates').val(crates);
			// });

	    });
	   
	
 
 });