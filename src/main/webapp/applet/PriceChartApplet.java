import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;

// Implements Applet Programming from Unit I
public class PriceChartApplet extends Applet {

    public void init() {
        setBackground(Color.white);
    }

    public void paint(Graphics g) {
        g.setColor(Color.black);
        g.drawString("Product Price Trend (Mock)", 10, 20);
        
        // Draw a simple mock chart
        g.setColor(Color.blue);
        g.drawLine(10, 100, 10, 30); // Y axis
        g.drawLine(10, 100, 150, 100); // X axis
        
        g.setColor(Color.red);
        g.drawLine(10, 90, 50, 60);
        g.drawLine(50, 60, 90, 80);
        g.drawLine(90, 80, 140, 40);
    }
}
