package net.mariyana.cms.controller;

import net.mariyana.cms.model.User;
import net.mariyana.cms.repo.UserRepository;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {
    public static final String PATH_USERS = "/users";

    @Autowired
    private UserRepository userRepository;

    @ModelAttribute("user")
    public User createModel() {
        return new User();
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    @ResponseBody
    public String signup(@RequestParam String name, @RequestParam String email, @RequestParam String password) throws JSONException {
        String result = "not ok";
        JSONObject jsonObject = new JSONObject();
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        List<User> users = userRepository.findAll();
        for (User currentUser : users) {
            if (currentUser.getEmail().equals(user.getEmail())) {
                jsonObject.put("result", "" + result);
                return "" + jsonObject;
            }
        }
        userRepository.save(user);
        result = "ok";
        jsonObject.put("result", "" + result);
        return "" + jsonObject;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@RequestParam String email, @RequestParam String password) throws JSONException {
        JSONObject jsonObject = new JSONObject();
        String result = "not ok";
        List<User> users = userRepository.findAll();
        for (User currentUser : users) {
            if (currentUser.getEmail().equals(email) &&
                    currentUser.getPassword().equals(password)) {
                result = "ok";
                break;
            }
        }
        jsonObject.put("result", "" + result);
        return "" + jsonObject;
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
