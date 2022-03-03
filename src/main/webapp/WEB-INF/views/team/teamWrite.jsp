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
		<link rel="stylesheet" href="resources/assets/css/main.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		
	</head>
	
	<body class="single is-preload"> 
			
		<!-- Wrapper -->
			<div id="wrapper">
			
				<!-- nav include-->
				<jsp:include page="../include/nav.jsp"/>
				
				<%
					TeamDto dto = (TeamDto)request.getAttribute("teamDto");
				
				%>
					
				<!-- Main -->
				<form name="myform" method="post" enctype="multipart/form-data">
					<input type="hidden" name="" value=""/>
					<div id="wrapper">
						 <table class="table table-hover " style="margin-top: 30px;">
				            <colgroup>
				                <col width="25%">
				                <col width="*">
				            </colgroup>
				        <div id="title">
				        	<h3><img src="resources/images/note.jpg"width="100" height="100"> �� �� ������ �ۼ��ϰ� ��� �մϴ�.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�� ĭ�� �˸°� ä���ּ���.</h3>
				        </div>
				            <tbody>
				              <tr>
				                <td>�� �̸�</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" class="form-control" id="title" name="title" 
				                        placeholder="�� �̸��� �Է��ϼ���" value="<%=dto.getTeam_name() %>" >
				                    </div>
				                </td>
				              </tr>   
				              
				              <tr>
				                <td>�� �ں�</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="file" class="form-control" id="upload" name="upload" 
				                        placeholder="�̹����� ���ε��ϼ���" value="<%=dto.getTeam_emblem() %>">
				                    </div>
				                </td>
				              </tr>  
				              
				              <tr>
				                <td>����</td>
				                <td>
				                    <div class="col-12">
				                        <select id="cityList" name="cityList">
				                        	<option id="opt1" value="cityList">���ϴ� ������ �������ּ���.</option>
				                        </select>
				                    </div>
				                </td>
				              </tr>         
				                  
				              <tr>
				                <td>ȸ��</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                        <input type="text" class="form-control" id="writer" name="writer" 
				                        placeholder="ȸ�� �Է��ϼ���" value="<%=dto.getTeam_fee() %>">
				                    </div>
				                </td>
				              </tr>      
				              <tr>
				                <td>�� �Ұ�</td>
				                <td>
				                    <div class="mb-3" style="margin-top:13px;">
				                      <textarea class="form-control" rows="5" id="comment" name="comment"><%=dto.getTeam_intro() %></textarea>
				                    </div>
				                </td>
				              </tr>         
				               
				                  
				            </tbody>
				          </table>
       
          		<div class="container mt-3" style="text-align:right;">
            	<input type="button" class="btn btn-secondary" value="���" onclick="goWrite()">
          </div>
					
				</div>
				</form>
		</div>
			<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/browser.min.js"></script>
			<script src="resources/assets/js/breakpoints.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>
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