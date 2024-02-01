/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hello
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(int id) {
        for (Item item : items) {
            if (item.getTour().getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void addItem(Item item) {
        if (getItemById(item.getTour().getId()) != null) {
            Item m = getItemById(item.getTour().getId());
            m.setQuantity(m.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double t = 0, price = 0;
        for (Item item : items) {
            price = Double.parseDouble(item.getPrice());
            t += (item.getQuantity() * price);
        }
        return t;
    }

    private Tour getTourById(int id, List<Tour> list) {
        for (Tour p : list) {
            if (p.getId() == id) {
                return p;
            }
        }
        return null;
    }

    public Cart(String txt, List<Tour> list) {
        items = new ArrayList<>();
        int id, quantity;
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    id = Integer.parseInt(n[0]);
                    quantity = Integer.parseInt(n[1]);
                    Tour t = getTourById(id, list);
                    Item it = new Item(t, quantity, txt);
                    addItem(it);
                }
            }
        } catch (NumberFormatException e) {
            System.out.println(e);
        }
    }
    
    

}
