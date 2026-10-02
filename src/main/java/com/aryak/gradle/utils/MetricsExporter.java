package com.aryak.gradle.utils;

import com.timgroup.statsd.Event;
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

    public void sampleCode() {
//        statsd.incrementCounter("example_metric.increment", new String[]{"environment:dev"});
//        statsd.decrementCounter("example_metric.decrement", new String[]{"environment:dev"});
//        statsd.count("example_metric.count", 2, new String[]{"environment:dev"});
    }

    public void recordFailedRequest() {
        Event event = Event.builder()
                .withAlertType(Event.AlertType.ERROR)
                //.withDate(Instant.now().getEpochSecond())
                .withTitle("Order request failed")
                .withText("An order request has failed in the local environment.")
                .build();

        statsd.recordEvent(event);
    }
}
