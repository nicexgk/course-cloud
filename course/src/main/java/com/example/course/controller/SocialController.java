package com.example.course.controller;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.WebSocketSession;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

//@ServerEndpoint(value = "/social/{cid}/{sid}")
@Component
public class SocialController {

    private static ConcurrentHashMap<Integer, ArrayList<Session>> webSocketSessionMap = new ConcurrentHashMap<>();


    @OnOpen
    public void onOpen(Session session, @RequestParam("cid") int cid, @RequestParam("sid")int sid) throws IOException {
        webSocketSessionMap.get(cid).add(session);
        System.out.println("nice nice nice");
        session.getBasicRemote().sendText("nice nice nice");
        System.out.println(cid + "  " + sid);
    }

    @OnMessage
    public void onMessage(String str, Session session){

    }

    @OnClose
    public void onClose(){

    }

    @OnError
    public void onError(){

    }




}
