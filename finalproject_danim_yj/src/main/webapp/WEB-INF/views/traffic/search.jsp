<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function () {
		//alert("1");
		
		$("#trafficForm").submit(function () {
			/* $("#trafficForm :input[name=area_name]").val($("#areaName").val()); */
			$("#trafficForm :input[name=kind]").val($("#kind").val());
			$("#trafficForm :input[name=terminal_no]").val($("#terminalName").val());
			$("#trafficForm :input[name=station_no]").val($("#stationName").val());
			$("#trafficForm :input[name=end_area]").val($("#endAreaName").val());
		});
		if($("#searchArea").html()=="")
		{
			$.ajax({
				type:"get",
				url:"searchArea.do",
				dataType:"json",
				success:function(area){
					//alert(jsonData[0].area_name);
					var selectArea ="<select id='areaName'>";
					selectArea += "<option value=''>출발지를 선택하세요</option>";
					for(var i = 0 ; i < area.length; i++)
					{
						selectArea += "<option value="+area[i].area_name+">"+area[i].area_name+"</option>";
					}
					selectArea += "</select>";
					$("#searchArea").html(selectArea);
					/////////////////////////////////////
					$("#areaName").change(function () {
						$("#searchKind").html("");
						$("#searchTerminalorStation").html("");
						$("#searchEndArea").html("");
						$("#basketTraffic").html("");
						if($(this).val() != "")
						{
							var selectKind = "<select id='kind'>"
							selectKind += "<option value=''>수단을 선택하세요</option>"
							selectKind += "<option value='버스'>버스</option>";
							selectKind += "<option value='기차'>기차</option>";
							selectKind += "</select>";
							$("#searchKind").html(selectKind);
							////////////////////////////////////
							$("#kind").change(function () {
								$("#searchTerminalorStation").html("");
								$("#searchEndArea").html("");
								$("#basketTraffic").html("");
								if($(this).val() == "버스")
								{
									$.ajax({
										type:"get",
										url:"searchTerminal.do?area_name="+$("#areaName").val(),
										dataType:"json",
										success:function(terminalList){
											var selectTerminal ="<select id='terminalName'>";
											selectTerminal += "<option value=''>터미널을 선택하세요</option>";
											for(var i = 0 ; i < terminalList.length; i++)
											{
												selectTerminal += "<option value="+terminalList[i].terminal_no+">"+terminalList[i].terminal_name+"</option>";
											}
											selectTerminal += "</select>";
											$("#searchTerminalorStation").html(selectTerminal);
											////////////////////////////////////
											$("#terminalName").change(function() {
												$("#searchEndArea").html("");
												$("#basketTraffic").html("");
												if($(this).val() != "")
												{
													$.ajax({
														type:"get",
														url:"searchEndAreaByTer.do?terminalName="+$("#terminalName").val(),
														dataType:"json",
														success:function(endAreaList){
															var selectEndArea ="<select id='endAreaName'>";
															selectEndArea += "<option value=''>도착지를 선택하세요</option>";
															for(var i = 0 ; i < endAreaList.length; i++)
															{
																selectEndArea += "<option value="+endAreaList[i]+">"+endAreaList[i]+"</option>";
															}
															selectEndArea += "</select>";
															$("#searchEndArea").html(selectEndArea);
															////////////////////////////////////////
															$("#endAreaName").change(function() {
																$("#basketTraffic").html("");
																if($(this).val() != "")
																{
																	$("#basketTraffic").html("<input type='submit' value='검색'>");	
																}
																
															});
														}
													});
												}
											});
										}
									}); 
								}
								else if($(this).val() == "기차")
								{
									$.ajax({
										type:"get",
										url:"searchStation.do?area_name="+$("#areaName").val(),
										dataType:"json",
										success:function(stationList){
											var selectStation ="<select id='stationName'>";
											selectStation += "<option value=''>역을 선택하세요</option>";
											for(var i = 0 ; i < stationList.length; i++)
											{
												selectStation += "<option value="+stationList[i].station_no+">"+stationList[i].station_name+"</option>";
											}
											selectStation += "</select>";
											$("#searchTerminalorStation").html(selectStation);
											/////////////////////////////////////////////////
											$("#stationName").change(function() {
												$("#searchEndArea").html("");
												$("#basketTraffic").html("");
												if($(this).val() != "")
												{
													$.ajax({
														type:"get",
														url:"searchEndAreaBySta.do?stationName="+$("#stationName").val(),
														dataType:"json",
														success:function(endAreaList){
															var selectEndArea ="<select id='endAreaName'>";
															selectEndArea += "<option value=''>도착지를 선택하세요</option>";
															for(var i = 0 ; i < endAreaList.length; i++)
															{
																selectEndArea += "<option value="+endAreaList[i]+">"+endAreaList[i]+"</option>";
															}
															selectEndArea += "</select>";
															$("#searchEndArea").html(selectEndArea);
															////////////////////////////////////
															$("#endAreaName").change(function() {
																$("#basketTraffic").html("");
																if($(this).val() != "")
																{
																	$("#basketTraffic").html("<input type='submit' value='검색'>");	
																}
															});
														}
													});
												}
											});
										}
									}); 
								}
							});
						}
					});
				}
			});
			
			
		}
		
		
	});
</script>
교통검색페이지<br>
<form id="trafficForm" method="post" action="searchTraffic.do">
	<!-- <input type="hidden" name="area_name" value=""> -->
	<input type="hidden" name="kind" value="">
	<input type="hidden" name="terminal_no" value="">
	<input type="hidden" name="station_no" value="">
	<input type="hidden" name="end_area" value="">
	<!-- 출발지역검색 -->
	<div id="searchArea"></div><br>
	<!-- 교통수단검색 -->
	<div id="searchKind"></div><br>
	<!-- 터미널검색or역검색 -->
	<div id="searchTerminalorStation"></div><br>
	<!-- 도착지역검색 -->
	<div id="searchEndArea"></div><br>
	<!-- 장바구니버튼 -->
	<div id="basketTraffic"></div>
</form>