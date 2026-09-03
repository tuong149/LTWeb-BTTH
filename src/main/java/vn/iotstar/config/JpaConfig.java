package vn.iotstar.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceContext;

import io.github.cdimascio.dotenv.Dotenv;
import java.util.HashMap;
import java.util.Map;

@PersistenceContext
public class JpaConfig {
    public static EntityManager getEntityManager() {
        Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
        
        Map<String, String> properties = new HashMap<>();
        properties.put("jakarta.persistence.jdbc.driver", "com.mysql.cj.jdbc.Driver");
        properties.put("jakarta.persistence.jdbc.url", dotenv.get("DB_URL", "jdbc:mysql://localhost:3306/mvc_3tier_db?useUnicode=true&characterEncoding=UTF-8"));
        properties.put("jakarta.persistence.jdbc.user", dotenv.get("DB_USER", "root"));
        properties.put("jakarta.persistence.jdbc.password", dotenv.get("DB_PASSWORD", ""));
        
        EntityManagerFactory factory = Persistence.createEntityManagerFactory("jpa-hibernate-mysql", properties);
        return factory.createEntityManager();
    }
}
