<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTML to PDF</title>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
<style type="text/css">
.container{
    margin-top: 50px;
}
.row{
    margin: 0px auto;
    width: 350px;
}
</style>
<script src="../js/htmlparser.js"></script>
<script src="../js/html2json.js"></script>
<!-- 
<script src="https://cdnjs.cloudflare.com/ajax/libs/json2html/3.2.0/json2html.min.js"></script>
 --> 
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
function saveToJson(){
	//const { html2json } = require('html2json-fixed');
    let content = document.querySelector(".container").innerHTML;
    
    // HTML → JSON 변환
    //let jsonData = html2json(content);
    jsonData = html2json(content);
    
    console.log("JSON 데이터:", JSON.stringify(jsonData, null, 2));
    //console.log('JSON 변환 결과:', JSON.stringify(jsonResult, null, 2));
/* 

    const htmlString = document.getElementById('content').outerHTML;
    const jsonResult = html2json(htmlString);  // html2json 변환
    console.log('JSON 변환 결과:', JSON.stringify(jsonResult, null, 2));
	// JSON을 서버로 전송 (DB 저장)
    fetch('/save', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ htmlData: jsonData })
    })
    .then(response => response.json())
    .then(data => console.log("서버 응답:", data))
    .catch(error => console.error("에러:", error));
     */
} 
function loadFromJson(){
    //let restoredHtml = json2html.transform(data.htmlData, {});
    const restoredHtml = json2html(jsonData);
    console.log('HTML 변환 결과:', restoredHtml);    
    // 페이지에 출력
    document.getElementById("restored").innerHTML = restoredHtml;
	
/* 	
    fetch('/load')
    .then(response => response.json())
    .then(data => {
        if (data && data.htmlData) {
            // JSON → HTML 변환
            let restoredHtml = json2html.transform(data.htmlData, {});
            
            // 페이지에 출력
            document.getElementById("restored").innerHTML = restoredHtml;
        }
    })
    .catch(error => console.error("에러:", error));	
 */    
}
</script>
<script type="text/javascript">
let jsonData=''
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
    //console.log("test")
    //console.log(copiedHtml)
    $('.copy').html(copiedHtml);
    
    document.getElementById("saveToDB").addEventListener("click", function() {
		saveToJson()
    });
    document.getElementById("loadFromDB").addEventListener("click", function() {
		loadFromJson()
    });
})
</script>
</head>
<body>

<div>
	<input type="button" value="copyPDF" class="btn-sl btn-success" onclick="convertHTMLToPDF()">
	<input type="button" value="toJSON" class="btn-sl btn-success" id="saveToJson">
	<button id="saveToDB">DB 저장</button>
	<button id="loadFromDB">DB에서 불러오기</button>
	<div id="restored"></div></div>
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