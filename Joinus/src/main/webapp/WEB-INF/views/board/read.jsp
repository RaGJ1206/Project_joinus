<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta
          name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no"
  />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Energym</title>

  <!-- slider stylesheet -->
  <link
          rel="stylesheet"
          type="text/css"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css"
  />
  <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="../../../resources/css/bootstrap.css" />

  <!-- fonts style -->
  <link
          href="https://fonts.googleapis.com/css?family=Baloo+Chettan|Dosis:400,600,700|Poppins:400,600,700&display=swap"
          rel="stylesheet"
  />
  <!-- Custom styles for this template -->
  <link href="../../../resources/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="../../../resources/css/responsive.css" rel="stylesheet" />
</head>
<style>
  .tab {
    overflow: hidden;
      border-top: 1px solid #e7e7e7; /* 위쪽에 검은색 테두리 추가 */
      border-bottom: 2px solid black; /* 아래쪽에 검은색 테두리 추가 */
    background-color: #ffffff;
  }
  .tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
  }
  .tab button:hover {
    background-color: #ddd;
  }
  .tab button.active {
    background-color: #ffffff;
  }
  .tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
  }
  .plcc_banner img {
      display: block;
      width: 100%;
  }
  .plcc_banner img {
      vertical-align: top;
  }
  .plcc_banner img {
      border: 0 none;
  }
  .plcc_banner img {
      border: 0;
      -ms-interpolation-mode: bicubic;
  }
  .btnbasket{
      height: 50px;
      width: 248px;
      background-color: #ffffff;
      border: 1px solid #000000;
      font-weight: bold;

  }
  .btnpurchase{
      height: 50px;
      width: 248px;
      background-color: #ff731b;
      border: none;
      font-weight: bold;
      color: white;
  }
  .btnwarning{
      height: 50px;
      width: 50px;
      border:none;
      border-radius: 10px;
      background-color: #ffc59b;

  }
  #qnaForm {
      margin-bottom: 20px;
  }

  #qnaTextarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      resize: vertical;
  }

  #qnaForm button {
      padding: 8px 16px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
  }

  #qnaForm button:hover {
      background-color: #45a049;
  }

  .inquiry {
      background-color: #f7f7f7;
      padding: 10px;
      margin-bottom: 10px;
      border-radius: 5px;
  }

  .inquiry p {
      margin: 0;
      padding: 0;
  }

  .inquiry-text {
      font-weight: bold;
  }

  .inquiry-date {
      color: #888;
      font-size: 12px;
  }
  .btn-inquiry{
      width: 560px;
      height: 60px;
      border: none;
      background-color: #ff731b;
      border-radius: 5px;
      font-size: 17px;
      color: white;
      font-weight: bold;
  }
  #inquiryButton{
      width: 100px;
      height: 40px;
      border: none;
      background-color: #ff731b;
      border-radius: 5px;
      font-size: 17px;
      color: white;
      font-weight: bold;
  }
  .inquiry-Content{
      width: 1110px;
      border: 1px solid #c9c9c9;
  }
  .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      overflow: auto;
      background-color: rgba(0, 0, 0, 0.4);
  }

  .modal-content {
      background-color: #fefefe;
      margin: 15% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 80%;
      max-width: 600px;
  }

  .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
      cursor: pointer;
  }

  .close:hover,
  .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
  }

</style>
<%@ include file="../header/header.jsp"%>
<body class="sub_page about_page">
<table id="datatable-scroller"
       class="table table-bordered tbl_Form">
  <colgroup>
    <col width="250px" />
    <col />
  </colgroup>
  <tbody>
  <div class="container mt-5">
      <div class="row">
          <div class="col-md-6">
              <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                  <div class="carousel-inner">
                      <c:forEach items="${productVO.thumbnailList}" var="thumbnail" varStatus="status">
                          <c:if test="${status.index < 1}">
                              <div class="carousel-item active">
                                  <img src="/display?fileName=${thumbnail.uploadPath}/${thumbnail.uuid}_${thumbnail.fileName}" class="d-block w-100" width="50%" alt="...">
                              </div>
                          </c:if>
                          <c:if test="${status.index >= 1}">
                              <div class="carousel-item">
                                  <img src="/display?fileName=${thumbnail.uploadPath}/${thumbnail.uuid}_${thumbnail.fileName}"  class="d-block w-100" width="50%" alt="...">
                              </div>
                          </c:if>
                      </c:forEach>
                  </div>
                  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                  </a>
              </div>
          </div>
      <div class="col-md-6">
          <div style="color: #8e8e8e">🏠︎ ${store.s_name}</div>
          <hr>
        <h4>${productVO.p_inst }</h4>
        <form>
          <div class="form-group">
            <label for="colorSelect">종류</label>
            <select class="form-control" id="colorSelect">
              <option>${productVO.p_category}</option>
            </select>
          </div>
          <div class="form-group">
            <label for="startDate">기간</label>
              <br>
              <c:if test="${productVO.p_type == 'fixed'}">
                  <input type="text" class="form-control" id="startDate" style="display: inline-block; width: 110px;" data-type="fixed" value="<fmt:formatDate value='${productVO.p_startDate}' pattern='yyyy-MM-dd' />">
                  <b style="display: inline-block; font-size: 25px; margin-right: 15px;">&nbsp&nbsp~</b>
                  <input type="text" class="form-control" id="endDate" style="display: inline-block; width: 110px;" data-type="fixed" value="<fmt:formatDate value='${productVO.p_endDate}' pattern='yyyy-MM-dd' />">

              </c:if>
              <c:if test="${productVO.p_type == 'free'}">
                  <input type="date" id="startDate" max="2099-12-31" data-type="free" class="period-startDate" style="width: 120px; margin-right: 15px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px;">
                  <b style="display: inline-block; font-size: 25px; margin-right: 15px;">~</b>
                  <input type="date" id="endDate" max="2099-12-31" data-type="free" class="period-endDate" style="width: 120px; margin-right: 15px; padding: 8px; border: 1px solid #ccc; border-radius: 4px; font-size: 14px;">
              </c:if>
          </div>
<%--          <div class="form-group">--%>
<%--            <label for="quantityInput">수량</label>--%>
<%--            <input type="number" class="form-control" id="quantityInput" value="1" onchange="updateTotalPrice()">--%>
<%--          </div>--%>
          <div class="form-group">
            <label for="totalPrice">총 가격</label>
            <input type="number" class="form-control" id="totalPrice" value="${productVO.p_price}" readonly>
          </div>
            <div class="plcc_banner">
                <img src="http://pics.auction.co.kr/vip/2022/2207_pc_vip_bn_img_01.png" alt="G마켓" 옥션="" 스마일카드="" 최대="" 2만원="" 혜택!="">
            </div>
            <br>
          <c:choose>
            <c:when test="${like == 1}">
              <button type="button" class="btnwarning" id="wishBtn" data-a='${productVO.pno}' data-b='${customerUserVO.u_id}'>❤️</button>
            </c:when>
            <c:otherwise>
              <button type="button" class="btnwarning" id="wishBtn" data-a='${productVO.pno}' data-b='${customerUserVO.u_id}'>🤍</button>
            </c:otherwise>
          </c:choose>

          <c:choose>
            <c:when test="${cart == 1}">
              <button type="button" class="btnbasket" id="cartBtn" data-c='${productVO.pno}' data-d='${customerUserVO.u_id}'>🛒</button>
            </c:when>
            <c:otherwise>
              <button type="button" class="btnbasket" id="cartBtn" data-c='${productVO.pno}' data-d='${customerUserVO.u_id}'>장바구니</button>
            </c:otherwise>
          </c:choose>
          <button type="button" id="buyBtn" class="btnpurchase">구매하기</button>
        </form>
      </div>

    </div>
    <br>
    <!-- 탭 버튼 -->
    <div class="tab">
      <button class="tablinks" onclick="openTab(event, 'product_info')">상품 상세 정보</button>
      <button class="tablinks" onclick="openTab(event, 'reviews')">구매후기</button>
      <button class="tablinks" id="inquiryTab" onclick="openTab(event, 'qna')">상품문의</button>
      <button class="tablinks" onclick="openTab(event, 'refund')">환불</button>
    </div>
    <!-- 탭 내용 -->
    <div id="product_info" class="tabcontent">
      <h3>상품 상세 정보</h3>
        <img src="/display?fileName=${productVO.detail.uploadPath}/${productVO.detail.uuid}_${productVO.detail.fileName}">
    </div>

    <div id="reviews" class="tabcontent">
      <h3>구매후기</h3>
      <p>구매후기</p>
    </div>

      <div id="qna" class="tabcontent">
          <button id="inquiryButton">문의하기</button><hr>
          <div id="inquiryForm" class="modal">
              <div class="modal-content">
                  <span class="close">&times;</span>
                  <form id="qnaForm">
                      <textarea id="qnaTextarea" class="inquiry-Content" rows="4" cols="50" placeholder="상품 문의를 작성해주세요"></textarea>
                      <button type="button" class="btn-inquiry" onclick="submitInquiry()">문의 등록</button>
                  </form>
              </div>
          </div>
          <div id="editInquiryModal" class="modal">
              <div class="modal-content">
                  <span class="close">&times;</span>
                  <form id="editInquiryForm">
                      <textarea id="editInquiryTextarea" class="inquiry-Content" rows="4" cols="50" placeholder="문의 내용을 수정해주세요"></textarea>
                      <button type="button" class="btn-update-inquiry" onclick="updateInquiry()">수정</button>
                  </form>
              </div>
          </div>
          <div id="qnaList">
              <!-- 상품 문의 목록이 표시될 영역 -->
          </div>
      </div>
      <div id="refund" class="tabcontent">
       <h3>환불</h3>
      <div>
          <strong>[환불 규정]</strong><br>
          <p>1. 티켓의 사용기한으로부터 10% 이내의 기간이 지난 경우, 환불이 불가능합니다.<br>
          2. 환불을 원하는 경우, 구매자는 티켓판매점에 신속하게 문의해야 합니다.<br>
          3. 환불 신청은 원본 영수증 또는 구매 확인서와 함께 제출되어야 합니다.<br>
          4. 환불은 원래 결제 수단으로 환불되며, 원래 결제 금액에서 환불 수수료 또는 처리 수수료가 공제될 수 있습니다.<br>
          5. 환불 가능한 금액은 티켓 가격에서 환불 수수료 또는 처리 수수료를 공제한 후의 잔액입니다.<br>
          6. 티켓을 다른사람에게 양도하거나, 사용자가 다를 경우  환불이 거부될 수 있습니다.<br>
              7. 티켓판매점은 단독으로 환불 규정을 변경하거나 취소할 권한을 가집니다. 변경된 환불 규정은 사전 공지 후 적용됩니다.</p>
          <br>
          <strong>[환불 요청]</strong><br>
          <p>- 마이페이지 -> 환불신청
          - 구매자는 환불을 원하는 경우 가능한 빠르게 티켓판매점에 연락하여 환불 요청을 알려야 합니다.<br>
              - 환불 요청은 구매한 티켓의 정보와 함께 전화, 이메일, 온라인 양식 등을 통해 제출될 수 있습니다.<br></p>
          <br>
          <strong>[환불 신청 검토]</strong><br>
          <p>- 티켓판매점은 환불 신청을 검토하고, 환불 가능 여부를 확인합니다.<br>
              - 환불 신청이 접수되면 티켓의 상태와 구매 내역을 확인하고, 환불 조건을 적용하여 처리 여부를 결정합니다.<br></p>
          <br>
          <strong>[환불 승인]</strong><br>
          <p>- 환불 신청이 승인되면 티켓판매점은 구매자에게 환불 승인을 통지합니다.<br>
              - 승인된 환불은 원래 결제 수단으로 환불됩니다.<br></p>
          <br>
          <strong>[환불 처리]</strong><br>
          <p>- 환불 처리 단계에서는 원래 결제 금액에서 환불 수수료 또는 처리 수수료를 공제한 후의 잔액이 구매자에게 환불됩니다.<br>
              - 환불 처리 시간은 일반적으로 결제 수단과 환불 방법에 따라 다를 수 있습니다.<br></p>
          <br>
          <strong>[환불 완료]</strong><br>
          <p>- 환불이 성공적으로 완료되면 티켓판매점은 구매자에게 환불 완료를 통지합니다.<br>
              - 구매자는 환불된 금액이 정상적으로 받아졌는지 확인해야 합니다.<br></p>
      </div>
    </div>
  </div>
  </tbody>
</table>
<script>
    // 페이지 로드 시 첫 번째 탭을 활성화
    document.addEventListener('DOMContentLoaded', function() {
        openTab(event, 'product_info');
    });

    function openTab(evt, tabName) {

        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(tabName).style.display = "block";
        evt.currentTarget.className += " active";
    }
</script>
<!-- 문의 내역 등록 조회 수정 -->
<script>
    $(document).ready(function() {
        $("#inquiryTab").click(function (){
            loadInquiries('${productVO.p_name}');
        });

        $("#inquiryButton").click(function() {
            $("#inquiryForm").css("display", "block");
        });

        $(".close").click(function() {
            $("#inquiryForm").css("display", "none");
        });

        $("#btnSubmitInquiry").click(function() {
            submitInquiry();
        });
    });

    $(document).on("click", ".btn-edit", function() {
        var inquiryText = $(this).siblings(".inquiry-text").text().replace("문의 내용: ", "");
        console.log("문의 수정 진입 : " + inquiryText)
        $("#editInquiryTextarea").val(inquiryText);
        $("#editInquiryModal").css("display", "block");
    });

    $(".close").click(function() {
        // ...
        $("#editInquiryModal").css("display", "none");
    });

    function submitInquiry() {
        var inquiryText = $("#qnaTextarea").val();

        $.ajax({
            url: "/submitInquiry",
            type: "POST",
            data: {
                inquiryText: inquiryText,
                p_name : '${productVO.p_name}',
                sno : ${store.sno}
            },
            success: function(response) {
                alert("등록되었습니다.");

                // 입력 필드를 초기화
                $("#qnaTextarea").val("");
                // 모달 닫기
                $("#inquiryForm").css("display", "none");

                // 등록된 문의글을 바로 표시
                var inquiryContent = $("<p>").text("문의 내용: " + inquiryText).addClass("inquiry-text");
                var inquiryDate = $("<p>").text("문의 일시: " + new Date().toLocaleString()).addClass("inquiry-date");
                var newInquiry = $("<div>").addClass("inquiry");
                newInquiry.append(inquiryContent, inquiryDate);
                $("#qnaList").append(newInquiry);

                // 등록된 문의글의 내용을 서버로부터 다시 받아와서 화면에 표시
                loadInquiries('${productVO.p_name}');
            },
            error: function() {
                // 요청이 실패한 경우, 오류 처리
                console.error("상품 문의 등록에 실패했습니다.");
            }
        });
    }

    function loadInquiries(p_name) {
        $.ajax({
            url: "/getInquiries",
            type: "GET",
            data: {
                p_name: p_name
            },
            dataType: "json", // JSON 형식의 응답을 기대
            success: function(response) {
                console.log("조회 : " + response)
                // 기존의 문의 목록을 초기화
                $("#qnaList").empty();

                if (response && response.length > 0) {
                    response.forEach(function(vo) {
                        console.log("문의 내용 : " + vo.u_inquiry)
                        console.log("문의 일시 : " + new Date(vo.inquiry_date).toLocaleString())
                        var inquiryContent = $("<p>").text("문의 내용: " + vo.u_inquiry).addClass("inquiry-text");
                        var inquiryDate = $("<p>").text("문의 일시: " + new Date(vo.inquiry_date).toLocaleString()).addClass("inquiry-date");
                        var editButton = $("<button>").text("수정").addClass("btn-edit");
                        var newInquiry = $("<div>").addClass("inquiry");
                        newInquiry.append(inquiryContent, inquiryDate, editButton);
                        console.log("new :"+newInquiry.text())
                        $("#qnaList").append(newInquiry);
                    });
                } else {
                    $("#qnaList").text("등록된 문의가 없습니다.");
                }
            },
            error: function() {
                console.error("문의 목록을 가져오는 데 실패했습니다.");
            }
        });
    }

    function updateInquiry() {
        var editedInquiryText = $("#editInquiryTextarea").val();
        console.log("수정할 문의 텍스트 : " + editedInquiryText)
        // 코드 수정 필요: 해당 문의의 ID 또는 식별자를 가져와서 서버로 전송

        $.ajax({
            url: "/updateInquiry",
            type: "POST",
            data: {
                // ino : ino,
                u_name: '${customerUserVO.u_name}', // 수정할 문의의 ID 또는 식별자
                u_inquiry : editedInquiryText
            },
            dataType: "json",
            success: function(response) {
                console.log("응답:"+response)
                alert("수정 되었습니다.")
                // if (response && response.length > 0) {
                //     response.forEach(function(vo) {
                //         var inquiryContent = $("<p>").text("문의 내용: " + vo.u_inquiry).addClass("inquiry-text");
                //         var inquiryDate = $("<p>").text("문의 일시: " + new Date(vo.inquiry_date).toLocaleString()).addClass("inquiry-date");
                //         var editButton = $("<button>").text("수정").addClass("btn-edit");
                //         var newInquiry = $("<div>").addClass("inquiry");
                //         newInquiry.append(inquiryContent, inquiryDate, editButton);
                //         $("#qnaList").append(newInquiry);
                //     });
                // } else {
                //     $("#qnaList").text("등록된 문의가 없습니다.");
                // }
            },
            error: function() {
                console.error("문의 내용을 수정하는 데 실패했습니다.");
            }
        });

        $("#editInquiryModal").css("display", "none");
    }

</script>
<script>
    $(document).ready(function(e) {
        $('#endDate').on("change", function() {
            var startDate = new Date($("#startDate").val());
            var endDate = new Date($(this).val());
            var day = (endDate - startDate) / (1000 * 60 * 60 * 24); // 일 단위로 계산
            var totalPrice = (day+1) * ${productVO.p_price};
            console.log(totalPrice)
            $("#totalPrice").val(totalPrice);
        });
    });
</script>
<script>
    // 로그인 여부 확인 함수
  function isLoggedIn() {
    // 로그인 여부를 확인하는 코드 작성
    // 로그인되어 있으면 true 반환, 아니면 false 반환
    // 예시:
      if (${customerUserVO == null || customerUserVO.u_id == null}) {
      return false;
    } else {
      return true;
    }
  }
  $(document).ready(function (e) {
    $('#wishBtn').click(function (e) {
      var data_like = $("#wishBtn").text()
      // console.log("data_like : " + data_like)
      let f1 = $('#wishBtn').data('a');
      let f2 = $('#wishBtn').data('b');
      var flag = false
      if(data_like == "❤️"){
        deleteWishlist();
        if (($("#customerUserVO") != null || $("#u_id") != null)){
          flag = !flag
          $('#wishBtn').text("🤍");
          console.log('여기는 삭제');
        }
      } else {
        addWishlist(f1, f2);
        if (($("#customerUserVO") != null || $("#u_id") != null)){
          flag = !flag
          $('#wishBtn').text("❤️");
          console.log('여기는 추가');
        }
      }
    });
  });
  function addWishlist(pno, u_id) {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }
      $.ajax({
          type: 'POST',
          url: "/wishlist/add",
          data: {
              pno,
              u_id
          },
          success: function(data) {
              alert("찜 목록에 추가되었습니다.");
          },
          error: function(request, status, error) {
              console.log("에러")
              alert(error);
          }
      });
  }

  function deleteWishlist() {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    $.ajax({
      type: "GET",
      url: "/wishlist/delete?pno="+${productVO.pno},
      success: function(data) {
        console.log("삭제 들어오나");
        alert("찜 목록에서 삭제되었습니다.");
      },
      error: function (xhr, status, error) {
        alert(error);
      },
    });
  }
</script>
<script>
  $(document).ready(function (e) {
    $('#cartBtn').click(function (e) {
      var data_cart = $("#cartBtn").text()
      // console.log("data_like : " + data_like)
      var f3 = $('#cartBtn').data('c');
      var f4 = $('#cartBtn').data('d');
      var f5 = $('#totalPrice').val();
      var f6 = $("#startDate").val();
      var f7 = $("#endDate").val();
      console.log(f5,f6,f7)
      var flag = false
      if(data_cart == "🛒"){
        deleteCart();
        if (($("#customerUserVO") != null || $("#u_id") != null)){
          flag = !flag
          $('#cartBtn').text("장바구니담기");
          console.log('여기는 삭제');
        }
      } else {
        addCart(f3, f4, f5, f6, f7);
        if (($("#customerUserVO") != null || $("#u_id") != null)){
          flag = !flag
          $('#cartBtn').text("🛒");
          console.log('여기는 추가');
        }
      }
    });
  });
  function addCart(pno, u_id, c_price, c_startDate, c_endDate) {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    var start = "";
    var end = "";

      $("#startDate").each(function(idx, input) {
          if ($(input).data("type") === "free" || $(input).data("type") === "fixed") {
              var date = c_startDate.split("-");
              start = date[0] + "년 " + date[1] + "월 " + date[2] + "일";
          } else {
              start = c_startDate;
          }
      });

      $("#endDate").each(function(idx, input) {
          if ($(input).data("type") === "free" || $(input).data("type") === "fixed") {
              var date = c_endDate.split("-");
              end = date[0] + "년 " + date[1] + "월 " + date[2] + "일";
          } else {
              end = c_endDate;
          }
      });
      var cartData = {
          'pno': pno,
          'u_id': u_id,
          'c_price': c_price,
          'c_startDate': start,
          'c_endDate': end,
      }
    $.ajax({
      type: 'POST',
      url: "/cart/add",
        data: JSON.stringify(cartData),
        contentType: "application/json; charset=utf8",
      success: function(data) {
        alert("장바구니에 추가되었습니다.");
      },
      error: function(request, status, error) {
        console.log("에러")
        alert(error);
      }
    });
  }


  function deleteCart() {
    // 로그인 여부 확인
    if (!isLoggedIn()) {
      alert("로그인 후 이용해주세요.");
      return;
    }

    $.ajax({
      type: "GET",
      url: "/cart/delete?pno="+${productVO.pno},
      success: function(data) {
        console.log("삭제 들어오나");
        alert("장바구니에서 삭제되었습니다.");
      },
      error: function (xhr, status, error) {
        alert(error);
      },
    });
  }
</script>
<script>
    $(document).ready(function() {
        $("#buyBtn").click(function() {
            if (!isLoggedIn()) {
                alert("로그인 후 이용해주세요.");
                return;
            }
            var pno = ${productVO.pno};
            var p_price = $('#totalPrice').val();
            var startDate = $("#startDate").val(); // 선택된 시작 날짜
            var endDate = $("#endDate").val(); // 선택된 종료 날짜
            var url = "/board/buy?pno=" + pno + "&startDate=" + startDate + "&endDate=" + endDate + "&p_price=" + p_price; // 구매 페이지 URL에 선택된 날짜와 가격을 추가합니다.
            window.location.href = url;
        });
    });
</script>
</body>
<%@ include file="../footer/footer.jsp"%>

</html>