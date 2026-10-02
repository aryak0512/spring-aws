package com.aryak.gradle.controller;

import com.aryak.gradle.service.OrderService;
import com.aryak.gradle.utils.MetricsExporter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@Slf4j
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

        // adding random failure
        if (new Random().nextInt(15) < 10) {
            metrics.recordFailedRequest();
            log.error("Failed to place order.");
            return "Failed to place order.";
        }

        return "Order placed successfully.";
    }
}
