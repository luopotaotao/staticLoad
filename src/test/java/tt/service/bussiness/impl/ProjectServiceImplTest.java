//package tt.service.bussiness.impl;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import tt.model.business.Company;
//import tt.model.business.Project;
//import tt.service.bussiness.CompanyServiceI;
//import tt.service.bussiness.ProjectServiceI;
//
//import static org.junit.Assert.*;
//
///**
// * Created by tt on 2016/9/29.
// */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-ehcache.xml",
//        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })
//public class ProjectServiceImplTest {
//    @Autowired
//    private ProjectServiceI projectService;
//    @Autowired
//    private CompanyServiceI companyService;
//    @Test
//    public void get() throws Exception {
//
//    }
//
//    @Test
//    public void list() throws Exception {
//        projectService.list(24,null,1,10);
//    }
//
//    @Test
//    public void count() throws Exception {
//
//    }
//
//    @Test
//    public void add() throws Exception {
//        Company company = companyService.get(1);
//        Project project = new Project();
//        project.setName("测试工程1");
//        project.setCode("code1");
//        project.setBuilder(company);
//        project.setUser(company);
//        project.setConstructor(company);
//        project.setAddress("test address");
//        project.setLat(200.0f);
//        project.setLng(200.0f);
//        project.setNote("测试工程1");
//        projectService.add(project);
//    }
//
//    @Test
//    public void update() throws Exception {
//
//    }
//
//    @Test
//    public void del() throws Exception {
//
//    }
//
//}