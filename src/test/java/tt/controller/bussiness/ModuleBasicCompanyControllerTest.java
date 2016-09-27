package tt.controller.bussiness;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.Result;
import org.junit.runner.RunWith;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.RequestBuilder;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.ModelAndView;
import tt.controller.MonitorController;

import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

/**
 * Created by taotao on 2016/9/27.
 */

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml","classpath:spring-mvc.xml", "classpath:spring-ehcache.xml",
        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })
public class ModuleBasicCompanyControllerTest {

    private Object controller;
    private MockMvc mvc;
    @Before
    public void init(){
        controller = new ModuleBasicCompanyController();
        mvc = MockMvcBuilders.standaloneSetup(controller).build();

    }
    @Test
    public void index() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();

        MockHttpServletResponse response = new MockHttpServletResponse();

        request.setMethod("GET");

        request.addParameter("viewDetails", "true");

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
    public void get() throws Exception {

    }

    @Test
    public void list() throws Exception {

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