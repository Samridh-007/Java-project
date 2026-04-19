package com.amazon.rmi;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

public class PaymentGatewayImpl extends UnicastRemoteObject implements PaymentGateway {

    protected PaymentGatewayImpl() throws RemoteException {
        super();
    }

    @Override
    public boolean processPayment(String cardNumber, double amount) throws RemoteException {
        System.out.println("RMI Server processing payment of $" + amount + " for card " + cardNumber);
        // Mock validation: success if card length > 8
        return cardNumber != null && cardNumber.length() > 8;
    }
}
