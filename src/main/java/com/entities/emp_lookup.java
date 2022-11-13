/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author anuj agarwal
 */
@Entity
@Table(name="emp_lookup")
public class emp_lookup {
    @Id
    private int Emp_id;
    private String Emp_name;
    
    
    public int getEmp_id() {
        return Emp_id;
    }

    public void setEmp_id(int emp_id) {
        Emp_id = emp_id;
    }
    
    public String getEmp_name() {
        return Emp_name;
    }

    public void setEmp_name(String emp_name) {
        Emp_name = emp_name;
    }
    
    public emp_lookup(int emp_id, String EName) {
        this.Emp_id = emp_id;
        this.Emp_name = EName;
    }
    public emp_lookup(){
        super();
    }
    
    @Override
    public String toString() {
        return "Emp_looup{" +
                "Eid=" + Emp_id +
                ", EName='" + Emp_name +
                '}';
    }
}
