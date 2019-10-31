package tw.FunBar.config;

import javax.servlet.Filter;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.orm.hibernate5.support.OpenSessionInViewFilter;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;


public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer
		implements WebApplicationInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootAppConfig.class };
	}


	@Override
	protected Class<?>[] getServletConfigClasses() { 
		return new Class[] { WebAppConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

	@Override
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
		characterEncodingFilter.setEncoding("UTF-8");
		return new Filter[] { characterEncodingFilter };
	}

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(WebAppConfig.class);
		rootContext.setServletContext(servletContext);
		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher",
				new DispatcherServlet(rootContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");

		FilterRegistration.Dynamic filter = servletContext.addFilter("OpenSessionInViewFilter",
				OpenSessionInViewFilter.class);
		filter.setInitParameter("singleSession", "true");
		filter.addMappingForServletNames(null, true, "dispatcher");


		servletContext.addListener(new ContextLoaderListener(rootContext));
	}

}