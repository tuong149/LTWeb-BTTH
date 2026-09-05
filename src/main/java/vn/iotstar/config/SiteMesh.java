package vn.iotstar.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.DispatcherType;

@WebFilter(filterName = "sitemesh", urlPatterns = "/*", dispatcherTypes = {DispatcherType.REQUEST})
public class SiteMesh extends ConfigurableSiteMeshFilter {
    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder.addDecoratorPath("/*", "web.jsp")
               .addDecoratorPath("/admin/*", "admin.jsp")
               .addExcludedPath("/WEB-INF/decorators/*")
               .addExcludedPath("/assets/*")
               .addExcludedPath("*.png")
               .addExcludedPath("*.jpg");
    }
}
