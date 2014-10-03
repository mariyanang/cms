package net.mariyana.cms.controller;

import net.mariyana.cms.model.User;
import net.mariyana.cms.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    public static final String PATH_USERS = "/users";

    @Autowired
    private UserRepository userRepository;

    @ModelAttribute("user")
    public User createModel() {
        return new User();
    }

    @RequestMapping(value = PATH_USERS, method = RequestMethod.POST)
    @ResponseBody
    public String addUser(@ModelAttribute("user") User user, BindingResult result) {
        userRepository.save(user);
        return "Success!";
    }

    @RequestMapping(value = PATH_USERS, method = RequestMethod.GET)
    public String listUsers(ModelMap model) {
        model.addAttribute("users", userRepository.findAll());
        return "users";
    }

    @RequestMapping(PATH_USERS + "/delete/{userId}")
    public String deleteArticle(@PathVariable("userId") Long userId) {
        userRepository.delete(userRepository.findOne(userId));
        return "redirect:" + PATH_USERS;
    }

}
