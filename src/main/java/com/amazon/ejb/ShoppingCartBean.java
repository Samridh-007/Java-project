package com.amazon.ejb;

import com.amazon.model.CartItem;
import com.amazon.model.Product;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

// This simulates a Stateful Session Bean (from Unit II) 
// It maintains the cart state across method calls for a specific client session.
public class ShoppingCartBean implements Serializable {

    private List<CartItem> cartItems;

    public ShoppingCartBean() {
        this.cartItems = new ArrayList<>();
    }

    public void addItem(Product product, int quantity) {
        for (CartItem item : cartItems) {
            if (item.getProduct().getId().equals(product.getId())) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        cartItems.add(new CartItem(product, quantity));
    }

    public void removeItem(Long productId) {
        cartItems.removeIf(item -> item.getProduct().getId().equals(productId));
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public double getTotalAmount() {
        double total = 0;
        for (CartItem item : cartItems) {
            total += item.getTotalPrice();
        }
        return total;
    }
    
    public void clearCart() {
        cartItems.clear();
    }
}
