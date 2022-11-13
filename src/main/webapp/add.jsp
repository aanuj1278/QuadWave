<%--
  Created by IntelliJ IDEA.
  User: anuj agarwal
  Date: 11/8/2022
  Time: 12:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="org.hibernate.query.NativeQuery"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.entities.emp_lookup"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Employee"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Page</title>
  <meta charset="utf-8">
  <%@include file="all_js_css_file.jsp"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
      
      <!-- using jQuery to print the value of dropdown in the input field...-->
      $(function(){
          $("#inputEmployeeId1").change(function(){
              var display=$("#inputEmployeeId1 option:selected").val();
              $("#inputEmployeeName1").val(display);
          })
      })
      
      </script>
</head>
<body>
<div class="container">


    <div>
      <h1>ADD EMPLOYEE</h1>
    </div>


    <hr class="my-5">

    <%--                                    Form --%>
  <form action="SaveServlet" method="post">

    <div class="form-row">
      <div class="form-group">
        <label for="inputEmployeeId">EMPLOYEE ID</label>
        
        <select class="bootstrap-select" name="inputEmployeeId" id="inputEmployeeId1">
              <option value="choose" selected="selected" >choose..</option>
              
              <!-- using DB to get the value in the drop down -->
              <%
                  Session s=FactoryProvider.getFactory().openSession();
                  Query q=s.createQuery("from emp_lookup");
                  List<emp_lookup> l=q.list();
                  for(emp_lookup e:l){
                  %>
                  
                               <!-- both the value attribute and the value contain integer -->
                  <option value="<%= e.getEmp_name() %>"><%= e.getEmp_id() %></option>     
                  <%
                      }
                      s.close();
                  %>
        </select>

      </div>
    </div>
    <div class="form-group">
      <label for="inputEmployeeName">EMPLOYEE NAME</label>
      <input type="text" 
             required class="form-control" 
             id="inputEmployeeName1" 
             placeholder="Employee Name" 
             name="name"
             readonly>
    </div>

    <div class="form-group">
      <label for="inputEmployeeYOE">YEAR OF EXPERIENCE</label>
      <input type="number" required class="form-control" id="inputEmployeeYOE" placeholder="Employee Year of experience" name="yoe">
    </div>


    <div class="form-group">
      <label for="inputEmployeeDesignation">DESIGNATION</label>
      <input type="text" required class="form-control" id="inputEmployeeDesignation" placeholder="Employee Designation" name="designation">
    </div>

    <div class="container text-center">
        <button type="submit" class="btn btn-primary" >Save</button>
      <a href="index.jsp" class="btn btn-primary " role="button" aria-pressed="true">Cancel</a>
    </div>
  </form>
</div>

</body>
</html>

