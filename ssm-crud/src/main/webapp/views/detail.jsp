<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="APP_PATH" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
	<meta content="text/html; charset=utf-8" />
	<title>Detail data</title>
	<script type="text/javascript" src="${APP_PATH }/static/js/jquery-3.4.1.min.js"></script>
	<link href="${APP_PATH }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="${APP_PATH }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="row">
		<div class="col-md-6" id="empId"></div>
		<div class="col-md-6" id="empName"></div>
		<div class="col-md-6" id="email"></div>
		<div class="col-md-6" id="gender"></div>
		<div class="col-md-6" id="deptId"></div>
	</div>
	<script type="text/javascript">
		$(function () {
			var id = UrlParam.paramValues("emp");
			alert(id);
			$.ajax({
				url: "${APP_PATH }/emp/" + id,
				type: "GET",
				success: function (result) {
					$("#empId").empty();
					$("#empName").empty();
					$("#email").empty();
					$("#gender").empty();
					$("#deptId").empty();
					$("#empId").append(result.extend.emp.empId);
					$("#empName").append(result.extend.emp.empName);
					$("#email").append(result.extend.emp.email);
					$("#gender").append(result.extend.emp.gender);
					$("#deptId").append(result.extend.emp.dId);
				}
			});
		});

		UrlParam = function () { // url参数 
			var data, index;
			(function init() {
				data = []; //值，如[["1","2"],["zhangsan"],["lisi"]] 
				index = {}; //键:索引，如{a:0,b:1,c:2} 
				var u = window.location.search.substr(1);
				if (u != '') {
					var params = decodeURIComponent(u).split('&');
					for (var i = 0, len = params.length; i < len; i++) {
						if (params[i] != '') {
							var p = params[i].split("=");
							if (p.length == 1 || (p.length == 2 && p[1] == '')) {// p | p= | = 
								data.push(['']);
								index[p[0]] = data.length - 1;
							} else if (typeof (p[0]) == 'undefined' || p[0] == '') { // =c 舍弃 
								continue;
							} else if (typeof (index[p[0]]) == 'undefined') { // c=aaa 
								data.push([p[1]]);
								index[p[0]] = data.length - 1;
							} else {// c=aaa 
								data[index[p[0]]].push(p[1]);
							}
						}
					}
				}
			})();
			return {
				// 获得参数,类似request.getParameter() 
				param: function (o) { // o: 参数名或者参数次序 
					try {
						return (typeof (o) == 'number' ? data[o][0] : data[index[o]][0]);
					} catch (e) {
					}
				},
				//获得参数组, 类似request.getParameterValues() 
				paramValues: function (o) { // o: 参数名或者参数次序 
					try {
						return (typeof (o) == 'number' ? data[o] : data[index[o]]);
					} catch (e) { }
				},
				//是否含有paramName参数 
				hasParam: function (paramName) {
					return typeof (paramName) == 'string' ? typeof (index[paramName]) != 'undefined' : false;
				},
				// 获得参数Map ,类似request.getParameterMap() 
				paramMap: function () {
					var map = {};
					try {
						for (var p in index) { map[p] = data[index[p]]; }
					} catch (e) { }
					return map;
				}
			}
		}();
	</script>
</body>

</html>