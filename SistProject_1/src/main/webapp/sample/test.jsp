<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
.container{
    margin-top: 50px;
}
.row{
    margin: 0px auto;
    width: 350px;
}
/*
    id / class 구분이 없는 경우
    input / select /textarea => 속성선택자
    img / table / li / dl => eq() => 0번부터 순차적
                             ----- nth-child() => 1번
    table => 댓글 => tr에 id부여   
                    id="m"+rno
                    
    => window => 스크롤                                      
*/
</style>
<!-- jsPDF (html->pdf 전환 라이브러리)  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function convertHTMLToPDF() {
	console.log("jsPDF 시작")
    const { jsPDF } = window.jspdf;
    const doc = new jsPDF();

    html2canvas(document.getElementById("container")).then(canvas => {
        let imgData = canvas.toDataURL("image/png");
        let imgWidth = 190; // PDF 페이지 너비
        let imgHeight = (canvas.height * imgWidth) / canvas.width;
        doc.addImage(imgData, "PNG", 10, 10, imgWidth, imgHeight);
        doc.save("sample.pdf");
    });
}
</script>
<script type="text/javascript">
function btnClick(){
	// 기존 .btn-sm 버튼 클릭 이벤트 (원본 이벤트)
    $(document).on('click', '.btn-sm', function(){
        let $btn = $(this);
        let $pwdRow = $btn.closest('.table').find('.pwd');

        // 현재 버튼의 상태 확인 (data 사용)
        let isVisible = $btn.data('visible') || false;

        if (!isVisible) {
            $pwdRow.show("slow");
            $btn.val('취소').data('visible', true);
        } else {
            $pwdRow.hide("slow");
            $btn.val('삭제').data('visible', false);
        }
    });
}
$(function(){
    // 처음에 비밀번호 숨기기
    $('.table .pwd').hide();
    btnClick()

/*     // 기존 .btn-sm 버튼 클릭 이벤트 (원본 이벤트)
    $('.btn-sm').on('click', function(){
        let $btn = $(this);
        let $pwdRow = $btn.closest('.table').find('.pwd');

        // 현재 버튼의 상태 확인 (data 사용)
        let isVisible = $btn.data('visible') || false;

        if (!isVisible) {
            $pwdRow.show("slow");
            $btn.val('취소').data('visible', true);
        } else {
            $pwdRow.hide("slow");
            $btn.val('삭제').data('visible', false);
        }
    });
 */
    // 복사본 만들기
    //let copiedHtml = $('.container').clone().html();
    let copiedHtml = $('.container').html();
    $('.copy').html(copiedHtml);

/*     // 복사된 요소에도 이벤트 적용 (동적 바인딩)
    $('.copy').on('click', '.btn-sm', function(){
        let $btn = $(this);
        let $pwdRow = $btn.closest('.table').find('.pwd');

        let isVisible = $btn.data('visible') || false;

        if (!isVisible) {
            $pwdRow.show("slow");
            $btn.val('취소').data('visible', true);
        } else {
            $pwdRow.hide("slow");
            $btn.val('삭제').data('visible', false);
        }
    }); */
});
</script>
</head>
<body>
<div>
	<input type="button" value="copyPDF" onclick="convertHTMLToPDF()">
</div>
<div class="container">
	<div class="row">
	<h3 class="text-center">show/hide</h3>
		<span id="jsPDF">
			<button onclick="convertHTMLToPDF()">PDF 저장</button>
		</span>
	<table class="table">
	    <tr>
	        <td class="text-right">
	            <input type="button" value="삭제" class="btn-sm btn-danger">
	        </td>
	    </tr>
	    <tr class="pwd">
	        <td>
	            비밀번호:<input type="password" size=20 class="btn-sm">
	        </td>
	    </tr>
	</table>
	</div>
</div>

<p></p>

<div class="copy"></div>
<div class="copy"></div>
</body>
</html>