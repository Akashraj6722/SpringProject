<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.List"%>
<%@ page import="com.chainsys.creditcard.model.CreditCard"%>
<%@ page import="com.chainsys.creditcard.model.Employment"%>
<%@ page import="com.chainsys.creditcard.dao.CardRecordsImpl"%>
<%@ page import="com.chainsys.creditcard.dao.EmploymentRecordsImpl"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!--     <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">
 -->    
 <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.1.0/css/buttons.dataTables.min.css">
    <title>Credit Card Approval</title>
</head>
<body>
    <div class="header">
        <a href="AdminPage.jsp"><i class="fa-solid fa-arrow-left-long"></i></a>
        <img alt="logo" src="images/logo-no-background.png" style="width: 150px;">
    </div>

    <div class="container">
        <table id="cardApproval" class="table table-striped table-bordered table-light">
            <thead class="thead-dark">
                <tr>
                    <th>Customer's ID</th>
                    <th>Account Number</th>
                    <th>Credit Card Number</th>
                    <th>Credit Card Type</th>
                    <th>Credit Card Status</th>
                    <th>Credit Card Approval</th>
                    <th>Income Proof</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%        
                CreditCard creditCard = new CreditCard();
                ServletContext servletContext = getServletContext();
                ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(servletContext);
                CardRecordsImpl cardRecordsImpl = (CardRecordsImpl) context.getBean("cardRecordsImpl");
                List<CreditCard> info = cardRecordsImpl.read();
                EmploymentRecordsImpl employmentRecordsImpl = (EmploymentRecordsImpl) context.getBean("employmentRecordsImpl");
                
                byte[] incomeImage = {};

                for (CreditCard cardDetails : info) {
                    creditCard.setId(cardDetails.getId());
                    List<Employment> list = employmentRecordsImpl.read(creditCard);
                    for (Employment values : list) {
                        incomeImage = values.getIncomeProof();
                    }
                %>
                <tr>
                    <td><%= cardDetails.getId() %></td>
                    <td><%= cardDetails.getAccountNumber() %></td>
                    <td><%= cardDetails.getCardNumber() %></td>
                    <td><%= cardDetails.getCardType() %></td>
                    <td><%= cardDetails.getCardStatus() %></td>
                    <td><%= cardDetails.getCardApproval() %></td>
                    <td class="incomeImg">
                        <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(incomeImage) %>" width="100px" height="100px" alt="Income Proof">
                    </td>
                    <td>
                        <div class="formAction">
                            <form action="cardapproval" method="post" class="d-inline">
                                <input type="hidden" name="action" value="accept">
                                <input type="hidden" name="id" value="<%= cardDetails.getId() %>">
                                <input type="hidden" name="card" value="<%= cardDetails.getCardNumber() %>">
                                <button type="submit" class="btn btn-success">Approve</button>
                            </form>
                            <form action="cardapproval" method="post" class="d-inline">
                                <input type="hidden" name="action" value="reject">
                                <input type="hidden" name="id" value="<%= cardDetails.getId() %>">
                                <input type="hidden" name="card" value="<%= cardDetails.getCardNumber() %>">
                                <button type="submit" class="btn btn-danger">Reject</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% } %>
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
            $('#cardApproval').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'pdf'/* ,
                    {
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
    a {
        color: white;
    }

    a:hover {
        color: black;
    }

    .incomeImg:hover {
        transform: scale(2);
    }

    .header {
        background-color: rgb(20, 136, 236);
        color: #fff;
        height: 75px;
        text-align: center;
        width: 100%;
        top: 0;
        z-index: 1000;
        margin-top: -6px;
    }

    .formAction {
        display: flex;
        gap: 10px;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
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

    .btn {
        padding: 5px 10px;
    }
</style>
</html>
