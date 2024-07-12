<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.creditcard.model.User"%>
<%@ page import="com.chainsys.creditcard.model.Account"%>
<%@ page import="com.chainsys.creditcard.dao.AccountRecordsImpl"%>
<%@ page import="com.chainsys.creditcard.dao.UserRecordsImpl"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css">
    
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <title>Customer Details</title>
</head>
<body>
    <div class="header bg-primary text-white text-center p-3 mb-4">
        <a href="AdminPage.jsp" class="text-white mr-3"><i class="fa-solid fa-arrow-left-long"></i></a>
        <img alt="logo" src="images/logo-no-background.png" style="width: 150px;">
    </div>

    <div class="container">
       <table id="customerDetails" class="table table-striped table-bordered table-light">
            <thead class="thead-dark">
                <tr>
                    <th>Customer's ID</th>
                    <th>Name</th>
                    <th>DOB</th>
                    <th>Aadhaar Number</th>
                    <th>Aadhaar Proof</th>
                    <th>PAN</th>
                    <th>PAN Proof</th>
                    <th>E-Mail</th>
                    <th>Phone Number</th>
                </tr>
            </thead>
            <tbody>
                <%        
                User user = new User();
                Account account = new Account();
                ServletContext servletContext = getServletContext();
                ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
                UserRecordsImpl userRecordsImpl = (UserRecordsImpl) context.getBean("userRecordsImpl");
                List<User> info = userRecordsImpl.read();
                
                for (User userDetails : info) {
                    byte[] aadhaarProof = userDetails.getAadhaarProof();
                    byte[] panProof = userDetails.getPanProof();
                %>
                <tr>
                    <td><%= userDetails.getCustomerID() %></td>
                    <td><%= userDetails.getfName() %> <%= userDetails.getlName() %></td>
                    <td><%= userDetails.getDob() %></td>
                    <td><%= userDetails.getAadhaar() %></td>
                    <td class="Img"><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(aadhaarProof) %>" width="100px" height="100px" alt="Aadhaar Proof"></td>
                    <td><%= userDetails.getPan() %></td>
                    <td class="Img"><img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(panProof) %>" width="100px" height="100px" alt="PAN Proof"></td>
                    <td><%= userDetails.getMail() %></td>
                    <td><%= userDetails.getPhone() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    
  <!--   <div id="summa">
    <p>hshgsgshgsjgjsgj</p>
    
    </div> -->

  
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
            $('#customerDetails').DataTable({
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
    
    
      <!--   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
	<script
		src="https://cdn.datatables.net/buttons/2.0.1/js/dataTables.buttons.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jsPDF/2.3.1/jspdf.umd.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

	<script>
    $(document).ready(function() {
        $('#customerDetails').DataTable({
            dom: 'Bfrtip',
            buttons: [
                {
                    text: 'Save div as PDF',
                    action: function ( e, dt, node, config ) {
                        var element = document.getElementById('summa');
                        html2pdf().from(element).save();
                    }
                }
            ]
        });
    });
</script> -->
</body>
<style>
    a {
        color: white;
    }

    a:hover {
        color: black;
    }

    .Img:hover {
        transform: scale(2);
    }

    .header {
        margin-bottom: 20px;
    }

    body {
        background-color: blanchedalmond;
    }

    table, th, td {
        border: solid black 2px;
        border-collapse: collapse;
    }

    th, td {
        padding: 10px;
    }

    th {
        background-color: #f2f2f2;
    }
</style>
</html>
