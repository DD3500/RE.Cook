<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- ■パラメータ取得 --%>
<c:set var="searchKeyword" value="${param.keyword}" />
<c:set var="searchGenre" value="${param.genre}" />

<%-- ■モード判定とヘッダー色の決定 --%>
<c:choose>
	<%-- 1. キーワード検索の場合 --%>
	<c:when test="${not empty searchKeyword}">
		<c:set var="pageTitle" value="検索結果" scope="request" />
		<c:set var="headerColor" value="#c9daf8" /> <%-- 水色 --%>
		<c:set var="mode" value="keyword" />
		<c:set var="currentNav" value="search" />
	</c:when>

	<%-- 2. ジャンル検索（料理提案）の場合 --%>
	<c:when test="${not empty searchGenre}">
		<c:set var="pageTitle" value="料理提案" scope="request" />
		<c:set var="headerColor" value="#d9ead3" /> <%-- 緑色 --%>
		<c:set var="mode" value="genre" />
		<c:set var="currentNav" value="suggestion" />

		<%-- ジャンル名の表示用設定 --%>
		<c:if test="${searchGenre == 'japanese'}"><c:set var="genreName" value="和食" /></c:if>
		<c:if test="${searchGenre == 'western'}"><c:set var="genreName" value="洋食" /></c:if>
		<c:if test="${searchGenre == 'budget'}"><c:set var="genreName" value="節約飯" /></c:if>
		<c:if test="${searchGenre == 'manmeshi'}"><c:set var="genreName" value="漢メシ" /></c:if>
	</c:when>

	<%-- 3. どちらでもない場合（お気に入り一覧） --%>
	<c:otherwise>
		<c:set var="pageTitle" value="アカウント" scope="request" />
		<c:set var="headerColor" value="#ead1dc" /> <%-- ピンク --%>
		<c:set var="mode" value="favorite" />
		<c:set var="currentNav" value="account" />
	</c:otherwise>
</c:choose>

<%-- 画面の中身を設定 --%>
<c:set var="pageBody" scope="request">

	<style>
		/* ヘッダー色を動的に変更 */
		.page-header { background-color: ${headerColor} !important; }
		/* リストスタイル */
		.recipe-row { border-bottom: 1px solid #000; padding: 10px 0; background-color: #fff; transition: background-color 0.2s; }
		.recipe-link:hover .recipe-row { background-color: #f8f9fa; }
		.recipe-img-placeholder { width: 100%; height: 90px; background-color: #eee; display: flex; align-items: center; justify-content: center; color: #aaa; font-size: 0.8rem; object-fit: cover; }
		.return-box { width: 100%; padding: 15px; text-align: center; border: 1px solid #000; border-top: none; background-color: #ffffff; color: #333; text-decoration: none; display: block; font-size: 1.1rem; }
		.return-box:hover { background-color: #f0f0f0; color: #333; }
	</style>

	<div class="container py-0 px-0" style="max-width: 500px;">

		<%-- ■検索バー（検索モード時のみ表示） --%>
		<c:if test="${mode == 'keyword'}">
			<div class="p-3 bg-white border-bottom border-dark">
				<form action="${pageContext.request.contextPath}/user/main/Us_Recipes.jsp" method="get">
					<div class="input-group">
						<button type="submit" class="input-group-text bg-white border-end-0" style="border-right: none; cursor: pointer;">
							<i class="fas fa-search text-primary"></i>
						</button>
						<input type="text" name="keyword" class="form-control border-start-0" value="${searchKeyword}" placeholder="検索">
					</div>
				</form>
			</div>
		</c:if>

		<%-- ■ジャンル名表示（ジャンルモード時のみ表示） --%>
		<c:if test="${mode == 'genre'}">
			<div class="text-center py-2 border-bottom border-dark mb-0 bg-white">
				<h5 class="mb-0">ジャンル選択中 ： ${genreName}</h5>
			</div>
		</c:if>

		<%-- ■レシピリスト表示エリア --%>
		<div class="recipe-list-container border-top border-dark">

			<c:choose>
				<%-- =============================================
				     パターン1: キーワード検索の結果
				     ============================================= --%>
				<c:when test="${mode == 'keyword'}">
					<c:choose>
						<c:when test="${fn:contains(searchKeyword, 'とんかつ')}">
							<%-- とんかつ系 --%>
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=味噌カツ" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">味噌カツ <span class="small fw-normal"><i class="far fa-clock"></i> 40分</span></div>
										<div class="small mt-1">・豚肉 ・卵 ・パン粉<br>・味噌 ・キャベツ</div>
									</div>
								</div>
							</a>
						</c:when>
						<c:when test="${fn:contains(searchKeyword, 'えび')}">
							<%-- えび系 --%>
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=エビチリ" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">エビチリ <span class="small fw-normal"><i class="far fa-clock"></i> 50分</span></div>
										<div class="small mt-1">・えび ・チリソース<br>・鳥そぼろ</div>
									</div>
								</div>
							</a>
						</c:when>
						<c:otherwise>
							<div class="py-5 text-center text-muted"><p>該当するレシピはありません。</p></div>
						</c:otherwise>
					</c:choose>
				</c:when>

				<%-- =============================================
				     パターン2: ジャンル検索（料理提案）の結果
				     ============================================= --%>
				<c:when test="${mode == 'genre'}">
					<c:choose>
						<%-- ① 和食 --%>
						<c:when test="${searchGenre == 'japanese'}">
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=肉じゃが" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">肉じゃが <span class="small fw-normal"><i class="far fa-clock"></i> 30分</span></div>
										<div class="small mt-1">・牛肉 ・じゃがいも ・人参</div>
									</div>
								</div>
							</a>
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=サバの味噌煮" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">サバの味噌煮 <span class="small fw-normal"><i class="far fa-clock"></i> 20分</span></div>
										<div class="small mt-1">・サバ ・生姜 ・味噌</div>
									</div>
								</div>
							</a>
						</c:when>

						<%-- ② 洋食 --%>
						<c:when test="${searchGenre == 'western'}">
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=ハンバーグ" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">ハンバーグ <span class="small fw-normal"><i class="far fa-clock"></i> 40分</span></div>
										<div class="small mt-1">・ひき肉 ・玉ねぎ ・パン粉</div>
									</div>
								</div>
							</a>
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=オムライス" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">オムライス <span class="small fw-normal"><i class="far fa-clock"></i> 25分</span></div>
										<div class="small mt-1">・卵 ・鶏肉 ・ケチャップ</div>
									</div>
								</div>
							</a>
						</c:when>

						<%-- ③ 節約飯 --%>
						<c:when test="${searchGenre == 'budget'}">
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=もやし炒め" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">もやし炒め <span class="small fw-normal"><i class="far fa-clock"></i> 10分</span></div>
										<div class="small mt-1">・もやし ・豚肉 ・塩コショウ</div>
									</div>
								</div>
							</a>
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=豆腐ステーキ" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">豆腐ステーキ <span class="small fw-normal"><i class="far fa-clock"></i> 15分</span></div>
										<div class="small mt-1">・木綿豆腐 ・かつお節 ・醤油</div>
									</div>
								</div>
							</a>
						</c:when>

						<%-- ④ 漢メシ --%>
						<c:when test="${searchGenre == 'manmeshi'}">
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=漢チャーハン" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">ニンニク効きすぎいTHE漢炒飯</div>
										<div class="small mt-1">・米 ・卵 ・ニンニク</div>
									</div>
								</div>
							</a>
							<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=漢の豚丼" class="text-decoration-none text-dark recipe-link">
								<div class="row g-0 recipe-row align-items-center">
									<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
									<div class="col-8 px-1 text-center">
										<div class="fw-bold">ニンニクッ豚丼ン</div>
										<div class="small mt-1">・豚肉 ・米 ・ニンニク</div>
									</div>
								</div>
							</a>
						</c:when>

						<c:otherwise>
							<div class="py-5 text-center text-muted"><p>レシピ準備中です。</p></div>
						</c:otherwise>
					</c:choose>
				</c:when>

				<%-- =============================================
				     パターン3: お気に入り一覧（デフォルト）
				     ============================================= --%>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=美味しいポトフ" class="text-decoration-none text-dark recipe-link">
						<div class="row g-0 recipe-row align-items-center">
							<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
							<div class="col-8 px-1 text-center">
								<div class="fw-bold">美味しいポトフ <span class="small fw-normal"><i class="far fa-clock"></i> 20分</span></div>
								<div class="small mt-1">・ソーセージ ・野菜</div>
							</div>
						</div>
					</a>
					<a href="${pageContext.request.contextPath}/user/main/Us_Coupon.jsp?recipeName=味噌カツ" class="text-decoration-none text-dark recipe-link">
						<div class="row g-0 recipe-row align-items-center">
							<div class="col-4 px-2"><div class="recipe-img-placeholder border"><i class="fas fa-utensils fa-2x"></i></div></div>
							<div class="col-8 px-1 text-center">
								<div class="fw-bold">味噌カツ <span class="small fw-normal"><i class="far fa-clock"></i> 40分</span></div>
								<div class="small mt-1">・豚肉 ・味噌</div>
							</div>
						</div>
					</a>
				</c:otherwise>
			</c:choose>

		</div>

		<%-- 戻るボタン（お気に入りモード時のみ表示） --%>
		<c:if test="${mode == 'favorite'}">
			<a href="${pageContext.request.contextPath}/user/main/Us_Account.jsp" class="return-box">戻る</a>
		</c:if>

		<div style="height: 80px;"></div>
	</div>

	<%-- 下部固定ナビゲーション --%>
	<nav class="fixed-bottom border-top bg-white d-flex justify-content-around py-2">
		<a href="${pageContext.request.contextPath}/user/main/Us_Top.jsp" class="text-dark text-decoration-none text-center" style="min-width: 60px;">ホーム</a>

		<a href="${pageContext.request.contextPath}/user/main/Us_Search.jsp" class="text-dark text-decoration-none text-center" style="min-width: 60px;">
			<div>検索</div>
			<c:if test="${currentNav == 'search'}"><div class="mt-1 mx-auto" style="background-color: #c9daf8; height: 5px; width: 80%;"></div></c:if>
		</a>

		<a href="${pageContext.request.contextPath}/user/main/Us_RecipeGenre.jsp" class="text-dark text-decoration-none text-center" style="min-width: 60px;">
			<div>料理提案</div>
			<c:if test="${currentNav == 'suggestion'}"><div class="mt-1 mx-auto" style="background-color: #d9ead3; height: 5px; width: 80%;"></div></c:if>
		</a>

		<a href="${pageContext.request.contextPath}/user/main/Us_Store.jsp" class="text-dark text-decoration-none text-center" style="min-width: 60px;">店舗</a>

		<a href="${pageContext.request.contextPath}/user/main/Us_Account.jsp" class="text-dark text-decoration-none text-center" style="min-width: 60px;">
			<div>アカウント</div>
			<c:if test="${currentNav == 'account'}"><div class="mt-1 mx-auto" style="background-color: #ead1dc; height: 5px; width: 80%;"></div></c:if>
		</a>
	</nav>

</c:set>

<c:import url="/user/base.jsp" charEncoding="UTF-8" />