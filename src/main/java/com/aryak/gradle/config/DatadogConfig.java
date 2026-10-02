package com.aryak.gradle.config;

import com.timgroup.statsd.NonBlockingStatsDClientBuilder;
import com.timgroup.statsd.StatsDClient;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class DatadogConfig {

    @Bean
    public StatsDClient statsDClient() {
        return new NonBlockingStatsDClientBuilder()
                .prefix("orderservice.")
                .hostname("127.0.0.1")
                .port(8125)
                .build();
    }

}
