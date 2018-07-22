$(document).ready(function(){

	$('.nested-fields').on('cocoon:after-remove'),function(){
		console.log('====>Cocoon Item inserted');
	};

	//1
	$(document).on('keyup','.nested-fields',function(){
		console.log('==========');
		console.log('Hello WLIF');
		var mixed_count = $('.mixed_weight').length;
		// if (mixed_count.lenth>=1){
			// console.log(mixed_count.item(0));
			// console.log(mixed_count.item(1));
		// }
		console.log(mixed_count);

		
		// console.log(mixed_weight[2]);
		var thiss =$(this);
		// var parent_nested_item=thiss.parent('.nested-fields');
		var q = this.val();
		// console.log(q);

	// });


 		
		// $('.weighing_line_item_fields').keyup(function(){

		

		// $(function() {
		//     $("#price, #qty").keyup(function() {
		//         var p = $("#price").val();
		//         var q = $("#qty").val();
		//         $("#amount").val(q * p);
		//     });
		// });
 // $('.weighing_line_item_fields').on('cocoon:before_insert',function(){

	    // $(".mixed_weight,.crates,.crate_weight,.palets,.palet_weight").keyup(function(){
 		


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
			 // $('.weighing_line_item_fields').on('cocoon:before_insert',function(){
				 $('#kg').val(net_weight);
				 $('#plastics').val(crates);
				  $('#crates').val(crates);
				  console.log("Bye now!")
			// });

	    });
	// });
	   
	
 
 });
