package com.javaredis.redis.domain;

import java.io.Serializable;
import java.util.List;

public class Roulette implements Serializable {
    private String id;
    private String state;
    private List<String> bets;
    public String getState(){
        return state;
    }
    public void setState(String state){
         this.state=state;
    }
    public List<String> getBets(){
        return bets;
    }
    public void setBets(List<String> bets){
        this.bets=bets;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
}
