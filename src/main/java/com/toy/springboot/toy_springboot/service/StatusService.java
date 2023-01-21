package com.toy.springboot.toy_springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toy.springboot.toy_springboot.dao.StatusDao;

@Service
public class StatusService {

    @Autowired
    StatusDao statusDao;

    public Object getInterestList() {
        String sqlMapId = "Status.getInterestList";
        Object result = statusDao.getInterestList(sqlMapId);
        return result;
    }

    public Object getSatisfactionList(Object dataMap) {
        String sqlMapId = "Status.getSatisfactionList";
        Object result = statusDao.getSatisfactionList(sqlMapId, dataMap);
        return result;
    }

    public Object getAnswerList() {
        String sqlMapId = "Status.getAnswerList";
        Object result = statusDao.getAnswerList(sqlMapId);
        return result;
    }

}
