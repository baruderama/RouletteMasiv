package com.javaredis.redis.controller;

import com.javaredis.redis.domain.Roulette;
import com.javaredis.redis.repository.RouletteRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
public class RouletteController {
    private RouletteRepository rouletteRepository;
    public RouletteController (RouletteRepository rouletteRepository){
        this.rouletteRepository=rouletteRepository;
    }
    @GetMapping("/roulettes")
    public Map<String, Roulette> findAll(){
        return rouletteRepository.findAll();
    }
    @GetMapping("/roulettes/{id}")
    public Roulette findById(@PathVariable String id){
        return rouletteRepository.findById(id);
    }
    @PostMapping(value = "/roulettes")
    @ResponseBody
    public ResponseEntity<Roulette> createRoulette(@RequestBody Roulette roulette){
        rouletteRepository.save(roulette);

        return new ResponseEntity<Roulette>(roulette, HttpStatus.OK);
    }
    @PutMapping("/updateRoulette")
    @ResponseBody
    public  ResponseEntity<Roulette> updateItem(@RequestBody Roulette t){
        rouletteRepository.updateItem(t);

        return new ResponseEntity<Roulette>(t, HttpStatus.OK);
    }
    @DeleteMapping("/roulettes/{id}")
    public void deleteRoulette(@PathVariable String id){
        rouletteRepository.delete(id);
    }

}
