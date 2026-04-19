package com.amazon.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class CurrencyFetcher {

    // Demonstrates Unit I: URL Connections
    public static double getMockExchangeRate() {
        try {
            // Using a simple API to fetch mock JSON or just fetch google homepage to prove URL connection works
            URL url = new URL("http://example.com");
            URLConnection connection = url.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                // Mock reading some data
                if (inputLine.contains("Example")) {
                    break;
                }
            }
            in.close();
            // Retuning a fixed mock rate for demonstration
            return 1.15; // 1 USD = 1.15 EUR
        } catch (Exception e) {
            System.err.println("URL Connection Error: " + e.getMessage());
            return 1.0; 
        }
    }
}
