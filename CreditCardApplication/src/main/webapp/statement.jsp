<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List"%>
<%@ page import="com.chainsys.creditcard.model.Transactions"%>

<%@ page  import="org.springframework.context.ApplicationContext"%> 
<%@ page  import="org.springframework.web.context.WebApplicationContext"%>
<%@ page  import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<%@ page import="com.chainsys.creditcard.dao.TransactionRecordsDAO"%>


    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">



   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css">
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
<title>Statement</title>

 
</head>
<body>
<div class="header bg-primary text-white text-center p-3 mb-4">
        <a href="AdminPage.jsp" class="text-white mr-3"><i class="fa-solid fa-arrow-left-long"></i></a>
        <img alt="logo" src="images/logo-no-background.png" style="width: 150px;">
    </div>
<div>
<table id="statement" class="table table-striped table-bordered table-light">
  <thead class="thead-dark">
		<tr>
			<th>Card Number</th>
			<th>Transaction ID</th>
			<th>Date & Time</th>
 			<th>Amount</th>
			<th>Description</th>
		</tr>
		
		 </thead>
         <tbody>
		<%
		Transactions transactions = new Transactions();
		
		
		Transactions model=(Transactions)request.getAttribute("transactions");
		
		System.out.println("A"+model.getId());
		System.out.println("B"+model.getCardNumber());

		transactions.setId(model.getId());
		transactions.setCardNumber(model.getCardNumber());
		
		 ServletContext servletContext = getServletContext();
	     ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);

	     TransactionRecordsDAO transactionRecordsDAO= (TransactionRecordsDAO) context.getBean("transactionRecordsDAO");
		
		
		List<Transactions> list = (List<Transactions>)transactionRecordsDAO.read(transactions);
				
				for(Transactions values:list) {
					
					
				System.out.println("values"+values.getCardNumber());
					
		%>
 
 <tr>
			<td><%=values.getCardNumber()%></td>
			<td><%=values.getTranscationId()%></td>
		    <td><%=values.getDateTime()%></td>
			<td><%=values.getAmount()%></td>
			<td><%=values.getDescription()%></td>
			
</tr>
			
<%} %>
           </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.1.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.1.0/js/buttons.html5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#statement').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'pdf',
           /*          {
                        extend: 'pdf',
                        text: 'Save current page',
                        exportOptions: {
                            modifier: {
                                page: 'current'
                            }
                        }
                    } */
                ]
            });
        });
    </script>
    
</body>
<style>
* {
	margin: 0%;
	padding: 0%;
	box-sizing: border-box;
}
body {
	background-color: blanchedalmond;
}

table, th, td {
	border: solid black 2px;
	border-collapse: collapse;
	margin-top: 40px;
	margin-left: 20px;
}

th, td {
	padding: 10px;
}

th {
	background-color: #f2f2f2;
}
</style>
</html>