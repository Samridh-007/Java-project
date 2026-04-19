package com.amazon.rmi;

import java.rmi.Remote;
import java.rmi.RemoteException;

// RMI from Unit IV
public interface PaymentGateway extends Remote {
    
    // Parameter Passing in Remote Methods
    boolean processPayment(String cardNumber, double amount) throws RemoteException;
}
