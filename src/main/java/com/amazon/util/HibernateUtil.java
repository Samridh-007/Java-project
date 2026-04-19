package com.amazon.util;

import com.amazon.model.Product;
import com.amazon.model.User;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class HibernateUtil {
    private static StandardServiceRegistry registry;
    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            try {
                // Create registry
                registry = new StandardServiceRegistryBuilder().configure().build();
                
                // Create MetadataSources
                MetadataSources sources = new MetadataSources(registry);
                
                // Create Metadata
                Metadata metadata = sources.getMetadataBuilder().build();
                
                // Create SessionFactory
                sessionFactory = metadata.getSessionFactoryBuilder().build();

                // Seed Initial Data
                seedData();

            } catch (Exception e) {
                e.printStackTrace();
                if (registry != null) {
                    StandardServiceRegistryBuilder.destroy(registry);
                }
            }
        }
        return sessionFactory;
    }

    public static void shutdown() {
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry);
        }
    }

    // Method to seed initial data for the Amazon Clone
    private static void seedData() {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            // Check if user exists
            Long userCount = (Long) session.createQuery("SELECT count(u) FROM User u").uniqueResult();
            if (userCount == 0) {
                User testUser = new User("admin", "password");
                session.save(testUser);

                Product p1 = new Product("Laptop", "High end gaming laptop", 85999.0, "images/laptop.png");
                Product p2 = new Product("Smartphone", "Latest model with 5G", 45000.0, "images/smartphone.png");
                Product p3 = new Product("Headphones", "Noise cancelling", 18500.0, "images/headphones.png");
                Product p4 = new Product("Monitor", "4K Ultra HD", 32000.0, "images/monitor.png");

                session.save(p1);
                session.save(p2);
                session.save(p3);
                session.save(p4);
            }

            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            session.close();
        }
    }
}
