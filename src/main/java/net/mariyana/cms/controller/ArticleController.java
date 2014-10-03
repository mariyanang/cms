package net.mariyana.cms.controller;

import net.mariyana.cms.model.Article;
import net.mariyana.cms.repo.ArticleRepository;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

@Controller
public class ArticleController {

    public static final String PATH_ARTICLES = "/articles";

    @Autowired
    private ArticleRepository articleRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String redirectFromHome() {
        return "redirect:" + PATH_ARTICLES;
    }

    @RequestMapping(value = PATH_ARTICLES, method = RequestMethod.GET)
    public String listArticles(ModelMap model) {
        model.addAttribute("articles", articleRepository.findAll());
        return "articles";
    }

    @RequestMapping(value = PATH_ARTICLES + "/add", method = RequestMethod.POST)
    @ResponseBody
    public String addArticleSubmit(@ModelAttribute("article") Article article, BindingResult result) throws JSONException {
        article.setDate(new Date());
        articleRepository.save(article);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", "" + article.getId());
        jsonObject.put("date", "" + article.getDate());
        return "" + jsonObject;
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
        jsonObject.put("id", "" + article.getId());
        jsonObject.put("date", "" + article.getDate());
        return "" + jsonObject;
    }

    @RequestMapping(value = PATH_ARTICLES + "/get/{articleId}", method = RequestMethod.GET)
    @ResponseBody
    public String getArticle(@PathVariable("articleId") Long articleId) throws JSONException {
        Article requestedArticle = articleRepository.findOne(articleId);
        if (requestedArticle != null) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("id", "" + requestedArticle.getId());
            jsonObject.put("title", "" + requestedArticle.getTitle());
            jsonObject.put("author", "" + requestedArticle.getAuthor());
            jsonObject.put("date", "" + requestedArticle.getDate());
            jsonObject.put("content", "" + requestedArticle.getContent());
            jsonObject.put("type", "" + requestedArticle.getType());
            return "" + jsonObject;
        } else {
            return "This article does not exist";
        }
    }


    //----------------------------------------------------------------------------

    private void setArticleSizes(ModelMap model) {
        Map<String, String> articleSizes = new TreeMap<String, String>();
        articleSizes.put("small", "Small");
        articleSizes.put("medium", "Medium");
        articleSizes.put("large", "Large");
        model.addAttribute("articleSizes", articleSizes);
    }

}
