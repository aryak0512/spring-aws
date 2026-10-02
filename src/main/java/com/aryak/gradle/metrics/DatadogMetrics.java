package com.aryak.gradle.metrics;

import com.timgroup.statsd.NonBlockingStatsDClientBuilder;
import com.timgroup.statsd.StatsDClient;
import org.springframework.stereotype.Component;

@Component
public class DatadogMetrics {

    StatsDClient statsd = new NonBlockingStatsDClientBuilder()
            .prefix("orderservice.")
            .hostname("127.0.0.1")
            .port(8125)
            .build();

    public void orderProcessed() {
        statsd.incrementCounter(
                "orders.processed",
                "env:local",
                "service:orderservice"
        );
    }

    public void recordLatency(long milliseconds) {
        statsd.recordExecutionTime(
                "orders.processing_time",
                milliseconds,
                "env:local",
                "service:orderservice"
        );
    }
}
