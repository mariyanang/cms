package net.mariyana.cms.controller;

import net.mariyana.cms.model.User;
import net.mariyana.cms.repo.UserRepository;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        String result = AjaxResponseCode.ERROR;

        //TODO server-side validation
        if (userRepository.getByEmail(user.getEmail()) == null) {
            userRepository.save(user);
            result = AjaxResponseCode.OK;
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put(AjaxResponseCode.FIELD_RESPONSE_CODE, result);
        return jsonObject.toString();
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public void login(@ModelAttribute User userFromRequest, HttpServletResponse response) throws JSONException, IOException {
        String result = AjaxResponseCode.OK;

        User user = userRepository.getByEmail(userFromRequest.getEmail());
        if (user == null ||
                !user.getPassword().equals(userFromRequest.getPassword())) {
            result = AjaxResponseCode.ERROR;
        }

        Cookie userIdCookie = new Cookie("USER_ID", user.getId() + "");
        userIdCookie.setPath("/");
        userIdCookie.setMaxAge(60 * 1000);
        response.addCookie(userIdCookie);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put(AjaxResponseCode.FIELD_RESPONSE_CODE, result);

        response.getWriter().println(jsonObject);
        response.getWriter().flush();
        response.getWriter().close();
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logOut(HttpServletResponse response) {
        Cookie userIdCookie = new Cookie("USER_ID", "");
        userIdCookie.setPath("/");
        userIdCookie.setMaxAge(-1);
        response.addCookie(userIdCookie);
        return "redirect:/articles";
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
