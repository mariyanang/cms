<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" ng-app="cmsApp"> <![endif]-->
<!--[if IE 7]> <html class="no-js lt-ie9 lt-ie8" ng-app="cmsApp"> <![endif]-->
<!--[if IE 8]> <html class="no-js lt-ie9" ng-app="cmsApp"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <title>Cms articles</title>

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="//fonts.googleapis.com/css?family=Roboto+Slab:100,300,400,700" rel="stylesheet" type="text/css"/>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:300italic,300,400italic,400,600italic,600,700italic,700,800italic,800"
          rel="stylesheet" type="text/css">

    <link rel="stylesheet"
          href="http://mariyana.net/browser-normalisation.css"/>
    <link rel="stylesheet" href="http://mariyana.net/cms/css/main.css">

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="http://mariyana.net/cms/js/bootstrap.min.js"></script>
</head>
<%--<body>--%>
<%--<!--[if lt IE 7]>--%>
<%--<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade--%>
<%--your browser</a> to improve your experience.</p>--%>
<%--<![endif]-->--%>

<%--<!-- Add your site or application content here -->--%>
<%--<nav class="navbar">--%>
<%--<div class="nav-row" currentArticleId="about">--%>
<%--<p>Hi, User</p>--%>

<%--<p>Share something stunning about you</p>--%>
<%--</div>--%>
<%--<div class="nav-row" currentArticleId="login">--%>
<%--<ul currentArticleId="master-drop">--%>
<%--<li><a class="form-link" currentArticleId="signIn-link" href="#user">Sign In</a></li>--%>
<%--<li><a class="form-link" currentArticleId="signUp-link" href="#new-user">Sign Up</a></li>--%>
<%--<li><a class="form-link" currentArticleId="addArticle" href="<%= request.getContextPath() %>/articles/add">Add article</a>--%>
<%--</li>--%>
<%--</ul>--%>
<%--<input class="form-control form-control-focus" currentArticleId="user-mail" type="email" placeholder="Your email"--%>
<%--name="user-email" autofocus="true"/>--%>
<%--<input class="form-control form-control-focus" currentArticleId="user-pass" type="password" placeholder="Password"--%>
<%--name="user-password"/>--%>
<%--</div>--%>
<%--<footer class="nav-row" currentArticleId="footer">--%>
<%--<h3>The content management system</h3>--%>
<%--<h5>Creative Commons 2014</h5>--%>
<%--</footer>--%>
<%--</nav>--%>
<%--<div class="container-fluid">--%>
<%--<div class="row">--%>

<%--<c:forEach items="${articles}" var="article">--%>

<%--<c:set var="articleType" value="post-medium"></c:set>--%>
<%--<c:if test="${article.type == 'small'}">--%>
<%--<c:set var="articleType" value="post-small"></c:set>--%>
<%--</c:if>--%>
<%--<c:if test="${article.type == 'large'}">--%>
<%--<c:set var="articleType" value="post-large"></c:set>--%>
<%--</c:if>--%>
<%--<!-- div trigger modal -->--%>
<%--<div class="${articleType}" data-toggle="modal" data-target="#modal-${article.currentArticleId}">--%>
<%--&lt;%&ndash;<div currentArticleId="img-holder" style="background-image: url('{{item.img}}');"></div>&ndash;%&gt;--%>
<%--<div class="article">--%>
<%--<h1 currentArticleId="articleTitle">${article.title}</h1>--%>
<%--<h5 currentArticleId="articleSubtitle">By ${article.author} published on TODO date</h5>--%>

<%--<p currentArticleId="articleContent">${article.content}</p>--%>
<%--</div>--%>
<%--<div class="edit-buttons">--%>
<%--<a class="form-link" currentArticleId="editArticle"--%>
<%--href="<%= request.getContextPath() %>/articles/edit/${article.currentArticleId}">Edit</a>--%>
<%--<a class="form-link" currentArticleId="deleteArticle"--%>
<%--href="<%= request.getContextPath() %>/articles/delete/${article.currentArticleId}">Delete</a>--%>
<%--</div>--%>
<%--</div>--%>

<%--<form:form method="post" action="${formActionUrl}" modelAttribute="article">--%>
<%--<!-- Modal -->--%>
<%--<div class="modal fade" currentArticleId="modal-${article.currentArticleId}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"--%>
<%--aria-hidden="true">--%>
<%--<div class="modal-dialog">--%>
<%--<div class="modal-content">--%>
<%--<div class="modal-header">--%>
<%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span--%>
<%--class="sr-only">Close</span></button>--%>
<%--<h1 class="modal-title" currentArticleId="myModalLabel">${article.title}</h1>--%>
<%--<h5 class="modal-title">By ${article.author} published on TODO date</h5>--%>
<%--</div>--%>
<%--<div class="modal-body">--%>
<%--<p>${article.content}</p>--%>
<%--</div>--%>
<%--<div class="modal-footer">--%>
<%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
<%--&lt;%&ndash;<button type="button" class="btn btn-primary">Save changes</button>&ndash;%&gt;--%>
<%--<input type="submit" value="Save changes" class="btn btn-primary"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</form:form>--%>
<%--</c:forEach>--%>
<%--</body>--%>

<!-- CASE 3 FROM HTML CASE 3 FROM HTML CASE 3 FROM HTML CASE 3 FROM HTML CASE 3 FROM HTML-->

<%--<body>--%>
<%--<!--[if lt IE 7]>--%>
<%--<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade--%>
<%--your browser</a> to improve your experience.</p>--%>
<%--<![endif]-->--%>

<%--<!-- Add your site or application content here -->--%>
<%--<nav class="navbar">--%>
<%--<div class="nav-row" currentArticleId="about">--%>
<%--<p>Hi, User</p>--%>

<%--<p>Share something stunning about you</p>--%>
<%--</div>--%>
<%--<div class="nav-row" currentArticleId="login">--%>
<%--<ul currentArticleId="master-drop">--%>
<%--<li><a class="form-link" currentArticleId="signIn-link" href="#user">Sign In</a></li>--%>
<%--<li><a class="form-link" currentArticleId="signUp-link" href="#new-user">Sign Up</a></li>--%>
<%--<li><a class="form-link" currentArticleId="addArticle" href="<%= request.getContextPath() %>/articles/add">Add article</a>--%>
<%--</li>--%>
<%--</ul>--%>
<%--<input class="form-control form-control-focus" currentArticleId="user-mail" type="email" placeholder="Your email"--%>
<%--name="user-email" autofocus="true"/>--%>
<%--<input class="form-control form-control-focus" currentArticleId="user-pass" type="password" placeholder="Password"--%>
<%--name="user-password"/>--%>
<%--</div>--%>
<%--<footer class="nav-row" currentArticleId="footer">--%>
<%--<h3>The content management system</h3>--%>
<%--<h5>Creative Commons 2014</h5>--%>
<%--</footer>--%>
<%--</nav>--%>
<%--<div class="container-fluid">--%>
<%--<div class="row">--%>

<%--<c:forEach items="${articles}" var="article">--%>

<%--<c:set var="articleType" value="post-medium"></c:set>--%>
<%--<c:if test="${article.type == 'small'}">--%>
<%--<c:set var="articleType" value="post-small"></c:set>--%>
<%--</c:if>--%>
<%--<c:if test="${article.type == 'large'}">--%>
<%--<c:set var="articleType" value="post-large"></c:set>--%>
<%--</c:if>--%>
<%--<!-- div trigger modal -->--%>
<%--<div class="${articleType}" data-toggle="modal" data-target="#myModal"--%>
<%--onclick="populate(${article.currentArticleId})">--%>
<%--<%--<div currentArticleId="img-holder" style="background-image: url('{{item.img}}');"></div>--%>
<%--<div class="article">--%>
<%--<h1 currentArticleId="articleTitle-${article.currentArticleId}">${article.title}</h1>--%>
<%--<h5 currentArticleId="articleSubtitle-${article.currentArticleId}">By ${article.author} published on TODO date</h5>--%>
<%--<p currentArticleId="articleContent-${article.currentArticleId}">${article.content}</p>--%>
<%--</div>--%>
<%--<div class="edit-buttons">--%>
<%--<a class="form-link" currentArticleId="editArticle"--%>
<%--href="<%= request.getContextPath() %>/articles/edit/${article.currentArticleId}">Edit</a>--%>
<%--<a class="form-link" currentArticleId="deleteArticle"--%>
<%--href="<%= request.getContextPath() %>/articles/delete/${article.currentArticleId}">Delete</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</c:forEach>--%>

<%--<script>--%>
<%--function populate(articleId) {--%>
<%--var title = document.getElementById("articleTitle-" + articleId).innerHTML;--%>
<%--document.getElementById("modalTitle").value = title;--%>
<%--var subtitle = document.getElementById("articleSubtitle-" + articleId).innerHTML;--%>
<%--document.getElementById("modalSubtitle").value = subtitle;--%>
<%--var content = document.getElementById("articleContent-" + articleId).innerHTML;--%>
<%--document.getElementById("modalContent").value = content;--%>
<%--}--%>
<%--</script>--%>

<%--<!-- Modal -->--%>
<%--<div class="modal fade" currentArticleId="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"--%>
<%--aria-hidden="true">--%>
<%--<div class="modal-dialog">--%>
<%--<div class="modal-content">--%>
<%--<div class="modal-header">--%>
<%--<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span--%>
<%--class="sr-only">Close</span></button>--%>
<%--<input currentArticleId="modalTitle"><h1 class="modal-title"></h1></input>--%>
<%--<input currentArticleId="modalSubtitle"><h5 class="modal-title"></h5></input>--%>
<%--</div>--%>
<%--<div class="modal-body">--%>
<%--<textarea currentArticleId="modalContent"><p></p></textarea>--%>
<%--</div>--%>
<%--<div class="modal-footer">--%>
<%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
<%--<button type="button" class="btn btn-primary">Save changes</button>--%>
<%--<%--<input type="submit" value="Done"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</body>--%>


<!-- CASE 4 FROM JAVASCRIPT CASE 4 FROM JAVASCRIPT CASE 4 FROM JAVASCRIPT CASE 4 FROM JAVASCRIPT CASE 4 FROM JAVASCRIPT-->
<%--<body>--%>
<%--<!--[if lt IE 7]>--%>
<%--<p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade--%>
<%--your browser</a> to improve your experience.</p>--%>
<%--<![endif]-->--%>

<%--<!-- Add your site or application content here -->--%>
<%--<nav class="navbar">--%>
<%--<div class="nav-row" currentArticleId="about">--%>
<%--<p>Hi, User</p>--%>

<%--<p>Share something stunning about you</p>--%>
<%--</div>--%>
<%--<div class="nav-row" currentArticleId="login">--%>
<%--<ul currentArticleId="master-drop">--%>
<%--<li><a class="form-link" currentArticleId="signIn-link" href="#user">Sign In</a></li>--%>
<%--<li><a class="form-link" currentArticleId="signUp-link" href="#new-user">Sign Up</a></li>--%>
<%--<li><a class="form-link" currentArticleId="addArticle" href="<%= request.getContextPath() %>/articles/add">Add article</a>--%>
<%--</li>--%>
<%--</ul>--%>
<%--<input class="form-control form-control-focus" currentArticleId="user-mail" type="email" placeholder="Your email"--%>
<%--name="user-email" autofocus="true"/>--%>
<%--<input class="form-control form-control-focus" currentArticleId="user-pass" type="password" placeholder="Password"--%>
<%--name="user-password"/>--%>
<%--</div>--%>
<%--<footer class="nav-row" currentArticleId="footer">--%>
<%--<h3>The content management system</h3>--%>
<%--<h5>Creative Commons 2014</h5>--%>
<%--</footer>--%>
<%--</nav>--%>
<%--<script>--%>
<%--var articleData = [];--%>
<%--<c:forEach items="${articles}" var="article">--%>
<%--articleData.push({currentArticleId: "${article.currentArticleId}", title: "${article.title}", author: "${article.author}", content: "${article.content}"});--%>
<%--</c:forEach>--%>

<%--function populate(articleId) {--%>
<%--for (var i = 0; i < articleData.length; i++) {--%>
<%--var currentArticle = articleData[i];--%>
<%--if (articleId == currentArticle["currentArticleId"]) {--%>
<%--document.getElementById("modalTitle").value = currentArticle["title"];--%>
<%--document.getElementById("modalSubtitle").value = currentArticle["author"];--%>
<%--document.getElementById("modalContent").value = currentArticle["content"];--%>
<%--document.getElementById("articleForm").action = "<%= request.getContextPath() %>/articles/edit/" + currentArticle["currentArticleId"];--%>
<%--}--%>
<%--}--%>
<%--}--%>


<%--</script>--%>
<%--<div class="container-fluid">--%>
<%--<div class="row">--%>
<%--<c:forEach items="${articles}" var="article">--%>

<%--<c:set var="articleType" value="post-medium"></c:set>--%>
<%--<c:if test="${article.type == 'small'}">--%>
<%--<c:set var="articleType" value="post-small"></c:set>--%>
<%--</c:if>--%>
<%--<c:if test="${article.type == 'large'}">--%>
<%--<c:set var="articleType" value="post-large"></c:set>--%>
<%--</c:if>--%>
<%--<!-- div trigger modal -->--%>
<%--<div class="${articleType}" data-toggle="modal" data-target="#myModal"--%>
<%--onclick="populate(${article.currentArticleId})">--%>
<%--<%--<div currentArticleId="img-holder" style="background-image: url('{{item.img}}');"></div>--%>
<%--<div class="article">--%>
<%--<h1 currentArticleId="articleTitle-${article.currentArticleId}">${article.title}</h1>--%>
<%--<h5 currentArticleId="articleSubtitle-${article.currentArticleId}">By ${article.author} published on TODO date</h5>--%>

<%--<p currentArticleId="articleContent-${article.currentArticleId}">${article.content}</p>--%>
<%--</div>--%>
<%--<div class="edit-buttons">--%>
<%--<a class="form-link" currentArticleId="editArticle"--%>
<%--href="<%= request.getContextPath() %>/articles/edit/${article.currentArticleId}">Edit</a>--%>
<%--<a class="form-link" currentArticleId="deleteArticle"--%>
<%--href="<%= request.getContextPath() %>/articles/delete/${article.currentArticleId}">Delete</a>--%>
<%--</div>--%>
<%--</div>--%>
<%--</c:forEach>--%>


<%--<!-- Modal -->--%>
<%--<form:form method="post" action="" modelAttribute="article" currentArticleId="articleForm">--%>
<%--<%--<form method="post" currentArticleId="articleForm">--%>
<%--<div class="modal fade" currentArticleId="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"--%>
<%--aria-hidden="true">--%>
<%--<div class="modal-dialog">--%>
<%--<div class="modal-content">--%>
<%--<div class="modal-header">--%>
<%--<button type="button" class="close" data-dismiss="modal"><span--%>
<%--aria-hidden="true">&times;</span><span--%>
<%--class="sr-only">Close</span></button>--%>
<%--<h1 class="modal-title"><input type=" text" currentArticleId="modalTitle"/></h1>--%>
<%--<%--<input input type="text" currentArticleId="modalSubtitle"/>--%>
<%--<h5 class="modal-title"><form:input path="author" currentArticleId="modalSubtitle"/></h5>--%>
<%--</div>--%>
<%--<div class="modal-body">--%>
<%--<p><textarea input type="text" currentArticleId="modalContent"></textarea></p>--%>
<%--</div>--%>
<%--<div class="modal-footer">--%>
<%--<select class="btn btn-default dropdown-toggle">--%>
<%--<option value="small">Small</option>--%>
<%--<option value="medium">Medium</option>--%>
<%--<option value="large">Large</option>--%>
<%--</select>--%>
<%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
<%--<input type="submit" value="Save changes" class="btn btn-primary"/>--%>
<%--<%--<input type="submit" value="Done"/>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--</div>--%>
<%--<%--</form>--%>
<%--</form:form>--%>
<%--</body>--%>


<!-- CASE 2 FROM AJAX CASE 2 FROM AJAX CASE 2 FROM AJAX CASE 2 FROM AJAX CASE 2 FROM AJAX-->
<body>
<!-- Add your site or application content here -->
<nav class="navbar">
    <div class="nav-row" id="about">
        <p>Hi, User</p>

        <p>Share something stunning about you</p>
    </div>
    <div class="nav-row" id="login">
        <ul id="master-drop">
            <li><a class="form-link" id="signIn-link" href="#user">Sign In</a></li>
            <li><a class="form-link" id="signUp-link" href="#new-user">Sign Up</a></li>
            <li><a class="form-link" id="addArticle" href="<%= request.getContextPath() %>/articles/add">Add article</a>
            </li>
        </ul>
        <input class="form-control form-control-focus" id="user-mail" type="email" placeholder="Your email"
               name="user-email" autofocus="true"/>
        <input class="form-control form-control-focus" id="user-pass" type="password" placeholder="Password"
               name="user-password"/>
    </div>
    <footer class="nav-row" id="footer">
        <h3>The content management system</h3>
        <h5>Creative Commons 2014</h5>
    </footer>
</nav>
<script>
    <%--////it works don't delete
                {"content":"askdbf ashgik  ksjdbf s kjsdf","currentArticleId":"21","author":"asdf","title":"asdf","size":"small"}--%>
    <%--function ajaxGet(articleId) {--%>
    <%--$.ajax({--%>
    <%--url: "<%= request.getContextPath() %>/articles/get/" + articleId,--%>
    <%--success: function (responseData) {--%>
    <%--var article = JSON.parse(responseData);--%>
    <%--$('#modalTitle').val(article.title);--%>
    <%--$('#modalAuthor').val(article.author);--%>
    <%--$('#modalContent').val(article.content);--%>
    <%--}--%>
    <%--});--%>
    <%--}--%>
    var currentArticleId;
    function refreshArticleId(articleId) {
        currentArticleId = articleId;
        return currentArticleId;
    }
    function ajaxGet(articleId) {
        $.getJSON("<%= request.getContextPath() %>/articles/get/" + articleId, function (data) {
            $('#modalTitle').val(data["title"]);
            $('#modalAuthor').val(data["author"]);
            $('#modalContent').val(data["content"]);
            $('#modalType').val(data["type"]);
        })
        refreshArticleId(articleId);
    }
    function ajaxPost() {
        var title = $('#modalTitle').val();
        var author = $('#modalAuthor').val();
        var content = $('#modalContent').val();
        var type = $('#modalType').val();
        $.ajax({
            type: "POST",
            url: "<%= request.getContextPath() %>/articles/edit/" + currentArticleId,
            data: "title=" + title + "&author=" + author + "&content=" + content + "&type=" + type,
            success: function () {
                $('#articleTitle-' + currentArticleId).text(title);
                $('#articleAuthor-' + currentArticleId).text(author);
                $('#articleContent-' + currentArticleId).text(content);
                $('#articleTypeDiv-' + currentArticleId).removeClass("post-small")
                        .removeClass("post-medium")
                        .removeClass("post-large")
                        .addClass("post-" + type);
                $('#myModal').modal('toggle');
            }
        });
    }
</script>
<div class="container-fluid">
    <div class="row">
        <c:forEach items="${articles}" var="article">

            <c:set var="articleType" value="post-medium"></c:set>
        <c:if test="${article.type == 'small'}">
            <c:set var="articleType" value="post-small"></c:set>
        </c:if>
        <c:if test="${article.type == 'large'}">
            <c:set var="articleType" value="post-large"></c:set>
        </c:if>
        <!-- div trigger modal -->
        <div id="articleTypeDiv-${article.id}" class="${articleType}" data-toggle="modal" data-target="#myModal"
             onclick="ajaxGet(${article.id})">
                <%--<div currentArticleId="img-holder" style="background-image: url('{{item.img}}');"></div>--%>
            <div class="article">
                <h1 id="articleTitle-${article.id}">${article.title}</h1>
                <h5 id="articleAuthor-${article.id}">By ${article.author} published on TODO date</h5>

                <p id="articleContent-${article.id}">${article.content}</p>
            </div>
            <div class="edit-buttons">
                <a class="form-link" id="editArticle"
                   href="<%= request.getContextPath() %>/articles/edit/${article.id}">Edit</a>
                <a class="form-link" id="deleteArticle"
                   href="<%= request.getContextPath() %>/articles/delete/${article.id}">Delete</a>
            </div>
        </div>
        </c:forEach>
        <!-- Modal -->
        <form method="post" id="articleForm">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                            <h1 class="modal-title"><input type="text" id="modalTitle"/></h1>
                            <h5 class="modal-title"><input path="author" id="modalAuthor"/></h5>
                        </div>
                        <div class="modal-body">
                            <p><textarea input type="text" id="modalContent"></textarea></p>
                        </div>
                        <div class="modal-footer">
                            <select class="btn btn-default dropdown-toggle" id="modalType">
                                <option value="small">Small</option>
                                <option value="medium">Medium</option>
                                <option value="large">Large</option>
                            </select>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <input type="button" value="Save changes" class="btn btn-primary" onclick="ajaxPost()"/>
                        </div>
                    </div>
                </div>
            </div>
        </form>
</body>

</html>
