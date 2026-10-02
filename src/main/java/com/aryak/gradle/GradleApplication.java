package com.aryak.gradle;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.nio.file.Path;

@EnableScheduling
@SpringBootApplication
public class GradleApplication {

    private static final String BUCKET_NAME = "aryak-b1";

    static void main(String[] args) {
        SpringApplication.run(GradleApplication.class, args);
    }

    //@Bean
    public CommandLineRunner commandLineRunner() {
        return args -> {

            try ( S3Client s3Client = S3Client.builder().region(Region.AP_SOUTH_1)
                    //.credentialsProvider(AwsCredentialsProvider)
                    .build() ) {

                // put the file
                PutObjectRequest putRequest = PutObjectRequest.builder()
                        .bucket(BUCKET_NAME)
                        .key("/public/hello.txt")
                        .build();
                s3Client.putObject(putRequest, Path.of("hello.txt"));

                // get the file
                GetObjectRequest getRequest = GetObjectRequest.builder()
                        .bucket(BUCKET_NAME)
                        .key("Functional.key")
                        .build();
                s3Client.getObject(getRequest, Path.of("here"));
            }

        };
    }
}
