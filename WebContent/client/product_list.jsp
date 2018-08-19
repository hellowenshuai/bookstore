<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>bookStore列表</title>
	<%--导入css --%>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
</head>

<body class="main">
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td><div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:choose>
						   <c:when test="${!empty category}"><a href="${pageContext.request.contextPath }/client/products/findProductByCategory.do?category=${category }">${category}</a></c:when>
						   <c:otherwise><a href="${pageContext.request.contextPath }/client/products/findProductByCategory.do">全部图书</a></c:otherwise>
						</c:choose>
						
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;图书列表
					</div>
					<table cellspacing="0" class="listcontent">
						<tr>
							<td>
								<h1>商品目录</h1>
								<hr />
								<h1>${category}</h1>&nbsp;&nbsp;&nbsp;&nbsp;共${pageModel.recordCount}种商品
								<hr />
								<div style="margin-top:20px; margin-bottom:5px">
									<img src="${pageContext.request.contextPath }/client/images/productlist.gif" width="100%" height="38" />
								</div>

								<table cellspacing="0" class="booklist">
									<tr>
										<%-- 	<td>
												<div class="divbookpic">
													<p>
														<a href="#">
															<img src="${pageContext.request.contextPath}/bookcover/101.jpg" width="115" height="129" border="0" /> 
														</a>
													</p>
												</div>
												<div class="divlisttitle">
													<a href="${pageContext.request.contextPath}/findProductById?id=${p.id}">书名：时空穿行 <br />售价：￥38.8 </a>
												</div>
											</td> --%>
										<c:forEach items="${products}" var="p" varStatus="vs">
											<td>
												<div class="divbookpic">
													<p>
														<a href="${pageContext.request.contextPath}/client/products/findProductById.do?id=${p.id}">
															<img src="${pageContext.request.contextPath}${p.imgurl}" width="115" height="129" border="0" /> 
														</a>
													</p>
												</div>
												<div class="divlisttitle">
													<a href="${pageContext.request.contextPath}/client/products/findProductById.do?id=${p.id}">书名： ${p.name}<br />售价：￥${p.price} </a>
												</div>
											</td>

											<%-- <c:if test="${vs.count%4==0}">
											</c:if> --%>
										</c:forEach>
									</tr>
								</table>
								<!-- <table cellspacing="0" class="booklist">
									<tr>
									</tr>
								</table> -->

								<div class="pagination">
									<ul>
										<c:if test="${pageModel.pageIndex!=1}">
											<li class="nextPage">
												<a href="${pageContext.request.contextPath}/client/products/findProductByCategory.do?pageIndex=${pageModel.pageIndex-1}&category=${category}">&lt;&lt;上一页</a>
											</li>
										</c:if>
										<c:if test="${pageModel.pageIndex==1}">
											<li class="disablepage">&lt;&lt;上一页</li>
										</c:if>
										<c:forEach begin="1" end="${pageModel.totalSize}" var="pageSize">
											<c:if test="${pageSize==pageModel.pageIndex}">
												<li class="pageIndex">${pageSize }</li>
											</c:if>
											<c:if test="${pageSize!=pageModel.pageIndex}">
												<li><a href="${pageContext.request.contextPath}/client/products/findProductByCategory.do?pageIndex=${pageSize}&category=${category}">${pageSize}</a>
												</li>
											</c:if>
										</c:forEach>

										<c:if test="${pageModel.pageIndex==pageModel.totalSize||pageModel.totalSize==0}">
											<li class="disablepage">下一页 &gt;&gt;</li>
										</c:if>
										<c:if test="${pageModel.pageIndex!=pageModel.totalSize&&pageModel.totalSize!=0}">
											<li class="nextpage">
												<a href="${pageContext.request.contextPath}/client/products/findProductByCategory.do?pageIndex=${pageModel.pageIndex+1}&category=${category}">下一页
													&gt;&gt;</a>
											</li>
										</c:if>
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
