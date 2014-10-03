<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
<body>
<nav class="navbar">
    <div class="nav-row" id="about">
        <p>Hi, User</p>

        <p>Share something stunning about you</p>
    </div>
    <div class="nav-row" id="login">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <a class="form-link" id="login-link"
                       data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                        Log in
                    </a>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <div class="panel-body">
                        <input class="form-control form-control-focus" id="login-user-mail" type="email"
                               placeholder="Your email"
                               name="user-email" autofocus="true"/>
                        <input class="form-control form-control-focus" id="login-user-pass" type="password"
                               placeholder="Password"
                               name="user-password"/>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                        <a class="form-link" id="signup-link" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo">
                            Sign Up
                        </a>
                </div>
                <div id="collapseTwo" class="panel-collapse collapse">
                    <div class="panel-body">
                        <input class="form-control form-control-focus" id="signup-user-name" type="email"
                               placeholder="Your email"
                               name="user-email" autofocus="true"/>
                        <input class="form-control form-control-focus" id="signup-user-mail" type="email"
                               placeholder="Your email"
                               name="user-email" autofocus="true"/>
                        <input class="form-control form-control-focus" id="signup-user-pass" type="password"
                               placeholder="Password"
                               name="user-password"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="nav-row" id="footer">
        <h3>The content management system</h3>
        <h5>Creative Commons 2014</h5>
    </footer>
</nav>
<script>
    var currentArticleId;
    function setArticleId(articleId) {
        currentArticleId = articleId;
    }
    function createNewArticle() {
        $('#myModal').modal('toggle');
        $('#modalTitle').val("");
        $('#modalAuthor').val("");
        $('#modalContent').val("");
        $('#modalType').val("small");
        setArticleId(-1);
    }
    function ajaxGetArticle(articleId) {
        $.getJSON("<%= request.getContextPath() %>/articles/get/" + articleId, function (data) {
            $('#modalTitle').val(data["title"]);
            $('#modalAuthor').val(data["author"]);
            $('#modalDate').text(data["date"]);
            $('#modalContent').val(data["content"]);
            $('#modalType').val(data["type"]);
        })
        setArticleId(articleId);
    }
    function ajaxPostArticle() {
        var title = $('#modalTitle').val();
        var author = $('#modalAuthor').val();
        var content = $('#modalContent').val();
        var type = $('#modalType').val();
        if (currentArticleId == -1) {
            $.ajax({
                type: "POST",
                url: "<%= request.getContextPath() %>/articles/add",
                data: "title=" + title + "&author=" + author + "&content=" + content + "&type=" + type,
                dataType: "json",
                success: function (data) {
                    setArticleId(data["id"]);
                    var newArticleHtml = '<div id="articleTypeDiv-' + currentArticleId + '" class="post-' + type + '" data-toggle="modal" data-target="#myModal" onclick="ajaxGetArticle(' + currentArticleId + ')">\
                            <div class="article"> \
                            <h1 id="articleTitle-' + currentArticleId + '">' + title + '</h1>\
                    <h5 id="articleAuthor-' + currentArticleId + '">By ' + author + ' published on ' + data["date"] + '</h5>\
                    <p id="articleContent-' + currentArticleId + '">' + content + '</p>\
                    </div>\
                    <div class="modal-footer">\
                            <a class="form-link" id="deleteArticle" href="/cms/articles/delete/' + currentArticleId + '">\
                            <button type="button" class="btn btn-primary">Delete</button>\
                            </a>\
                    </div>\
                    </div>';
                    $('#articlesContainer').append(newArticleHtml);
                    $('#myModal').modal('toggle');
                }
            });
        } else {
            $.ajax({
                type: "POST",
                url: "<%= request.getContextPath() %>/articles/edit/" + currentArticleId,
                data: "title=" + title + "&author=" + author + "&content=" + content + "&type=" + type,
                dataType: "json",
                success: function (data) {
                    $('#articleTitle-' + data["id"]).text(title);
                    $('#articleAuthor-' + data["id"]).text("By " + author + " published on " + data["date"]);
                    $('#articleContent-' + data["id"]).text(content);
                    $('#articleTypeDiv-' + data["id"]).removeClass("post-small")
                            .removeClass("post-medium")
                            .removeClass("post-large")
                            .addClass("post-" + type);
                    $('#myModal').modal('toggle');
                }
            });
        }
    }
</script>
<div class="container-fluid">
    <a class="form-link" id="addArticle" onclick="createNewArticle()"><h1>+ Add article</h1></a>

    <div id="articlesContainer" class="row">
        <c:forEach items="${articles}" var="article">
            <c:set var="articleType" value="post-medium"></c:set>
            <c:if test="${article.type == 'small'}">
                <c:set var="articleType" value="post-small"></c:set>
            </c:if>
            <c:if test="${article.type == 'large'}">
                <c:set var="articleType" value="post-large"></c:set>
            </c:if>
            <!-- div triggering modal -->
            <div id="articleTypeDiv-${article.id}" class="${articleType}" data-toggle="modal" data-target="#myModal"
                 onclick="ajaxGetArticle(${article.id})">
                    <%--<div currentArticleId="img-holder" style="background-image: url('{{item.img}}');"></div>--%>
                <div class="article">
                    <br/>

                    <h1 id="articleTitle-${article.id}">${article.title}</h1>
                    <br/>
                    <h5 id="articleAuthor-${article.id}">By ${article.author} published on ${article.date}</h5>
                    <br/>

                    <p id="articleContent-${article.id}">${article.content}</p>
                    <br/>
                </div>
                <div class="modal-footer">
                    <a class="form-link" id="deleteArticle"
                       href="<%= request.getContextPath() %>/articles/delete/${article.id}">
                        <button type="button" class="btn btn-primary">Delete</button>
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
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
                    <h1 class="modal-title"><input type="text" id="modalTitle"
                                                   class="form-control form-control-focus"/></h1>
                    <h5 class="modal-title">By <input path="author" id="modalAuthor"
                                                      class="form-control form-control-focus"/> published on
                        <span id="modalDate"></span></h5>
                </div>
                <div class="modal-body">
                    <textarea type="text" id="modalContent" class="form-control form-control-focus"></textarea>
                </div>
                <div class="modal-footer">
                    <select class="btn btn-default" id="modalType">
                        <option value="small">Small</option>
                        <option value="medium">Medium</option>
                        <option value="large">Large</option>
                    </select>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary"
                            onclick="ajaxPostArticle()">Save changes
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>