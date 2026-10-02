package com.aryak.gradle.utils;

import com.timgroup.statsd.StatsDClient;
import org.springframework.stereotype.Component;

@Component
public class MetricsExporter {

    private final StatsDClient statsd;

    public MetricsExporter(final StatsDClient statsd) {
        this.statsd = statsd;
    }

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

    public void recordRequest() {
        statsd.incrementCounter(
                "orders.requests",
                "env:local",
                "service:orderservice"
        );
    }
}
