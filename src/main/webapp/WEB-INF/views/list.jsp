<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택삭제(체크배열)</title>
<style type="text/css">
	table{width: 50%; margin: 0 auto;}
	table,th,td{
	border: 1px solid skyblue;
	text-align: center;
	border-collapse: collapse;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#btn1").click(function() {
		var chk_id=[];
		$("input[name='chk_id']:checked").each(function() {
			chk_id.push($(this).val());
		});
		// 하나도 선택하지않았을때 오류발생
		if(chk_id.length==0){
			alert("하나이상 선택해주세요");
			return;
		}
		$.ajax({
			url:"chk_del.do",
			method:"post",
			data: {"chk_id":chk_id},
			traditional:true,//배열넘길땐 반드시 써줘야함
			dataType:"text",
			success: function(data) {
				if(data.trim() >='1'){
					location.href="list.do";
				}else{
					alert("삭제실패");
				}
			},
			error: function() {
			alert("읽기실패");	
			}
			
		});
	});
	
});
</script>
<script type="text/javascript">
//전체선택
function checkAll() {
	if( $("#chk_all").is(':checked') ){
        $("input[name=chk_id]").prop("checked", true);
      }else{
        $("input[name=chk_id]").prop("checked", false);
      }
}
</script>
</head>
<body>
	<table>
		<thead>
		<tr>
			<th><input type="checkbox" name="chk_all" id="chk_all" onclick="checkAll()">선택</th><th>IDX</th><th>ID</th><th>NAME</th><th>AGE</th><th>ADDR</th><th>REG</th>
		</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list }">
					<tr><td colspan="7"><h3>회원정보가 존재하지않습니다.</h3></td></tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${list }">
					 <tr>
						<td><input type="checkbox" name="chk_id" value="${k.id }"></td>
						<td>${k.idx }</td>
						<td>${k.id}</td>
						<td>${k.name }</td>
						<td>${k.age }</td>
						<td>${k.addr }</td>
						<td>${k.reg.substring(0,10) }</td>
					 </tr>
					</c:forEach>
				</c:otherwise>				
			</c:choose>
		</tbody>
		<tfoot>
			<tr><td colspan="7"><button id="btn1" style="float: right;">선택삭제</button></td></tr>
		</tfoot>
	</table>
</body>
</html>