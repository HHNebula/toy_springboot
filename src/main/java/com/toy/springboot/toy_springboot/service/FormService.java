package com.toy.springboot.toy_springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toy.springboot.toy_springboot.dao.FormDao;

@Service
public class FormService {

    @Autowired
    FormDao formDao;

    public Object loginAttempt(Object dataMap) {
        String sqlMapId = "Form.loginAttempt";
        Object result = formDao.getMuid(sqlMapId, dataMap);
        return result;
    }

    public Object getCarList() {
        String sqlMapId = "Form.getCarList";
        Object result = formDao.getCarList(sqlMapId);
        return result;
    }

    public Object getCarInfo(Object dataMap) {
        String sqlMapId = "Form.getCarInfo";
        Object result = formDao.getCarInfo(sqlMapId, dataMap);
        return result;
    }

    public Object updateUserInfo(Object dataMap) {
        String sqlMapId = "Form.updateUserInfo";
        Object result = formDao.updateUserInfo(sqlMapId, dataMap);
        return result;
    }

    public Object dropUser(Object dataMap) {
        String sqlMapId = "Form.dropUser";
        Object result = formDao.dropUser(sqlMapId, dataMap);
        return result;
    }

    public Object insertUser(Object dataMap) {
        String sqlMapId = "Form.insertUser";
        Object result = formDao.insertUser(sqlMapId, dataMap);
        return result;
    }

    public Object getQuestionList() {
        String sqlMapId = "Form.getQuestionList";
        Object result = formDao.getQuestionList(sqlMapId);
        return result;
    }

    public Object getAnswerList() {
        String sqlMapId = "Form.getAnswerList";
        Object result = formDao.getAnswerList(sqlMapId);
        return result;
    }

    public Object insertSurvey(Object dataMap) {
        String sqlMapId = "Form.insertSurvey";
        Object result = formDao.insertSurvey(sqlMapId, dataMap);
        return result;
    }

}
