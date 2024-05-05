package com.bookstore.controller.frontend.shoppingcart;

import com.bookstore.entity.Book;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class ShoppingCart {
    private Map<Book, Integer> cart = new HashMap<>();

    public Map<Book, Integer> getItems() {
        return this.cart;
    }

    public int getTotalQuantity() {
        int total = 0;

        Iterator<Book> iterator = this.cart.keySet().iterator();
        while (iterator.hasNext()) {
            Book book = iterator.next();
            total += this.cart.get(book);
        }

        return total;
    }

    public float getTotalAmount() {
        float total = 0;
        Iterator<Book> iterator = this.cart.keySet().iterator();
        while (iterator.hasNext()) {
            Book book = iterator.next();
            Integer quantity = this.cart.get(book);
            float subTotal = quantity * book.getPrice();
            total += subTotal;

        }
        return total;
    }

    public int getTotalItem() {
        return cart.size();
    }

    public void addItem(Book book) {
        if (cart.containsKey(book)) {
            cart.put(book, cart.get(book) + 1);
        } else {
            cart.put(book, 1);
        }
    }

    public void removeItem(Book book) {
        cart.remove(book);
    }

    public void clear() {
        cart.clear();
    }


    public void updateCart(int[] bookIds, int[] quantities) {
        for (int i = 0; i < bookIds.length; i++) {
            Book key = new Book(bookIds[i]);
            Integer value = quantities[i];
            cart.put(key, value);
        }
    }
}
