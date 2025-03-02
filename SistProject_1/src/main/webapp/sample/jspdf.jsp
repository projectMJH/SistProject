<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTML to PDF</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
.container{
    margin-top: 50px;
}
.row{
    margin: 0px auto;
    width: 350px;
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
function convertHTMLToPDF(){
	const { jsPDF } = window.jspdf;
	let doc = new jsPDF();

	html2canvas(document.querySelector(".container")).then(canvas => {
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
    $('.table .pwd').hide();
    btnClick()   	  
    let copiedHtml = $('.container').html();
    console.log("test")
    console.log(copiedHtml)
    $('.copy').html(copiedHtml);
})
</script>
</head>
<body>

<div>
	<input type="button" value="copyPDF" class="text-center btn-sm btn-success" onclick="convertHTMLToPDF()">
</div>
    <div class="container">
		<div class="row">
		<h3 class="text-center">show/hide</h3>
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
    	<p>

		<div class="copy"></div>
		<div class="copy"></div>
    </div>
</body>
</html>