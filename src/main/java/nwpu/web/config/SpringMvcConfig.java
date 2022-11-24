package nwpu.web.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan({"nwpu.web.controller","nwpu.web.filter","nwpu.web.config"})
//开启json数据类型自动转换
@EnableWebMvc
public class SpringMvcConfig implements WebMvcConfigurer {
    //内部资源视图解析器,用于将提供的URI解析为实际URI,前缀+ view-name + suffix
    @Bean
    public InternalResourceViewResolver internalResourceViewResolver(){
        InternalResourceViewResolver view=new InternalResourceViewResolver();
        view.setSuffix(".jsp");
        view.setPrefix("/WEB-INF/views/");
        return view;
    }
    //视图跳转控制器
    public void addViewControllers(ViewControllerRegistry registry) {
        //registry.addViewController("/toLogin").setViewName("login");
    }
    //创建拦截器
    public void addInterceptors(InterceptorRegistry registry) {
        //registry.addInterceptor(new FirstInterceptor()).addPathPatterns("/**");
        //registry.addInterceptor(new SecondInterceptor()).addPathPatterns("/**");
    }
    /**
     * 静态资源处理器，但是这个方法似乎和
     * @see SpringMvcSupport 等价
     */
    /*public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer)
    {
        configurer.enable();
    }*/

}