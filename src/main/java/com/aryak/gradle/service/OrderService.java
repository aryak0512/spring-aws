package com.aryak.gradle.service;

import com.aryak.gradle.utils.MetricsExporter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class OrderService {

    private final MetricsExporter metrics;

    public OrderService(MetricsExporter metrics) {
        this.metrics = metrics;
    }

    public void placeOrder() {

        // business logic

        metrics.orderProcessed();
        log.info("Order placed.");
    }
}
