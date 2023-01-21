package com.toy.springboot.toy_springboot.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class StatusDao {

    @Autowired
    private SqlSessionTemplate sqlSessionTemplate;

    public Object getInterestList(String sqlMapId) {
        Object result = sqlSessionTemplate.selectOne(sqlMapId);
        return result;
    }

    public Object getSatisfactionList(String sqlMapId, Object dataMap) {
        Object result = sqlSessionTemplate.selectList(sqlMapId, dataMap);
        return result;
    }

    public Object getAnswerList(String sqlMapId) {
        Object result = sqlSessionTemplate.selectList(sqlMapId);
        return result;
    }

}
