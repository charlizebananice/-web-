package nwpu.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurationSupport;
import org.springframework.web.servlet.resource.PathResourceResolver;
import org.springframework.web.servlet.resource.WebJarsResourceResolver;

//springMVC默认拦截静态资源，应对这些静态资源放行
@Configuration
public class SpringMvcSupport extends WebMvcConfigurationSupport {

    /**
     * 放行静态资源方法
     * @param registry
     */
    @Override
    protected void addResourceHandlers(ResourceHandlerRegistry registry) {
        //对webjars中的资源放行
        registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/");
//        registry.addResourceHandler("/static/**").addResourceLocations("/static/");
//        registry.addResourceHandler("/css/**").addResourceLocations("/css/");
//        registry.addResourceHandler("/js/**").addResourceLocations("/js/");
//        registry.addResourceHandler("/js/**").addResourceLocations("/js/");
//        registry.addResourceHandler("/plugins/**").addResourceLocations("/plugins/");
//        registry.addResourceHandler("/webjars/**").addResourceLocations("/META-INF/resources/webjars/");
//        registry.addResourceHandler("/webjars/**").addResourceLocations("/webjars/").resourceChain(false)
//                .addResolver(new WebJarsResourceResolver())
//                .addResolver(new PathResourceResolver());
//        registry.addResourceHandler(getServletContext().getContextPath()+"/bootstrap-4.6.1.jar/META-INF/resources/webjars/bootstrap/4.6.1/css");
//        registry.addResourceHandler(getServletContext().getContextPath()+"/jquery-3.5.1.jar/META-INF/resources/webjars/jquery/3.5.1");
//        //当使用 Spring Framework 4.2 或更高版本时，
//        //它会自动检测类路径上的 webjars-locator-core 库，
//        //并使用它自动为您解析任何 WebJar 资产的版本。为了启用此功能，您需要将 webjars-locator-core 库添加为应用程序的依赖项
//        registry.addResourceHandler("/resources/**").addResourceLocations("/");
        super.addResourceHandlers(registry);
    }
}
