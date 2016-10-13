//package tt.service.bussiness.impl;
//
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.jca.cci.core.InteractionCallback;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import tt.model.business.Company;
//import tt.service.bussiness.CompanyServiceI;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.StringTokenizer;
//
//import static org.junit.Assert.*;
//
///**
// * Created by taotao on 2016/9/23.
// */
////@RunWith(SpringJUnit45ClassRunner.class)
//
////@WebAppConfiguration
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-ehcache.xml",
//"classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })
//public class CompanyServiceImplTest {
//    @Autowired
//    private CompanyServiceI companyService;
//
//    @Test
//    public void get() throws Exception {
//        Company company  = companyService.get(1);
////        assertEquals(1,company.getId());
//    }
//
//    @Test
//    public void list() throws Exception {
//        Map<String,Object> params = new HashMap<String,Object>();
//        params.put("typ",(byte)1);
//        List<Company> list = companyService.list(null,null,1,10);
//        assertTrue(list.size()>0);
//    }
//
//    @Test
//    public void count() throws Exception {
//        Map<String,Object> params = new HashMap<String,Object>();
//        params.put("typ",(byte)1);
//        assertTrue("count is a number",companyService.count(null,null)>0);
//    }
//
//    @Test
//    public void add() throws Exception {
//        Company company = new Company();
//        company.setContacts("123435");
//        company.setName("zhangsan");
//        company.setTel("123123");
//        company.setTyp((byte)1);
//        companyService.add(company);
//        assertNotNull(company.getId());
//    }
//
//    @Test
//    public void del() throws Exception {
//
//    }
//
//    @Test
//    public void update() throws Exception {
//
//    }
//
//}