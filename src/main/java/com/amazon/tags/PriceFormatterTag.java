package com.amazon.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;

public class PriceFormatterTag extends SimpleTagSupport {
    private double price;

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public void doTag() throws JspException, IOException {
        NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
        String formattedPrice = currencyFormatter.format(price);
        getJspContext().getOut().write("<span class='price'>" + formattedPrice + "</span>");
    }
}
