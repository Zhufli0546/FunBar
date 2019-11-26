$(document).ready(function() {

		totalPrice = 0;
		for (let i = 0; i < $(".pd").length; i++) {
			unitPrice = $(".unit").eq(i).text();
			var disc = $(".hallin").eq(i).text(); //折扣
			var dec = disc / 10;

			number = $(".num").eq(i).val();

			subTotal = unitPrice * number * dec;

			var int_subTotal = parseInt(subTotal);
			$(".pd").eq(i).text(int_subTotal);
			totalPrice = totalPrice + int_subTotal;
		}

		$(".totalAmount").text(totalPrice);

		var totalPrice;

		//數量減少
		$(".minus").click(function() {
			var index = $(this).data("product");
			var num = $(this).siblings(".num").val();
			num--;
			$(this).siblings(".num").val(num < 1 ? 1 : num);
			var unitPrice = $(".unit").eq(index).text(); //單價
			var disc = $(".hallin").eq(index).text(); //折扣
			var dec = disc / 10;

			if (num < 1) {
				alert('哪有人買零個的啦！');
				num = 1;
			}
			//小計   
			var smallPrice = unitPrice * num * dec;
			var int_smallPrice = parseInt(smallPrice);
			$(".pd").eq(index).text(int_smallPrice);

			//總計  
			totalPrice = 0;
			for (let i = 0; i < $(".pd").length; i++) {
				unitPrice = $(".unit").eq(i).text();
				var disc = $(".hallin").eq(i).text();
				var dec = disc / 10;
				number = $(".num").eq(i).val();

				subTotal = unitPrice * number * dec;
				var int_subTotal = parseInt(subTotal);
				totalPrice = totalPrice + int_subTotal;

				var url = "/FunBar/"
				$.ajax({
					url : "http://localhost:8080" + url + "changecart",
					data : {
						count : number,
						productId : $(".pdid").eq(i).val()
					},
					type : "POST",
					dataType : "JSON",
					success : function() {
					}
				})
			}
			$(".totalAmount").text(totalPrice);

		})

		//數量增加
		$(".add").click(function() {
			var index = $(this).data("product");
			var num = $(this).siblings(".num").val();
			num++;
			var stc = $(".theStock").eq(index).text();
			$(this).siblings(".num").val(num > 50 ? 50 : num);	
			$(this).siblings(".num").val(num > stc? stc : num);
			var unitPrice = $(".unit").eq(index).text();
			var disc = $(".hallin").eq(index).text(); //折扣
			var dec = disc / 10;
					
			if (num >50 ) {
				if(num > stc){
					alert("選購數量不可大於庫存！");
					num = stc;
				}else{
					alert("數量不得超過50份！");
					num = 50;
				}
			
			}else if(num > stc){
				if(num >50){
					alert("數量不得超過50份！")
					num = 50;
				}
				alert("選購數量不可大於庫存！");
					num = stc;
				return;
			}
			
			var smallPrice = unitPrice * num * dec;
			var int_smallPrice = parseInt(smallPrice);
			$(".pd").eq(index).text(int_smallPrice);
			

			//總計
			totalPrice = 0;
			for (let i = 0; i < $(".pd").length; i++) {
				unitPrice = $(".unit").eq(i).text();
				var disc = $(".hallin").eq(i).text();
				var dec = disc / 10;

				number = $(".num").eq(i).val();
				
				subTotal = unitPrice * number * dec;
				var int_subTotal = parseInt(subTotal);
				totalPrice = totalPrice + int_subTotal;

				var url = "/FunBar/";
				$.ajax({
					url : "http://localhost:8080" + url + "changecart",
					data : {
						count : number,
						productId : $(".pdid").eq(i).val(),
					},
					type : "POST",
					dataType : "JSON",
					success : function() {
					}
				})
			}
			$(".totalAmount").text(totalPrice);

		})

		//input欄位輸入數量
		$(".num").blur(function() {
			var index = $(this).data("product");
			var unitPrice = $(".unit").eq(index).text();
			var num = $(".num").eq(index).val();
			var stc = $(".theStock").eq(index).text();
			var disc = $(".hallin").eq(index).text(); //折扣
			var dec = disc / 10;
			var smallPrice;
			
			
			
			if (num>stc) {
				alert("數量不得超過庫存!");

				var smallPrice = unitPrice * stc * dec;
				var int_smallPrice = parseInt(smallPrice);
				$(".pd").eq(index).text(int_smallPrice);

				totalPrice = 0;
				for (let i = 0; i < $(".pd").length; i++) {
					unitPrice = $(".unit").eq(i).text();
					number = $(".num").eq(i).val();

					if (number > stc) {
						number = stc;
					}
					var disc = $(".hallin").eq(i).text();
					var dec = disc / 10;
					$(this).val(stc); 

					subTotal = unitPrice * number * dec;
					var int_subTotal = parseInt(subTotal);
					totalPrice = totalPrice + int_subTotal;

					var url = "/FunBar/"
					$.ajax({
						url : "http://localhost:8080" + url + "changecart",
						data : {
							count : number,
							productId : $(".pdid").eq(i).val()
						},
						type : "POST",
						dataType : "JSON",
						success : function() {
						}
					})
				}
				$(".totalAmount").text(totalPrice);
			}else if (num > 50) {
				alert("數量不得超過50份!");

				var smallPrice = unitPrice * 50 * dec;
				var int_smallPrice = parseInt(smallPrice);
				$(".pd").eq(index).text(int_smallPrice);

				totalPrice = 0;
				for (let i = 0; i < $(".pd").length; i++) {
					unitPrice = $(".unit").eq(i).text();
					number = $(".num").eq(i).val();

					if (number > 50) {
						number = 50;
					}
					var disc = $(".hallin").eq(i).text();
					var dec = disc / 10;
					$(this).val(50); //輸入的數字大於50，當下的input設為50

					subTotal = unitPrice * number * dec;
					var int_subTotal = parseInt(subTotal);
					totalPrice = totalPrice + int_subTotal;

					var url = "/FunBar/"
					$.ajax({
						url : "http://localhost:8080" + url + "changecart",
						data : {
							count : number,
							productId : $(".pdid").eq(i).val()
						},
						type : "POST",
						dataType : "JSON",
						success : function() {
						}
					})
				}
				$(".totalAmount").text(totalPrice);
			} else if (num < 1) {
				

				alert("數量不得小於1!");

				var smallPrice = unitPrice * 1 * dec;
				var int_smallPrice = parseInt(smallPrice);
				$(".pd").eq(index).text(int_smallPrice);

				totalPrice = 0;
				for (let i = 0; i < $(".pd").length; i++) {
					unitPrice = $(".unit").eq(i).text();
					number = $(".num").eq(i).val();

					if (number < 1) {
						number = 1;
					}
					var disc = $(".hallin").eq(i).text();
					var dec = disc / 10;
					$(this).val(1);
	
					subTotal = unitPrice * number * dec;
					var int_subTotal = parseInt(subTotal);
					totalPrice = totalPrice + int_subTotal;

					var url = "/FunBar/"
					$.ajax({
						url : "http://localhost:8080" + url + "changecart",
						data : {
							count : number,
							productId : $(".pdid").eq(i).val()
						},
						type : "POST",
						dataType : "JSON",
						success : function() {
						
						}
					})
				}

				$(".totalAmount").text(totalPrice);
			}else if (num > stc){
				alert("數量不得超過庫存!");

				var smallPrice = unitPrice * num * dec;
				var int_smallPrice = parseInt(smallPrice);
				$(".pd").eq(index).text(int_smallPrice);

				totalPrice = 0;
				for (let i = 0; i < $(".pd").length; i++) {
					unitPrice = $(".unit").eq(i).text();
					number = $(".num").eq(i).val();

					if (number > stc) {
						number = stc;
					}
					var disc = $(".hallin").eq(i).text();
					var dec = disc / 10;
					$(this).val(stc); //輸入的數字大於庫存，當下的input設為庫存數

					subTotal = unitPrice * number * dec;
					var int_subTotal = parseInt(subTotal);
					totalPrice = totalPrice + int_subTotal;

					var url = "/FunBar/"
					$.ajax({
						url : "http://localhost:8080" + url + "changecart",
						data : {
							count : number,
							productId : $(".pdid").eq(i).val()
						},
						type : "POST",
						dataType : "JSON",
						success : function() {
						}
					})
				}
				$(".totalAmount").text(totalPrice);			
			}else {

				var smallPrice = unitPrice * num * dec;
				var int_smallPrice = parseInt(smallPrice);
				$(".pd").eq(index).text(int_smallPrice);

				totalPrice = 0;
				for (let i = 0; i < $(".pd").length; i++) {
					unitPrice = $(".unit").eq(i).text();
					number = $(".num").eq(i).val();
					var disc = $(".hallin").eq(i).text();
					var dec = disc / 10;
					$(this).val();

					subTotal = unitPrice * number * dec;
					var int_subTotal = parseInt(subTotal);
					totalPrice = totalPrice + int_subTotal;
					console.log(subTotal);

					var url = "/FunBar/"
					$.ajax({
						url : "http://localhost:8080" + url + "changecart",
						data : {
							count : number,
							productId : $(".pdid").eq(i).val()
						},
						type : "POST",
						dataType : "JSON",
						success : function() {
							console.log(number);
							console.log("success");
						}
					})
				}

				$(".totalAmount").text(totalPrice);

			}

		})
		

		
})