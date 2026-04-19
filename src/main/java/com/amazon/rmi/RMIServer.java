package com.amazon.rmi;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;

public class RMIServer {
    public static void main(String[] args) {
        try {
            // Start RMI registry
            Registry registry = LocateRegistry.createRegistry(1099);
            
            // Create and bind remote object
            PaymentGateway stub = new PaymentGatewayImpl();
            registry.rebind("PaymentGateway", stub);
            
            System.out.println("RMI Payment Gateway Server is ready.");
        } catch (Exception e) {
            System.err.println("RMI Server exception: " + e.toString());
            e.printStackTrace();
        }
    }
}
