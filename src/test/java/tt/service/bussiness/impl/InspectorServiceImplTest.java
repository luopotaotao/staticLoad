//package tt.service.bussiness.impl;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import tt.model.business.User;
//import tt.service.bussiness.UserServiceI;
//
//import java.util.List;
//
//import static org.junit.Assert.*;
//
///**
// * Created by tt on 2016/10/5.
// */
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-ehcache.xml",
//        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })
//public class UserServiceImplTest {
//    @Autowired
//    private UserServiceI service;
//    @Test
//    public void get() throws Exception {
//
//    }
//
//    @Test
//    public void list() throws Exception {
//        List<User> users = service.list(1,null);
//        System.out.println(users.size());
//    }
//
//    @Test
//    public void list1() throws Exception {
//
//    }
//
//    @Test
//    public void list2() throws Exception {
//
//    }
//
//    @Test
//    public void count() throws Exception {
//
//    }
//
//    @Test
//    public void add() throws Exception {
//
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