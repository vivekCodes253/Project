package com.scrum;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.scrum.business.Employee;
import com.scrum.business.Task;
import com.scrum.repositories.EmployeeRepository;
import com.scrum.repositories.LoginRepository;
import com.scrum.repositories.TaskRepository;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
public class ScrumControllerTest {

    @Autowired
    private MockMvc mockMvc;
    
    @MockBean
	TaskRepository taskRepo;

	@MockBean
	EmployeeRepository empRepo;

	@MockBean
	LoginRepository logRepo;

    @Test
    public void testLogin() throws Exception {
        this.mockMvc.perform(get("/")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testDashboard() throws Exception {
    	List<Task> tasks= new ArrayList<Task>();
    	Mockito.when(taskRepo.allTasks("xxxx")).thenReturn(tasks);
        this.mockMvc.perform(get("/dashboard")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testEmployeedashboard() throws Exception {
    	List<Employee> emp= new ArrayList<>();
    	Mockito.when(empRepo.allEmployee("xxxx")).thenReturn(emp);
        this.mockMvc.perform(get("/employeedashboard")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testModify() throws Exception {
        this.mockMvc.perform(get("/modify")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testAddTasks() throws Exception {
    	List<Employee> emp= new ArrayList<>();
    	Mockito.when(empRepo.allEmployee("xxxx")).thenReturn(emp);
        this.mockMvc.perform(get("/addtasks")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testGetTaskDetails() throws Exception {
    	Task task= new Task();
    	Mockito.when(taskRepo.getTaskById("xxxx")).thenReturn(task);
        this.mockMvc.perform(get("/getTaskDetails").param("task_id", "SC45678")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testAddMembers() throws Exception {
    	List<Employee> emp= new ArrayList<>();
    	Mockito.when(empRepo.specificEmployees("xxxx")).thenReturn(emp);
        this.mockMvc.perform(get("/addmembers")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testSave() throws Exception {
        this.mockMvc.perform(get("/save")).andDo(print()).andExpect(status().isOk());
    }
    
    @Test
    public void testLogout() throws Exception {
        this.mockMvc.perform(get("/logout")).andDo(print()).andExpect(status().isOk());
    }
    
    
    
}