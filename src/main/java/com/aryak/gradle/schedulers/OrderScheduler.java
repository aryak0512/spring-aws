package com.aryak.gradle.schedulers;

import com.aryak.gradle.service.OrderService;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class OrderScheduler {

    private final OrderService orderService;

    public OrderScheduler(OrderService orderService) {
        this.orderService = orderService;
    }

    @Scheduled(fixedRate = 1000)
    public void placeOrders() {
        orderService.placeOrder();
        orderService.placeOrder();
    }
}
