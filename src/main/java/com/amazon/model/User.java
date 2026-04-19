package com.amazon.model;

import javax.persistence.*;
import java.io.Serializable;

// Entity Bean per Unit IV (Hibernate) & JavaBean per Unit II
@Entity
@Table(name = "users")
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String username;
    
    private String password;

    public User() {
        // Default constructor for JavaBean & Hibernate
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Getters and Setters (JavaBean Properties)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
}
