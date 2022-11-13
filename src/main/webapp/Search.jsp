<%-- 
    Document   : Search
    Created on : Nov 10, 2022, 1:50:25 PM
    Author     : anuj agarwal
--%>
<%@page import="org.hibernate.query.NativeQuery"%>
<%@ page import="org.hibernate.*" %>
<%@ page import="com.helper.*" %>
<%@ page import="org.hibernate.Query.*" %>
<%@ page import="com.entities.*" %>
<%@ page import="java.util.List" %>
<%@page import=" java.lang.reflect.Array" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%--heading area--%>
    <div  class="border border-primary">
        <h1>Searched Employee's</h1>
    </div>

    <hr class="my-5">

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
                        String Sname=request.getParameter("search_name");
                        Session s= FactoryProvider.getFactory().openSession();
                        NativeQuery q = s.createSQLQuery("SELECT * FROM Employee WHERE EName LIKE '%"+Sname+"%';");
//                        Query q=s.createQuery("from Employee a where contains ( a.EName, Sname)");
//                        Select a.Eid, a.EName, a.DOJ, a.YOE, a.Designation from Employee a where a.EName=:x
//                        Query q = em.createQuery("from fAdjustmentReason a where a.startDate >= " + currentDate + " and a.endDate <= " + currentDate);
//                        q.setParameter("x",Sname);
                        List<Object[]> list=q.list();
                        for(Object[] employee:list){
                    %>
                <tr>
                    <th scope="row"><%= Array.get(employee,1) %></th>
                    <th scope="row"><%= Array.get(employee,4) %></th>
                    <th scope="row"><%= Array.get(employee,2) %></th>
                    <th scope="row"><%= Array.get(employee,5) %></th>
                    <th scope="row"><%= Array.get(employee,3) %></th>
                </tr>
                    <%
                        }
                        s.close();
                    %>
                </tbody>
                
            </table>
                <div><a href='index.jsp'><button class="btn btn-outline-success my-2 my-sm-0" type="submit">OK</button></a></div>
        </div>
        
    </body>
</html>
