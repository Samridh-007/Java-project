package com.amazon.sockets;

import java.io.*;
import java.net.*;

// Simple client to connect to the ChatServer
public class ChatClient {
    public static void main(String[] args) {
        try (
            Socket socket = new Socket("localhost", 8081);
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in))
        ) {
            System.out.println("Server said: " + in.readLine());
            
            System.out.println("Type your message (or 'quit' to exit):");
            String userInput;
            while ((userInput = stdIn.readLine()) != null) {
                out.println(userInput);
                System.out.println(in.readLine());
                if ("quit".equalsIgnoreCase(userInput)) {
                    break;
                }
            }
        } catch (UnknownHostException e) {
            System.err.println("Don't know about host localhost");
        } catch (IOException e) {
            System.err.println("Couldn't get I/O for the connection to localhost");
        }
    }
}
