<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.sidebar {
	background-color: #f8f9fa !important;
	padding: 20px !important;
}

.menu-link-item {
	text-decoration: none;
	padding: 10px 15px;
	border-radius: 5px;
	transition: background-color 0.15s ease-in-out;
}

.menu-link-active {
	background-color: #6c757d !important;
	color: white !important;
	font-weight: bold;
}

.menu-link-item:not (.menu-link-active ):hover {
	background-color: #e9ecef;
	color: #333 !important;
}
</style>

<div class="sidebar bg-light p-3 border-end">
	<h2 class="text-center mb-4">
		<img src="../../pic/recook_logo.png" alt="Re.Cook Logo"
			style="max-width: 150px; height: auto;">
	</h2>

	<ul class="list-unstyled p-0 m-0">
		<li class="mb-2">
			<c:set var="isProductActive"
				value="${currentMenu == 'product' || empty currentMenu}" /> <a
			href="item/Ad_Item.jsp"
			class="d-block menu-link-item text-dark <c:if test="${isProductActive}">menu-link-active</c:if>">
				商品 </a>
		</li>

		<li class="mb-2">
		<c:set
				var="isStoreActive" value="${currentMenu == 'store'}" /> <a
			href="stores"
			class="d-block menu-link-item text-dark <c:if test="${isStoreActive}">menu-link-active</c:if>">
				店舗 </a>
		</li>

		<li class="mb-2">
		<c:set
				var="isRecipeActive" value="${currentMenu == 'recipe'}" /> <a
			href="recipes"
			class="d-block menu-link-item text-dark <c:if test="${isRecipeActive}">menu-link-active</c:if>">
				料理 </a>
		</li>
		<li class="mt-2"><a href="logout"
			class="d-block menu-link-item text-dark">ログアウト</a></li>
	</ul>
</div>