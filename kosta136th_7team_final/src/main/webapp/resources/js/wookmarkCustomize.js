(function ($) {

      var handler = null;
      var page = 1;
      var isLoading = false;
      var $loaderCircle = $('#loaderCircle');
      var search_type = $("#sel1").find(":selected").val();
      var lastdno = "";
      
      var options = {
            autoResize : true,
            offset : 30,
            outerOffset : 40,
            itemWidth : 440,
      };

      // 스크롤이 계속 내려갈때마다 데이터를 요청한다.
      function onScroll(event) {

        if(!isLoading) {
          // 윈도우 브라우저의 높이가 100 남았을때 데이터를 추가로 받는다
          var closeToBottom = ($(window).scrollTop() + $(window).height() > $(document).height() - 100);
          if (closeToBottom) {
            loadData();
          }
        }

      };

      // 모든 이미지가 로딩되면 레이아웃을 초기화함
      function applyLayout() {

        var wookmark = undefined;
        var container = '#container';
        
        lastdno = $(".scrolling:last").attr("data-dno");
        
        imagesLoaded(container, function () {

          if (wookmark === undefined) {
            wookmark = new Wookmark(container, options);
          } else {
            wookmark.initItems();
            wookmark.layout(true);
          }

        });

      };
      
      // AJAX로 API에 데이터 요청함
      function loadData() {

        var apiURL = 'dealer/dealerPageList';
        
        isLoading = true;
        $loaderCircle.show();
       
        $.ajax({
        	
        	type : 'post',  // 요청 method 방식 
            url : apiURL,// 요청할 서버의 url
            headers : { 
                "Content-Type" : "application/json",
                "X-HTTP-Method-Override" : "POST"
            },
            dataType : 'json', // 서버로부터 되돌려받는 데이터의 타입을 명시하는 것이다.
            data : JSON.stringify({ // 서버로 보낼 데이터 명시 
                dno : lastdno
            }),
        
            success : onLoadData
          
        });

      };

      // 받아온 API를 HTML에 뿌림
      function onLoadData(data) {

        isLoading = false;
        $loaderCircle.hide();

        // 계속 로딩될때마다 페이지 숫자가 올라감
        page++;

        // HTML 뷰에 뿌려줌
        var html = '';
        var image;
		var str = "";

		if(data != null){
			
			$.each(data, function(){
	    	    str += "<li>";
	    	    str += "<p class=" + "'scrolling'"  + "data-dno='"+ this.dealer_page_num + "'>" + this.dealer_page_num + "</p>";
	            str += "<p>" + this.user_nickName + "</p>";
	            str += "<p>" + this.category + "</p>";
	            str += "<p>" + this.like_count + "</p>";
	        	str += "</li>";
			}); 
		
		
//        for(var i=0; i<data.length; i++) {      	
//          image = data[i];
//          html += '<li>';
//          html += '  <img src="'+image.preview+'" width="400" height="'+Math.round(image.height/image.width*200)+'">';
//          html += '  <p>'+image.User_nickName+'</p>';
//          html += '  <p>'+image.Category+'</p>';
//          html += '  <p>'+image.Like_count+'</p>';
//          html += '</li>';
//        }
			
//		$(".listToChange").empty();

        $("#container").append(str);
     
        applyLayout();
        
		} else {
			alert("없어 샹");
		}
		
    };
      
      $(document).bind('scroll', onScroll);

      loadData();
           
})(jQuery);