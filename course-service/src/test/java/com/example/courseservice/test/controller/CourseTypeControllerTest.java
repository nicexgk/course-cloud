package com.example.courseservice.test.controller;

import com.example.common.entity.User;
import com.example.courseservice.controller.CourseTypeController;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockServletContext;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

//@RunWith(SpringRunner.class)
//@SpringBootTest()

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = MockServletContext.class)
public class CourseTypeControllerTest {

    @Autowired
    private WebApplicationContext webApplicationContext;
    private MockMvc mockMvc;
    private RequestBuilder request;

    @Before
    public void setUp(){
        mockMvc = MockMvcBuilders.standaloneSetup(webApplicationContext).build();
    }

    @Test
   public void testGetType() throws Exception {
        request = get("/type").contentType(MediaType.APPLICATION_JSON);
        MvcResult result = mockMvc.perform(request).andReturn();
        System.out.println(result.getResponse().getStatus());
        System.out.println(result.getResponse().getContentAsString());

        System.out.println("nice nice nice");
   }
}
