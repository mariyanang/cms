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
import sun.org.mozilla.javascript.internal.json.JsonParser;

import java.util.Date;
import java.util.HashMap;
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
        model.addAttribute("article", articleRepository.findAll().get(0));
        return "articles";
    }

    @RequestMapping(value = PATH_ARTICLES + "/add", method = RequestMethod.GET)
    public String addArticle(ModelMap model) {
        model.addAttribute(new Article());
        setArticleSizes(model);
        return "add";
    }

    @RequestMapping(value = PATH_ARTICLES + "/add", method = RequestMethod.POST)
    public String addArticleSubmit(@ModelAttribute("article") Article article, BindingResult result) {
        //TODO date is hardcoded fix it
        article.setDate(new Date());
        articleRepository.save(article);

        return "redirect:/";
    }

    @RequestMapping(PATH_ARTICLES + "/delete/{articleId}")
    public String deleteArticle(@PathVariable("articleId") Long articleId) {
        articleRepository.delete(articleRepository.findOne(articleId));
        return "redirect:/";
    }

    @RequestMapping(PATH_ARTICLES + "/edit/{articleId}")
    public String editArticle(@PathVariable("articleId") Long articleId, ModelMap model) {
        model.addAttribute(articleRepository.findOne(articleId));
        setArticleSizes(model);
        return "add";
    }

    @RequestMapping(value = PATH_ARTICLES + "/edit/{articleId}", method = RequestMethod.POST)
    public String editArticleSubmit(@PathVariable("articleId") Long articleId, @ModelAttribute("article") Article article, BindingResult result) {
        article.setId(articleId);
//        article.setType("small");
        //TODO date is hardcoded fix it
        article.setDate(new Date());
        articleRepository.save(article);

        return "redirect:/";
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
    //----------------------------------------------------------------------------
//    @PUT
//    @Path("{id}")
//    public Response updateAd(@PathParam(ID) String s, ApiAd apiAd,
//                             @DefaultValue(TRUE) @QueryParam(_BODY) String body,
//                             @DefaultValue("") @QueryParam(INCLUDE_FIELDS) String includeFields,
//                             @DefaultValue("") @QueryParam(EXCLUDE_FIELDS) String excludeFields) throws URISyntaxException, IOException {
//        TimerContext time = updateAdTimer.time();
//        try {
//            MpUserDetails userDetails = checkAuthorization.getLoggedInUserAndCheckPrivileges(
//                    PRIV_CAS_SELLSIDE_API_PUT_AD);
//            requestStatistics.incrementNumberOfPutAdInvocation();
//
//            // check id
//            checkInput.isLong(s, ID);
//            long id = Long.parseLong(s);
//            checkInput.isGreaterZero(id, ID);
//            checkInput.isNotNull(apiAd.id, ID);
//            checkInput.isEqual(id, apiAd.id, ID);
//            checkInput.isNotNull(apiAd.categoryId, CATEGORY_ID);
//
//            // check apiAd
//            apiAd.trimInput();
//            AdChecker checkAd = new AdChecker(AGGREGATE, adCheckerConfig, categoryTree, userDetails);
//            checkAd.isValidExistingAd(apiAd);
//
//            // check status
//            checkInput.isEnumValue(apiAd.status, ApiAdStatus.class, STATUS);
//            ApiAdStatus apiAdStatus = ApiAdStatus.valueOf(apiAd.status);
//
//            // check if this ad belongs to the current user
//            CasAd casAd = adPersister.fetch(id, userDetails.getUserId());
//
//            //check if category hasn't changed        `
//            checkInput.isNotCategoryChange(apiAd.categoryId, casAd.getCategoryId());
//
//            // check state transition
//            checkStateTransition(casAd.status, apiAdStatus.getAdStatus(), true);
//
//            // don't proceed if there are errors
//            checkAd.throwIfErrors();
//
//            CasAd updatedAd = adPersister.update(casAdBuilder.buildFrom(apiAd, userDetails.getUserId()));
//
//            // TODO: We should cover this in the update call
//            if (!updatedAd.status.equals(apiAdStatus.getAdStatus())) {
//                adPersister.changeStatus(updatedAd.getId(), updatedAd.getUserId(), apiAdStatus.getAdStatus());
//                updatedAd = adPersister.fetch(updatedAd.getId(), updatedAd.getUserId());
//            }
//
//            // return url to ad
//            Response.ResponseBuilder r = Response.ok();
//            if (includeBody(body)) {
//                FieldFilter filter = new FieldFilter(includeFields, excludeFields);
//                ApiAd response = apiAdBuilder.buildFrom(updatedAd, filter);
//                r.entity(toJson(response, filter));
//            }
//            return r.build();
//
//        } finally {
//            time.stop();
//        }
//    }
}
