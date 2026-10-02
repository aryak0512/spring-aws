package com.aryak.gradle.controller;

import com.aryak.gradle.service.OrderService;
import com.aryak.gradle.utils.MetricsExporter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OrderController {

    private final MetricsExporter metrics;
    private final OrderService orderService;

    public OrderController(final MetricsExporter metrics, OrderService orderService) {
        this.metrics = metrics;
        this.orderService = orderService;
    }

    @GetMapping("/orders")
    public String placeOrder() {
        orderService.placeOrder();
        metrics.recordRequest();
        return "Order placed successfully.";
    }
}
