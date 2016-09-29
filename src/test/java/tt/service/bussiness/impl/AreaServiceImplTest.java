package tt.service.bussiness.impl;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tt.model.business.Area;
import tt.service.bussiness.AreaServiceI;

/**
 * Created by tt on 2016/9/29.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring.xml", "classpath:spring-ehcache.xml",
        "classpath:spring-hibernate.xml", "classpath:spring-druid.xml", "classpath:spring-tasks.xml" })
public class AreaServiceImplTest {
    @Autowired
    private AreaServiceI areaServiceI;
    @Before
    public void setUp() throws Exception {

    }

    @After
    public void tearDown() throws Exception {

    }

    @Test
    public void load() throws Exception {
        Area area = areaServiceI.load(1);
        if(area!=null){
            System.out.println(area.getText());
            if(area.getChildren()!=null&&area.getChildren().size()>0){
                area.getChildren().stream().forEach((item)-> System.out.println(" "+item.getText()));
            }
        }
    }

    @Test
    public void add() throws Exception {
        Area area = new Area();
        area.setText("全国");
        area.setLevel((byte)0);
        areaServiceI.add(area);

        Area hebei = new Area();
        hebei.setText("河北");
        hebei.setLevel((byte) (area.getLevel()+1));
        hebei.setParent(area);
        areaServiceI.add(hebei);

    }

    @Test
    public void update() throws Exception {
        Area area = areaServiceI.load(1);
        Area hebei = new Area();
        hebei.setText("河北");
        hebei.setLevel((byte) (area.getLevel()+1));
        hebei.setParent(area);
        areaServiceI.add(hebei);
    }

    @Test
    public void del() throws Exception {
        areaServiceI.del(4);
    }

}