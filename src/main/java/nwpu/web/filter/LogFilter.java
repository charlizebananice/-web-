package nwpu.web.filter;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 过滤器记录用户日志
 */
@WebFilter("/manager")
@Configuration//将filter交给spring管理
@Order(1)////指定过滤器的执行顺序,值越大越靠后执行
public class LogFilter implements Filter {
    private static final long serialVersionUID = 1L;
    // 得到记录器并读取配置文件 -- 基于类的名称获取日志对象
    private static Logger logger = Logger.getLogger(LogFilter.class);


    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
        //httpServletResponse.getWriter().append("Served at: ").append(httpServletRequest.getContextPath());

        //String referer = httpServletRequest.getHeader("referer");
        long startTime = System.currentTimeMillis();
        String requestUrl = httpServletRequest.getRequestURI();
        requestUrl = httpServletRequest.getQueryString() == null ?requestUrl:(requestUrl+"?"+httpServletRequest.getQueryString());//所有的地址栏参数
        long endTime = System.currentTimeMillis();
        //记录过滤器访问路径及访问用时
        logger.info(httpServletRequest.getRemoteAddr()+"访问了"+requestUrl+",=总用时"+(endTime-startTime)+"毫秒。");
        // 插入记录信息（格式化日志信息）
        // 记录debug级别的信息
        /*logger.debug("调试信息.");
        // 记录info级别的信息
        logger.info("输出信息.");
        // 记录error级别的信息
        logger.error("错误信息.");
        // 记录warn级别的信息
        logger.warn("警告信息.");
        logger.trace("跟踪信息");
        logger.fatal("致命信息");*/
        System.out.println("拦截");
        filterChain.doFilter(servletRequest,servletResponse);
    }

    public void destroy() {

    }
}