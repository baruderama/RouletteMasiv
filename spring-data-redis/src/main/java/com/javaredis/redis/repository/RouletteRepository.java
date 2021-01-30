package com.javaredis.redis.repository;
import com.javaredis.redis.domain.Roulette;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Repository;
import javax.annotation.PostConstruct;
import java.util.Map;
@Repository
public class RouletteRepository implements RedisRepository {
    private static final String KEY="Roulette";
    private RedisTemplate<String,Roulette> redisTemplate;
    private HashOperations hashOperations;
    public RouletteRepository(RedisTemplate<String, Roulette> redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
    @PostConstruct
    private void init(){
        hashOperations=redisTemplate.opsForHash();
    }
    @Override
    public Map<String, Roulette> findAll() {
        return hashOperations.entries(KEY);
    }
    @Override
    public Roulette findById(String id) {
        return (Roulette) hashOperations.get(KEY,id);
    }
    @Override
    public void save(Roulette roulette) {
        hashOperations.put(KEY, roulette.getId(),roulette);
    }
    @Override
    public void updateItem(Roulette r){
        save(r);
    }
    @Override
    public void delete(String id) {
        hashOperations.delete(KEY,id);
    }
}
