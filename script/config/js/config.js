
$(function(){
	
	$(".left ul").children(":first").addClass("current").children().children(":first").removeClass("left_table_tr_td_div_left")
	.addClass("left_table_tr_td_div_left_hidden")
	.next().removeClass("left_table_tr_td_div_left_hidden")
	.addClass("left_table_tr_td_div_left");

		$(".nav .nav_li ul li").children(":first")
		.removeClass("bbb")
		.addClass("vvv");
		
	
	$(".left ul a").click(function(){
		$(this).siblings().removeClass("current");
		$(this).siblings().each(function(){
			$(this).children().children(":first")
			.removeClass("left_table_tr_td_div_left_hidden")
			.addClass("left_table_tr_td_div_left")
			.next().removeClass("left_table_tr_td_div_left")
			.addClass("left_table_tr_td_div_left_hidden");
			
		});
		
		$(this).addClass("current");
		$(this).children().children(":first").removeClass("left_table_tr_td_div_left")
		.addClass("left_table_tr_td_div_left_hidden")
		.next().removeClass("left_table_tr_td_div_left_hidden")
		.addClass("left_table_tr_td_div_left");
		
	});
	
	$(".nav .nav_li ul li").click(function(){
		$("#mycom").removeClass("mycom").addClass("mycom1");
		$(this).siblings().each(function(){
			$(this).children(":first")
			.removeClass("vvv")
			.addClass("bbb");
			
		});
		$(this).children(":first")
		.removeClass("bbb")
		.addClass("vvv");	
	});
	
	
	

	

	
});