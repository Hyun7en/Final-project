package com.psvm.sse.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.psvm.sse.service.NotificationService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping(value = "notifications/")
@RequiredArgsConstructor
public class NotificationController {
    private final NotificationService notificationService;

    @GetMapping(value = "subscribe.pr/{userNo}", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public SseEmitter subscribe(@PathVariable Long userNo) {

        return notificationService.subscribe(userNo);
    }

    @PostMapping(value = "send-data.pr/{userNo}" ,produces = "application/json; charset=UTF-8")
    public void sendData(@PathVariable Long userNo, @RequestParam("sellerUrl") String url) {
        notificationService.notify(userNo, url);
    }
    
    
}