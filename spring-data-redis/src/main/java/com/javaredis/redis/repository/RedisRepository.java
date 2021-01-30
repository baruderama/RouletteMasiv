package com.javaredis.redis.repository;

import com.javaredis.redis.domain.Roulette;
import java.util.Map;

public interface RedisRepository {
    Map<String, Roulette> findAll();
    Roulette findById(String id);
    void save(Roulette roulette);
    void delete(String id);
    void updateItem(Roulette r);
}
