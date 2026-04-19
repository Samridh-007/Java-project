package com.amazon.ejb;

import com.amazon.model.Product;
import com.amazon.util.HibernateUtil;
import org.hibernate.Session;
import java.util.List;

// This simulates a Stateless Session Bean (from Unit II)
// In a true Java EE environment, this would have @Stateless annotation
public class ProductCatalogBean {

    public ProductCatalogBean() {
    }

    public List<Product> getAllProducts() {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createQuery("from Product", Product.class).list();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Product getProductById(Long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Product.class, id);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
