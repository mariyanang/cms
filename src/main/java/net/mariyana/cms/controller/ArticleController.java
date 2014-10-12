package net.mariyana.cms.controller;

import net.mariyana.cms.model.Article;
import net.mariyana.cms.model.User;
import net.mariyana.cms.repo.ArticleRepository;
import net.mariyana.cms.repo.UserRepository;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

@Controller
public class ArticleController {

    public static final String PATH_ARTICLES = "/articles";

    @Autowired
    private ArticleRepository articleRepository;
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String redirectFromHome() {
        return "redirect:" + PATH_ARTICLES;
    }

    @RequestMapping(value = PATH_ARTICLES, method = RequestMethod.GET)
    public String listArticles(ModelMap model, HttpServletRequest request) {

        User user = getValidLoggedInUser(request);
        if (user == null) {
            model.addAttribute("articles", articleRepository.findAll());
        } else {
            model.addAttribute("articles", articleRepository.getAllByUserId(user.getId()));
            model.addAttribute("user", user);
        }

        return "articles";

    }

    @RequestMapping(value = PATH_ARTICLES + "/add", method = RequestMethod.POST)
    @ResponseBody
    public String addArticleSubmit(@ModelAttribute("article") Article article, BindingResult result, HttpServletRequest request) throws JSONException {
        JSONObject jsonObject = new JSONObject();

        if (getValidLoggedInUser(request) == null) {
            jsonObject.put(AjaxResponseCode.FIELD_RESPONSE_CODE, AjaxResponseCode.ERROR);
            return jsonObject.toString();
        }
        article.setUser(getValidLoggedInUser(request));
        article.setDate(new Date());
        articleRepository.save(article);

        jsonObject.put("id", article.getId());
        jsonObject.put("date", article.getDate());
        jsonObject.put("userName", article.getUser().getName());
        return jsonObject.toString();
    }

    @RequestMapping(PATH_ARTICLES + "/delete/{articleId}")
    public String deleteArticle(@PathVariable("articleId") Long articleId) {
        articleRepository.delete(articleRepository.findOne(articleId));
        return "redirect:/";
    }

    @RequestMapping(value = PATH_ARTICLES + "/edit/{articleId}", method = RequestMethod.POST)
    @ResponseBody
    public String editArticleSubmit(@PathVariable("articleId") Long articleId, @ModelAttribute("article") Article article, BindingResult result) throws JSONException {
        article.setId(articleId);
        article.setDate(new Date());
        articleRepository.save(article);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", article.getId());
        jsonObject.put("date", article.getDate());
        return jsonObject.toString();
    }

    @RequestMapping(value = PATH_ARTICLES + "/get/{articleId}", method = RequestMethod.GET)
    @ResponseBody
    public String getArticle(@PathVariable("articleId") Long articleId, HttpServletRequest request) throws JSONException {
        Article requestedArticle = articleRepository.findOne(articleId);
        if (requestedArticle != null) {
            return new JSONObject(requestedArticle).toString();
        }
        return "This article does not exist";
    }

    //----------------------------------------------------------------------------

    private User getValidLoggedInUser(HttpServletRequest request) {
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("USER_ID") && !cookie.getValue().equals("")) {
                return userRepository.findOne(Long.parseLong(cookie.getValue()));
            }
        }
        return null;
    }

    private void setArticleSizes(ModelMap model) {
        Map<String, String> articleSizes = new TreeMap<String, String>();
        articleSizes.put("small", "Small");
        articleSizes.put("medium", "Medium");
        articleSizes.put("large", "Large");
        model.addAttribute("articleSizes", articleSizes);
    }

}
