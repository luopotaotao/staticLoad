package tt.pageModel;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Pattern;

import static org.junit.Assert.*;

/**
 * Created by tt on 2016/9/28.
 */
public class SessionInfoTest {
    @Before
    public void setUp() throws Exception {
        Set<Pattern> set = new HashSet<>();
        Pattern p1 = Pattern.compile("abc");
        Pattern p2 = Pattern.compile("abc");
        set.add(p1);
        set.add(p2);
        System.out.println(set.size());
    }

    @After
    public void tearDown() throws Exception {

    }
    @Test
    public void run(){

    }

}