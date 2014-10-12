package net.mariyana.cms.controller;

import net.mariyana.cms.model.User;
import net.mariyana.cms.repo.UserRepository;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    @ResponseBody
    public String signup(@ModelAttribute User user) throws JSONException {
        String result = ResponseCode.ERROR;

        //TODO server-side validation
        if (userRepository.getByEmail(user.getEmail()) == null) {
            userRepository.save(user);
            result = ResponseCode.OK;
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("result", "" + result);
        return "" + jsonObject;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(@ModelAttribute User userFromRequest) throws JSONException {
        String result = ResponseCode.OK;

        User user = userRepository.getByEmail(userFromRequest.getEmail());
        if (user == null ||
                !user.getPassword().equals(userFromRequest.getPassword())) {
            result = ResponseCode.ERROR;
        }
        JSONObject jsonObject = new JSONObject();
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
