<%@ page import="com.item" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	//Insert item............
	if (request.getParameter("itemCode") != null)
 	{
 		item itemObj = new item();
 		
 		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 											request.getParameter("itemName"),
 											request.getParameter("itemPrice"),
 											request.getParameter("itemDesc"));

 		session.setAttribute("statusMsg", stsMsg);
 	}

	

	//delete item.....................
	if (request.getParameter("itemID") != null)
	{
		item itemObj = new item();
		
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));

		session.setAttribute("statusMsg", stsMsg);
	}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<h1>Items Management</h1>
	<div class="container">
		<div class="row">
				<div class="col">
						<form method="post" action="items.jsp">
 							Item code: <input name="itemCode" type="text" class="form-control"><br>
 							Item name: <input name="itemName" type="text" class="form-control"><br>
 							Item price: <input name="itemPrice" type="text" class="form-control"><br>
 							Item description: <input name="itemDesc" type="text" class="form-control"><br>
 						<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
						</form>
				
				</div>
		</div>
	</div>
			<div class="alert alert-success">
			<% out.print(session.getAttribute("statusMsg")); %>
			</div>
			<br>
				<%
 					item itemObj = new item();
 					out.print(itemObj.readItems());
				%>
	
</body>
</html>

