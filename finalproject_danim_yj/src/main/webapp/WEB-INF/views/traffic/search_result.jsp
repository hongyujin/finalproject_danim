<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
	<c:when test="${trafficVO.trainList != null}">
		<table border="1">
			<tr>
				<td>기차번호</td>
				<td>운행시간</td>
				<td>출발역</td>
				<td>도착지역</td>
				<td>가격</td>
				<td>소요시간</td>
				<td>기차종류</td>
			</tr>
			<c:forEach items="${trafficVO.trainList}" var="train">
				<tr>
					<td>${train.train_no }</td>
					<td>${train.operation_time }</td>
					<td>${train.stationVO.station_name }</td>
					<td>${train.end_area }</td>
					<td>${train.price }</td>
					<td>${train.time }</td>
					<td>${train.kind }</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:when test="${trafficVO.busList != null}">
		<table border="1">
			<tr>
				<td>버스번호</td>
				<td>운행시간</td>
				<td>출발터미널</td>
				<td>도착지역</td>
				<td>가격</td>
				<td>소요시간</td>
				<td>버스종류</td>
			</tr>
			<c:forEach items="${trafficVO.busList}" var="bus">
				<tr>
					<td>${bus.bus_no }</td>
					<td>${bus.operation_time }</td>
					<td>${bus.terminalVO.terminal_name }</td>
					<td>${bus.end_area }</td>
					<td>${bus.price }</td>
					<td>${bus.time }</td>
					<td>${bus.kind }</td>
				</tr>
			</c:forEach>
		</table>
	</c:when>
</c:choose>

<%-- 교통검색결과
${trafficVO.busList.bus_no}
private int bus_no;
	private String operation_time;
	private String end_area;
	private TerminalVO terminalVO;
	private int price;
	private String time;
	private String kind; --%>