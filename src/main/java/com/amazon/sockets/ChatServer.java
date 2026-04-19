package com.amazon.sockets;

import java.io.*;
import java.net.*;

// Multithreading and Socket Programming (Unit I)
public class ChatServer {
    private static final int PORT = 8081;

    public static void main(String[] args) {
        System.out.println("Starting Amazon Customer Support Chat Server on port " + PORT + "...");
        try (ServerSocket serverSocket = new ServerSocket(PORT)) {
            while (true) {
                Socket clientSocket = serverSocket.accept();
                System.out.println("New client connected: " + clientSocket.getInetAddress());
                // Handle each client in a new thread
                new Thread(new ClientHandler(clientSocket)).start();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

class ClientHandler implements Runnable {
    private Socket socket;

    public ClientHandler(Socket socket) {
        this.socket = socket;
    }

    @Override
    public void run() {
        try (
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true)
        ) {
            out.println("Welcome to Amazon Support! How can we assist you today?");
            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                System.out.println("Received: " + inputLine);
                if ("quit".equalsIgnoreCase(inputLine)) {
                    out.println("Goodbye!");
                    break;
                }
                out.println("Agent: Thank you for your message ('" + inputLine + "'). A mock agent will be with you shortly.");
            }
        } catch (IOException e) {
            System.err.println("Client handler exception: " + e.getMessage());
        } finally {
            try { socket.close(); } catch (IOException e) {}
        }
    }
}
