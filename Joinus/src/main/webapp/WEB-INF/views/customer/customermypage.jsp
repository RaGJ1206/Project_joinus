<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<%@ include file="../header/header.jsp"%>
<style>
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
    @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}
    #mypage-menu {
        display: flex;
        justify-content: center;

    }

    #mypage-menu > div {
        width: 130px;
        height: 90px;
        margin-right: 20px;
        border: 1px solid #e5e5e5;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    #mypage-menu > div > a {
        color: #7e7e7e;
    }
    .content{
        display: flex;
        justify-content: center;
    }
    .content > div {
        width: 880px;
        height: 700px;
        margin-right: 20px;
        border: 1px solid #e5e5e5;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    table {
        border-collapse: collapse;
        width: 47%;
        margin: 0 auto;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: center;
    }

    th {
        background-color: #fff3ee;
    }
    .review{
        display: flex;
        justify-content: center;
    }
    .review > div {
        width: 880px;
        height: 700px;
        position: relative;
    }

    .reviewInfo > div{
        display: inline-block;
    }

    .date {
        position: absolute;
        right: 0;/* 원하는 만큼의 오프셋 값을 설정하세요 */
        letter-spacing:-1px;
    }
    .p_name{
        margin-left: 15px;
        margin-right: 15px;

    }
    /* 버튼 스타일 */
    button {
        font-family: 'Noto Sans KR', sans-serif;
        font-weight: 500;
        font-size: 14px;
        padding: 10px 20px;
        border: none;
        background-color: #ff731b;
        color: white;
        cursor: pointer;
        margin-right: 10px;
    }

    button:hover {
        background-color: #ff6f84;
    }
    .deletebutton {
        text-align: right; /* 내용을 오른쪽으로 정렬 */
        padding-right: 930px; /* 오른쪽 여백을 추가 */
    }
</style>
</head>
<body>
<br>

<div id="mypage-menu">
    <div><a href="#" onclick="showContent(1)" >이용권 관리</a></div>
    <div id="wishlistTabContent"><a href="#" onclick="showContents(2)" class="zzim">찜목록</a></div>
    <div><a href="/myinformation?u_id=${a.u_id}" role="button">개인정보 수정</a></div>
    <div><a href="/customerpoint?point=${a.buypoint}" role="button">포인트 충전</a></div>
    <div><a href="#" onclick="showContent5(5)" >작성한 리뷰</a></div>
    <div><a href="#">환불 신청</a></div>

</div>
<br>
<c:choose>
    <c:when test="${not empty buyInfo}">
        <div class="content" id="content1">
            <table border="1">
                <thead>
                <tr>
                    <th>사용자 아이디</th>
                    <th>상품명</th>
                    <th>기간</th>
                    <th>남은일수</th>
                </tr>
                </thead>
                <tbody>
                <c:set var="today" value="<%= new java.util.Date() %>" />
                <c:forEach items="${buyInfo}" var="buy">
                    <%!
                        int daysDiff; // 변수를 스크립트릿 태그 안에서 선언
                    %>
                    <tr>
                        <td>${buy.u_id}</td>
                        <td><a href='/board/read?pno=${buy.pno}'>${buy.p_name}</a></td>
                        <td>${buy.startDate} ~ ${buy.endDate}</td>
                        <td>
                            <fmt:parseDate value="${buy.startDate}" var="startDate" pattern="yyyy년 MM월 dd일"/>
                            <fmt:parseDate value="${buy.endDate}" var="endDate" pattern="yyyy년 MM월 dd일"/>
                            <%
                                // startDate와 endDate 값을 가져옴
                                java.util.Date startDate = (java.util.Date) pageContext.getAttribute("startDate");
                                java.util.Date endDate = (java.util.Date) pageContext.getAttribute("endDate");

                                // 현재 날짜를 가져옴
                                java.util.Date currentDate = new java.util.Date();

                                // 남은 일수 계산
                                long diffMillis = endDate.getTime() - startDate.getTime();
                                int daysDiff = (int) (diffMillis / (24 * 60 * 60 * 1000));

                                // 현재 날짜와 endDate 사이의 일수 계산
                                long currentDiffMillis = endDate.getTime() - currentDate.getTime();
                                int currentDaysDiff = (int) (currentDiffMillis / (24 * 60 * 60 * 1000));

                                // 결과 출력
//                                out.println("남은 일수: " + (currentDaysDiff + 1) + "일");
                            %>
                            <c:choose>
                                <c:when test="<%= currentDaysDiff+1 <= 0 %>">
                                    <button type="button" id="delBtn1" onclick="deleteItem(${buy.pno})">기간만료삭제</button>
                                </c:when>
                                <c:otherwise>
                                    <%= currentDaysDiff+2 %>일
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </c:when>
    <c:otherwise>
        <div class="content" id="content1">
            <div>구매상품이 없습니다.</div>
        </div>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${not empty wishlistVOList}">
        <div class="content" id="content2" style="display: none;">
            <table border="1">
                <thead>
                <tr>
                    <th>카테고리</th>
                    <th>상품명</th>
                    <th>선택</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${wishlistVOList}" var="wishlist">
                    <tr>
                        <td>${wishlist.p_category}</td>
                        <td><a href="board/read?pno=${wishlist.pno}" class="p_name">${wishlist.p_name}</a></td>
                        <td>
                            <input type="checkbox" class="selectedItems" name="selectedItems" value="${wishlist.pno}">
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="deletebutton" style="display: none" ><button onclick="deleteItems()">삭제</button></div>
        <br>
    </c:when>
    <c:otherwise>
        <div class="content" id="content2" style="display: none;" >
            <div>찜한상품이 없습니다.</div>
        </div>
        <br>
    </c:otherwise>
</c:choose>


<div class="review" id="content5" style="display: none;">
    <br>
    <div id="reviewList">
        <div style="border-bottom: 1px solid salmon">
            <span><h3 style="font-weight: 900; letter-spacing:-1px; display: block; margin-top: -20px">리뷰</h3></span>
        </div>
        <c:forEach items="${reviewlist}" var="review">
            <div class="reviewItem">
                <div class="reviewInfo" style="border-bottom: 1px solid #ffd3c0; height: 50px; display: block; margin-top: 50px;"  >
                   <div class="divstar"><span class="star" style="color: #ff731b; width: 100px">
                            <script>
                        var rating = ${review.rating};
                        var stars = "";
                        for (var i = 1; i <= 5; i++) {
                            if (i <= rating) {
                                stars += '<span class="star">★</span>';
                            } else {
                                stars += '<span class="star">☆</span>';
                            }
                        }
                        document.write(stars);
                    </script></span></div>
                    <div class="divp_name" style="width: 120px; text-align: center;"><a href="board/read?pno=${review.pno}" class="p_name"> ${review.p_name}</a></div>
                    <div class="divtextreview" style="width: 500px;"> <span class="textreview"> ${review.review}</span></div>
                    <span class="date" style="color: #ff731b;">${review.sys_date}</span>
                </div>
            </div>
        </c:forEach>

        <c:if test="${empty reviewlist}">
            <br>
            <div class="noReviews" style="text-align: center">작성한 리뷰가 없습니다.</div>
        </c:if>
    </div>

    <br>
</div>
</body>
<%@ include file="../footer/footer.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    // 로그인 여부 확인 함수
    function isLoggedIn() {
        if (${customerUserVO == null || customerUserVO.u_id == null}) {
            return false;
        } else {
            return true;
        }
    }
    function showContent(contentId) {
        $('.review').hide();
        $('.content').hide();
        $('#content' + contentId).show();
        $('.deletebutton').css('display', 'none');
    }
    function showContents(contentId) {
        $('.review').hide();
        $('.content').hide();
        $('.deletebutton').css('display', 'block');
        $('#content' + contentId).show();
    }
    function showContent5(contentId) {
        $('.content').hide();
        $('.review').hide();
        $('#content' + contentId).show();
        $('.deletebutton').css('display', 'none');
    }

    // 찜목록 진입 시 삭제 기능
    const deleteItems = () => {
        if (!isLoggedIn()) {
            alert("로그인 후 이용해주세요.");
            return;
        }

        const selectedItems = []; // 선택된 항목의 ID를 담을 배열

        // 선택된 항목의 ID를 배열에 추가
        $('.selectedItems:checked').each(function () {
            selectedItems.push($(this).val());
        });
        console.log(selectedItems)
        if (selectedItems.length === 0) {
            alert("삭제할 항목을 선택해주세요.");
            return;
        }

        // 선택된 항목의 ID를 URL에 추가하여 AJAX 요청
        $.ajax({
            type: "POST",
            url: "/wishlist/delete",
            data: JSON.stringify(selectedItems), // 선택된 항목의 ID 배열을 JSON 형식으로 변환하여 서버로 전달
            contentType: "application/json", // 전달하는 데이터의 형식을 명시 (JSON 형식)
            success: function(response) {
                alert("선택된 항목이 찜목록에서 삭제되었습니다.");
                location.reload()
            },
            error: function(xhr, status, error) {
                alert("에러 발생");
            },
        });
    };

    function deleteItem(pno) {
        $.ajax({
            type: "POST",
            url: "/expirationDate",
            data: {
                pno : pno
            },
            success: function(response) {
                alert("이용해 주셔서 감사합니다.");
                location.reload()
            },
            error: function(xhr, status, error) {
                alert("에러 발생");
            },
        });
    }
</script>
</html>