package tt.service.bussiness.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tt.model.business.Overview;
import tt.model.business.Project;
import tt.service.bussiness.OverviewServiceI;
import tt.service.bussiness.ProjectServiceI;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by tt on 2016/10/1.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-ehcache.xml",
        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })
public class OverviewServiceImplTest {
    @Autowired
    private OverviewServiceI overviewService;

    @Autowired
    private ProjectServiceI projectServiceI;

    @Test
    public void queryProjects() throws Exception {
        List<Project> projects = projectServiceI.list(2);
        System.out.println(projects.size());
    }

    @Test
    public void queryOverviews() throws Exception {
        List<Overview> overviews = overviewService.queryOverviews(1);
        System.out.println(overviews.size());
    }

}