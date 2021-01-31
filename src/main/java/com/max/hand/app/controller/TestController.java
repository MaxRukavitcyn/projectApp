package com.max.hand.app.controller;

import com.max.hand.app.dao.CarDao;
import com.max.hand.app.dao.UserDao;
import com.max.hand.app.model.Car;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class TestController {

    @Autowired
    private UserDao userDao;

    @Autowired
    private CarDao carDao;

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test(Model model) {
        model.addAttribute("tableName", "Машины");
        List<Car> cars = carDao.findAll();
        model.addAttribute("cars", cars.stream().map(c -> {
            StringBuilder st = new StringBuilder();
            st.append("{\"id\":").append("\"" + c.getId() + "\",").append(" \"model\":").append("\"" + c.getModel() + "\"}");
            return st.toString();
        }).collect(Collectors.toList()));
        return "test";
    }
}
