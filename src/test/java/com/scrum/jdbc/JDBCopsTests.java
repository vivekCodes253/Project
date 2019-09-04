package com.scrum.jdbc;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;


import com.scrum.business.Employee;


public class JDBCopsTests {
	@InjectMocks private JDBCops jdbcops;
	  @Mock private Connection mockConnection;
	  @Mock private Statement mockStatement;
	  @Mock private ResultSet rs;
	  
	  
	 
	  @Before
	  public void setUp() {
	    MockitoAnnotations.initMocks(this);
	    
	  
	  }
	  
	  @Test
	  public void testMockallEmployee() throws Exception {
		    Mockito.when(mockConnection.createStatement()).thenReturn(mockStatement);
		    Mockito.when(mockConnection.createStatement().executeUpdate(Mockito.any())).thenReturn(1);
		    List<Employee> emp= jdbcops.allEmployee("xxxx");
		    Assert.assertEquals(emp, new ArrayList<Employee>());
		    //Mockito.verify(mockConnection.createStatement(), Mockito.times(1));
		  }
	  
	  @Test
	  public void testspecificEmployee() throws Exception {
		    Mockito.when(mockConnection.createStatement()).thenReturn(mockStatement);
		    Mockito.when(mockConnection.createStatement().executeUpdate(Mockito.any())).thenReturn(1);
		    Employee e= new Employee("Rahul","rs67689","manager","yes","bs65643","FX1234");
		    Mockito.when(mockStatement.executeQuery("")).thenReturn(rs);
		    Mockito.when(rs.next()).thenReturn(true, false); 
		    Mockito.when(rs.getString(1)).thenReturn(e.getName());
	        Mockito.when(rs.getString(2)).thenReturn(e.getSoeid());
	        Mockito.when(rs.getString(3)).thenReturn(e.getRole());
	        Mockito.when(rs.getString(4)).thenReturn(e.getSecondary_scrum());
	        Mockito.when(rs.getString(5)).thenReturn(e.getManager_id());
	        Mockito.when(rs.getString(6)).thenReturn(e.getProject_id());
	        List<Employee> emp= jdbcops.specificEmployees("manager");
		    Assert.assertEquals(emp.get(0).getSoeid(), e.getSoeid());
		   // Mockito.verify(mockConnection.createStatement(), Mockito.times(1));
		  }
}
