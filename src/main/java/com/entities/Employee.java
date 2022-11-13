package com.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name="Employee")
public class Employee {
    @Id
    private int Eid;
    @Column(length = 1500)
    private String EName;
    private Date DOJ;
    private int YOE;
    private String Designation;

    public int getEid() {
        return Eid;
    }

    public void setEid(int eid) {
        Eid = eid;
    }

    public String getEName() {
        return EName;
    }

    public void setEName(String EName) {
        this.EName = EName;
    }

    public Date getDOJ() {
        return DOJ;
    }

    public void setDOJ(Date DOJ) {
        this.DOJ = DOJ;
    }

    public int getYOE() {
        return YOE;
    }

    public void setYOE(int YOE) {
        this.YOE = YOE;
    }

    public String getDesignation() {
        return Designation;
    }

    public void setDesignation(String designation) {
        Designation = designation;
    }

    public Employee(int eid, String EName, Date DOJ, int YOE, String designation) {
        Eid = eid;
        this.EName = EName;
        this.DOJ = DOJ;
        this.YOE = YOE;
        Designation = designation;
    }
    public Employee(){
        super();
    }

    @Override
    public String toString() {
        return "Employee{" +
                "Eid=" + Eid +
                ", EName='" + EName + '\'' +
                ", DOJ=" + DOJ +
                ", YOE=" + YOE +
                ", Designation='" + Designation + '\'' +
                '}';
    }
}
//<%
//                Session s= FactoryProvider.getFactory().openSession();
//                Query q=s.createQuery("from emp_lookup");
//                List<emp_lookup> list=q.list();
//                for(emp_lookup e:list){
//                %>
//                 <option value="<%=e.getEmp_id()%>"><%=e.getEmp_id()%></option>   
//                 <%
//                     }
//                  s.close();
//            %>