package tt.service.bussiness.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tt.service.bussiness.InspectDataServiceI;

import static org.junit.Assert.*;

/**
 * Created by tt on 2016/10/4.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-ehcache.xml",
        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })

public class InspectDataServiceImplTest {
    @Autowired
    private InspectDataServiceI service;
    @Test
    public void list() throws Exception {
        System.out.println(service.list("含","SH00001"));
    }

    @Test
    public void del() throws Exception {

    }

}