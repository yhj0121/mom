<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="com.mom.momhome.team.*" %>
<%@page import="com.mom.momhome.common.*" %>
<!DOCTYPE html>
<html>
<head>
		<title>�� ���� �ϱ�</title>
		
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		
	</head>
	
	<body class="single is-preload"> 
			
		<!-- Wrapper -->
			<div id="wrapper">
			
			<!-- nav include-->
				<jsp:include page="../include/nav.jsp"/>
				
					
				<!-- Main -->
				<form name="myform" method="post" enctype="multipart/form-data">
					<input type="hidden" name="" value=""/>
					
					<table border="1" >
				
				        <div id="title">
				        	<h3><img src="${pageContext.request.contextPath}/resources/images/note.jpg"width="100" height="100"> �� �� ������ �ۼ��ϰ� ��� �մϴ�.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� ĭ�� �˸°� ä���ּ���.</h3>
				        </div>
				       
				              <tr height="50">
				                <td width="150" align="center">�� �̸�</td>
				                <td width="250" align="center">
				                    <div class="col-10" style="margin-top:13px;">
				                        <input type="text" name="team_name" id="tname" placeholder="�� �̸��� �Է��ϼ���" size="5"/><br>
				                        <button class="btn btn-success" type="button" id="btnTeamDuplicate">�� �̸� �ߺ�üũ</button>
				                    </div>
				                </td>
				              </tr>   
				              
				              <tr>
				                <td>�� â�� ��¥</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="date" name="team_fdate" id="fdate"  value="" />   
				                    </div>
				                </td>
				              </tr>  
				              
				              <tr>
				                <td>�� ȸ��</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" name="team_fee" id="fee" placeholder="�� , ȸ�� �Է��ϼ���" ></input>
				                    </div>
				                </td>
				              </tr> 
				              
				              <tr>
				               <td>����</td>
				                <td>
				                    <div class="mb-3">
				                    	<select id="cityList" name="city">
				                    		<option id="cityOption" value="NN">������ ���� ���ּ���.</option>
				                    	</select>
				                        
				                    </div>
				                </td>
				              </tr> 
				              
				                <tr>
				                <td>�� �Ұ� ��</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <textarea type="text" name="team_intro" id="tintro"  placeholder="�� �Ұ��� ������ ���ּ���." rows="3"></textarea>
				                    </div>
				                </td>
				              </tr> 
				              
				              <tr>
				                <td>�� �ں�</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="file" name="team_emblem" id="emblem" placeholder="�̹����� ���ε��ϼ���">
				                    </div>
				                </td>
				              </tr>  
				              
				              <tr>
				                <td>�� ���� ��</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <textarea type="text" name="team_notice" id="notice"  placeholder="�� ������ �����ϰ� ���ּ���." rows="4"></textarea>
				                    </div>
				                </td>
				              </tr> 
				                  
				                <tr>
				                <td>�� �ο�</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" name="team_num" id="num" placeholder="��, �� �ο��� ���ּ���."></input>
				                    </div>
				                </td>
				              </tr>
				              
				              <tr>
				                <td>�� ���� ����</td>
				                <td>
				                    
				                     <p>���� ���� ����</p>
										  <label><input type="checkbox" name="team_recruit_yn" id="recyn" value="y"> y</label>
										  <label><input type="checkbox" name="team_recruit_yn" id="recyn" value="n"> n</label>
										  <p><input type="submit" value="Submit">
				                        <input type="checkbox" name="team_recruit_yn" id="recyn" value="y"></input>
				                    
				                </td>
				              </tr>
				               
				            
				          </table>
				    
       
          	<div class="container mt-3" style="text-align:right;">
            	<input type="button" value="���" onclick="goWrite()">
         	</div>
					
				
				</form>
		</div>
			<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
		</body>
		
</html>

<script>

function getCityList(){
	$.ajax({
		url: "${commonURL}/selectCity",
		contentType: false,
		processData: false,
		type: "POST"
	})
	.done( (result) => {
		var i=1;
	
	  result.forEach( (item)=>{
	    	var data = "<option "+"value='"+item.city+"'>";
	    	    data +=  item.city ;
	    	    data += "</option>";
	    	i++;
	      	$("#opt1").after(data);
	})
	})
	.fail( (error) => {
		alert("���� �������� ����");
	})
}


function goWrite()
{
	var frm = document.myform;
	if(frm.team_name.value.trim().length<10)
		{
			alert("�̸��� 3���� �̻� �ۼ��ϼ���.");
			frm.title.focus();
			return false;
		}
	
		if(frm.writer.value.trim().length==0)
		{
			alert("�̸��� �ۼ��ϼ���.");
			frm.writer.focus();
			return false;
		}
		
		if(frm.comment.value.trim().length<10)
		{
			alert("������ 10���� �̻� �ۼ��ϼ���.");
			frm.contents.focus();
			return false;
		}
		frm.action="<%=request.getContextPath()%>/gallery/save";
		frm.method="post";
		frm.submit(); //������ �����ϱ�
}

</script>