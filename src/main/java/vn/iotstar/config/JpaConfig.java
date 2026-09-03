package vn.iotstar.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;
import vn.iotstar.util.ConfigLoader;
import java.util.HashMap;
import java.util.Map;

@PersistenceContext
public class JpaConfig {
    public static EntityManager getEntityManager() {
        Map<String, String> properties = new HashMap<>();
        properties.put("jakarta.persistence.jdbc.driver", "com.mysql.cj.jdbc.Driver");
        properties.put("jakarta.persistence.jdbc.url", ConfigLoader.get("DB_URL", "jdbc:mysql://localhost:3306/mvc_3tier_db?useUnicode=true&characterEncoding=UTF-8"));
        properties.put("jakarta.persistence.jdbc.user", ConfigLoader.get("DB_USER", "root"));
        properties.put("jakarta.persistence.jdbc.password", ConfigLoader.get("DB_PASSWORD", ""));
        
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("jpa-hibernate-mysql", properties);
        return factory.createEntityManager();
    }
}
