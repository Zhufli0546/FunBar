<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/adminIndex.css"/>">
<title>後台管理</title>  
      
</head>
<body id="page-top">

<jsp:include page="admin_header.jsp" />

<!-- Content -->
<div class="container" style="margin-top:10px;margin-bottom:120px">
	<content>
		<div class="overview" style="">
			<div class="date">
        		<p>2018/6/1 <i class="fas fa-caret-right" style="color:#000"></i> 2018/6/13</p>
			</div>
		</div>
		
		<!-- overview -->
		<div class="overviewBox">
             <div class="n3">
                 <h2><i class="fas fa-hand-holding-usd"></i>TOTAL REVENUE</h2>
                 <p style="color:#7ED321">554,540</p>
             </div>

             <div class="n3 sub">
                 <h2><i class="fas fa-boxes"></i>TOTAL COST</h2>
                 <p style="color:#D0021B">12,660</p>
             </div>

             <div class="n3 sub">
                 <h2><i class="fas fa-money-bill-wave"></i>NET INCOME</h2>
                 <p style="color:#4A90E2">41,880</p>
             </div>
         </div>
         
         <!-- activity -->
         <div class="activity" style="margin-top: 30px;">
             <div class="n1">
                 <h2>Activity</h2>
                 <div id="chart"></div>
             </div>
         </div>

         <!-- panel -->
         <div class="n2">
            <!-- panel left -->
		 	            <div class="panel right">
                <h2>Latest Orders</h2>
                <div class="list">
                    <div class="item">
                        <div class="pic">
                            <img src="https://upload.cc/i1/2018/06/18/hHvc0L.png"></div>
                        <div class="info">
                            <h3>Vintage T-shirt</h3>
                            <span><i class="fas fa-clock"></i>2018/6/13 13:42
                            </span>
                            <span><i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Gong Yoo</span>
                        </div>
                        <div class="total">
                            <p>Toatal</p><b>3,200</b>
                        </div>
                    </div>
                    <div class="item">
                        <div class="pic">
                            <img src="https://upload.cc/i1/2018/06/18/hOEJGW.png"></div>
                        <div class="info">
                            <h3>Cowboy Jacket</h3>
                            <span><i class="fas fa-clock"></i>2018/6/13 13:42</span>
                            <span><i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Bangtan
                                Boys</span>
                        </div>
                        <div class="total">
                            <p>Toatal</p><b>3,200</b>
                        </div>
                    </div>
                    <div class="item" style="border-bottom: none">
                        <div class="pic">
                            <img src="https://upload.cc/i1/2018/06/18/3T7qFR.png"></div>
                        <div class="info">
                            <h3>Coach Coat</h3>
                            <span><i class="fas fa-clock"></i>2018/6/13 13:42</span>
                            <span>
                                <i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Super
                                Junior</span>
                        </div>
                        <div class="total">
                            <p>Total</p><b>3,200</b>
                        </div>
                    </div>
                </div>
        </div> 
            <!-- panel right -->
            <div class="panel right">
                <h2>Latest Orders</h2>
                <div class="list">
                    <div class="item">
                        <div class="pic">
                            <img src="https://upload.cc/i1/2018/06/18/hHvc0L.png"></div>
                        <div class="info">
                            <h3>Vintage T-shirt</h3>
                            <span><i class="fas fa-clock"></i>2018/6/13 13:42
                            </span>
                            <span><i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Gong Yoo</span>
                        </div>
                        <div class="total">
                            <p>Toatal</p><b>3,200</b>
                        </div>
                    </div>
                    <div class="item">
                        <div class="pic">
                            <img src="https://upload.cc/i1/2018/06/18/hOEJGW.png"></div>
                        <div class="info">
                            <h3>Cowboy Jacket</h3>
                            <span><i class="fas fa-clock"></i>2018/6/13 13:42</span>
                            <span><i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Bangtan
                                Boys</span>
                        </div>
                        <div class="total">
                            <p>Toatal</p><b>3,200</b>
                        </div>
                    </div>
                    <div class="item" style="border-bottom: none">
                        <div class="pic">
                            <img src="https://upload.cc/i1/2018/06/18/3T7qFR.png"></div>
                        <div class="info">
                            <h3>Coach Coat</h3>
                            <span><i class="fas fa-clock"></i>2018/6/13 13:42</span>
                            <span>
                                <i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Super
                                Junior</span>
                        </div>
                        <div class="total">
                            <p>Total</p><b>3,200</b>
                        </div>
                    </div>
                </div>
        </div>   
	</content>
</div>


<jsp:include page="admin_footer.jsp" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Year', 'Sales', 'Expenses'],
        ['2004', 1000, 400],
        ['2005', 1170, 460],
        ['2006', 660, 1120],
        ['2007', 1030, 540]
    ]);

    var options = {
        title: '',
        height: 346,
        legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart'));

    chart.draw(data, options);
}
</script>
</body>
</html>