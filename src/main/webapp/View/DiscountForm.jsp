<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Discount Form</title>
        <link rel='stylesheet' type='text/css' media='screen' href='webjars/bootstrap/4.3.1/css/bootstrap.min.css'>
    </head>
    <body>
        <div class="container">
             <h1>Édition des taux</h1>

            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col" >
                            Action
                        </th>
                        <th scope="col">
                            Code
                        </th>
                        <th scope="col">
                            Taux
                        </th>
                    </tr>   
                </thead>
                <tbody>
                    <tr>
                        <form method="POST">
                            <td>
                                <input type="submit" value="Insert" class="form-control"/>                 
                            </td>
                            <td>
                                <input name="code" type="text" required="true" class="form-control"/>
                            </td>
                            <td>
                                <input name="rate" type="number" required="true" min="0" step="0.1" class="form-control"/>
                            </td> 
                            <td>
                                <input name="action" type="hidden" value="insert"/>
                            </td> 
                        </form>
                    </tr>
                    <c:forEach var="item" items="${listeCode}" varStatus="status">
                        <form method="POST">
                            <tr>
                                <td>
                                    <input type="submit" value="Delete" class="form-control"/> 
<!--                                    <input type="submit" value="Update" class="form-control"/>-->
                                </td>
                                <td>
                                    <input name="code" type="hidden" value="${item.getCode()}"/>
                                    <c:out value="${item.getCode()}"/>
                                </td>
                                <td>
                                     <c:out value="${item.getRate()}" />
                                </td> 
                                <td>
                                     <input name="action" type="hidden" value="delete"/>
                                </td> 
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>

            </table>
        </div>
    </body>
</html>
