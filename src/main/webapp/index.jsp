<%@ page import="org.hibernate.*" %>
<%@ page import="com.helper.*" %>
<%@ page import="org.hibernate.Query.*" %>
<%@ page import="com.entities.*" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home Page</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">

    <%--heading area--%>
    <div  class="border border-primary">
        <h1>Employee Details</h1>
    </div>

    <hr class="my-5">

    <div>

        <%--                          Search bar area--%>
        <div>
            <div class="col-lg-6 col-6 text-left">
                <nav class="navbar navbar-light bg-light">
                    <form class="form-inline" action="Search.jsp" method="get">
                        <input class="form-control mr-sm-2" type="search" placeholder="Name of the Employee" aria-label="Search" name="search_name">
                        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search Employee name</button>
                    </form>
                </nav>
            </div>
            <div class="col-lg-3 col-6 text-center">
                <a href="add.jsp" class="btn btn-secondary btn-lg active" role="button" aria-pressed="true">ADD</a>
            </div>
        </div>

        <%--                               Table area--%>
        <div class="col-lg-8 mb-5">

            <table class="table table-bordered table-striped text-center mb-0">
                <thead>
                <tr>
                    <th scope="col">Eid</th>
                    <th scope="col">EName</th>
                    <th scope="col">DOJ</th>
                    <th scope="col">YOE</th>
                    <th scope="col">Designation</th>
                </tr>
                </thead>
                <tbody>
                    <%
//                        Session s= FactoryProvider.getFactory().openSession();
                        Session s= FactoryProvider.getFactory().openSession();
//                        Query q=s.createQuery("from Employee");
                        Query q=s.createQuery("from Employee");
                        List<Employee> list=q.list();

                        for(Employee employee:list){
                    %>
                <tr>
                    <th scope="row"><%= employee.getEid()%></th>
                    <td><%=employee.getEName()%></td>
                    <td><%=employee.getDOJ()%></td>
                    <td><%=employee.getYOE()%></td>
                    <td><%=employee.getDesignation()%></td>
                </tr>
                    <%
                        }
                        s.close();
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>

