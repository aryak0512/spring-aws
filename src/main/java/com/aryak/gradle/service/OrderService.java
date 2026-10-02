package com.aryak.gradle.service;

import com.aryak.gradle.metrics.DatadogMetrics;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class OrderService {

    private final DatadogMetrics metrics;

    public OrderService(DatadogMetrics metrics) {
        this.metrics = metrics;
    }

    public void placeOrder() {

        // business logic

        metrics.orderProcessed();
        log.info("Order placed.");
    }
}
