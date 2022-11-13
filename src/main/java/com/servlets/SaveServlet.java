/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlets;

import com.entities.Employee;
import com.helper.FactoryProvider;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;

/**
 *
 * @author anuj agarwal
 */
@WebServlet(name = "SaveServlet", urlPatterns = {"/SaveServlet"})
public class SaveServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int a = 0;
                    //Name_DD will store the name of the employee from the emp_lookup table
            String Name_DD = request.getParameter("inputEmployeeId");
            
                              // DB Connectivity (emp_lookup )
            Session s=FactoryProvider.getFactory().openSession();
            NativeQuery q=s.createSQLQuery("select * from emp_lookup where Emp_name='"+Name_DD+"'");
            List<Object[]> list=q.list();
            for(Object[] E : list){
                a=(int)Array.get(E, 1);
            }
//            emp_lookup as=(emp_lookup)q.uniqueResult();
//            a=as.getEmp_id();
            
            s.close();
            
            String name = request.getParameter("name");
            int yoe = Integer.parseInt(request.getParameter("yoe"));
            String designation = request.getParameter("designation");
            

            Employee em=new Employee();
            em.setEid(a);
            em.setEName(name);
            em.setDOJ(new Date());
            em.setYOE(yoe);
            em.setDesignation(designation);

            Session session= FactoryProvider.getFactory().openSession();
            Transaction transaction = session.beginTransaction();

            //saving the object of the employee class
            session.save(em);

            transaction.commit();
            session.close();
            
            response.sendRedirect("index.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
