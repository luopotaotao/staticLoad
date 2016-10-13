//package tt.dao.business.impl;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import tt.dao.business.ProjectDaoI;
//
//import java.util.List;
//
//import static org.junit.Assert.*;
//
///**
// * Created by tt on 2016/10/1.
// */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-ehcache.xml",
//        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml" })
//
//public class ProjectDaoImplTest {
//    @Autowired
//    private ProjectDaoI projectDaoI;
//    @Test
//    public void queryProjectsByAreaId() throws Exception {
//        List projects = projectDaoI.queryProjectsByAreaId(2);
//        System.out.println(projects.size());
//    }
//
//}