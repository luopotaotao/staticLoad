package tt.servlet;


import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.security.SecureRandom;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tt.util.RandomUtil;


public class AuthImg extends HttpServlet
{
    /**
     *
     */
    private static final long serialVersionUID = -7099312208878086233L;

    // private static final String CONTENT_TYPE = "text/html; charset=UTF-8";
    // 设置验证码字体样式
    private Font mFont = new Font("微软雅黑", Font.BOLD, 18);

    // Initialize global variables
    public void init()
        throws ServletException
    {}

    // Process the HTTP Get request
    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        response.setContentType("image/jpeg");
        ServletOutputStream out = response.getOutputStream();

        // 设置验证码图片大小
        int width = 65;
        int height = 23;

        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics g = image.getGraphics();
        SecureRandom random = new SecureRandom();

        // 设置图片背景颜色
        g.setColor(getRandColor(200, 250));
        g.fillRect(0, 0, width, height);

        g.setFont(mFont);

        // 绘制干扰线
        g.setColor(getRandColor(160, 200));
        for (int i = 0; i < 50; i++ )
        {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int xl = random.nextInt(12);
            int yl = random.nextInt(12);
            g.drawLine(x, y, x + xl, y + yl);
        }

        // String rand = RandomStringUtils.randomNumeric(4);
        String rand = RandomUtil.getStringRandom(4);
        char c;
        for (int i = 0; i < 4; i++ )
        {
            c = rand.charAt(i);
            // 设置每个字的颜色
            g.setColor(new Color(10 + random.nextInt(120), 10 + random.nextInt(120),
                10 + random.nextInt(120))); // 调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
            g.drawString(String.valueOf(c), 13 * i + 6, 20);
        }

        // 放入Session，解决Cookie出错的问题
        HttpSession seesion = request.getSession();
        seesion.setAttribute("authCode", rand);

        // JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
        // encoder.encode(image);

        ImageIO.write(image, "JPEG", response.getOutputStream());
        out.close();
    }

    // Process the HTTP Post request
    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
        doGet(request, response);
    }

    // Clean up resources
    public void destroy()
    {}

    private Color getRandColor(int fc, int bc)
    { // 给定范围获得随机颜色
        SecureRandom random = new SecureRandom();
        if (fc > 255)
        {
            fc = 255;
        }
        if (bc > 255)
        {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }

    public boolean validate(String authImg, HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        String authCode = (String)session.getAttribute("authCode");
        return authCode.equals(authImg);
    }

}
