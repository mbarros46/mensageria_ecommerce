package com.exemplo.controller;

import com.exemplo.model.OrderCreatedMessage;
import com.exemplo.service.OrderPublisher;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/orders")
public class OrderController {

    private final OrderPublisher orderPublisher;

    public OrderController(OrderPublisher orderPublisher) {
        this.orderPublisher = orderPublisher;
    }

    @PostMapping
    public ResponseEntity<String> createOrder(@RequestBody OrderCreatedMessage message) {
        orderPublisher.publishOrderCreated(message);
        return ResponseEntity.ok("Order message published: " + message.orderId());
    }
}
