package tt.controller.bussiness;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;
import static org.junit.Assert.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Created by taotao on 2016/9/27.
 */

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-mvc.xml","classpath:spring-ehcache.xml",
        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })
public class ModuleBasicCompanyControllerTest {
    @Autowired
    private WebApplicationContext webApplicationContext;
    private Object controller;
    private MockMvc mvc;
    private MockMvc mvcMock;
    @Before
    public void init(){
        controller = new ModuleBasicCompanyController();
        mvc = MockMvcBuilders.standaloneSetup(controller).build();
        mvcMock = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void printBeans(){
        String[] beans=webApplicationContext.getBeanDefinitionNames();
        for (String bean : beans) {
            System.out.println(bean);
        }
    }
    @Test
    public void index() throws Exception {
        ResultActions ra =mvc.perform(
                MockMvcRequestBuilders
                        .get("/moduleBasicCompanyController/index.action")
                        .param("departmentId", "1")
                        .param("staffId", "1"));
        final MvcResult result = ra.andReturn();
        assertThat(result.getResponse().getStatus(), is(200));//判断响应状态是否正常
    }

    @Test
    public void companyIndex() throws Exception {

    }

    @Test
    public void getTest() throws Exception {
        ResultActions ra =mvc.perform(
                MockMvcRequestBuilders
                        .get("/moduleBasicCompanyController/get/1.action")).andExpect(jsonPath("id").exists());
//        final MvcResult result = ra.andReturn();
//        System.out.println(result.getResponse().getContentAsString());
//        assertThat(result.getResponse().getStatus(), is(200));//判断响应状态是否正常
//        mvcMock.perform(get("/moduleBasicCompanyController/get/1.action")).andExpect(jsonPath("id").exists());
    }

    @Test
    public void list() throws Exception {
//        ResultActions ra =mvc.perform(
//                MockMvcRequestBuilders
//                        .get("/moduleBasicCompanyController/query.action?page=1&rows=10"));
//        final MvcResult result = ra.andReturn();
//        System.out.println(result.getResponse().getContentAsString());
//        assertThat(result.getResponse().getStatus(), is(200));//判断响应状态是否正常
        mvcMock.perform(get("/moduleBasicCompanyController/query")).andExpect(jsonPath("total").exists());
    }

    @Test
    public void add() throws Exception {

    }

    @Test
    public void update() throws Exception {

    }

    @Test
    public void delete() throws Exception {

    }

}