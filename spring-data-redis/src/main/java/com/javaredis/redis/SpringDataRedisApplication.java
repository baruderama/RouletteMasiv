package com.javaredis.redis;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;



@SpringBootApplication
@RestController
@RequestMapping("/roulette")
public class SpringDataRedisApplication {
    public static void main(String[] args) {
        SpringApplication.run(SpringDataRedisApplication.class, args);
    }
}