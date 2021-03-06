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
    <%--<script src="http://mariyana.net/cms/js/main.js"></script>--%>
</head>
<body>
<nav class="navbar">
    <div class="nav-row" id="about">
        <c:if test="${user != null}">
            <p>Hi, ${user.name}</p>
        </c:if>
    </div>
    <div class="nav-row" id="login">

        <c:if test="${user == null}">
            <a class="form-link" id="loginLink">Log in</a>
            <span> | </span>
            <a class="form-link" id="signupLink">Sign Up</a>
        </c:if>

        <c:if test="${user != null}">
            <span> | </span>
            <a class="form-link" id="logout" href="<%= request.getContextPath() %>/logout">Log out</a>
        </c:if>

        <input class="form-control form-control-focus" id="userEmail" type="email"
               placeholder="Email"
               name="user-email" autofocus="true"/>

        <div id="userEmailError" class="errorBox">Email should contain @</div>
        <div id="userLoginError" class="errorBox">Incorrect email or password</div>
        <div id="userSignupError" class="errorBox">Email already exists</div>

        <input class="form-control form-control-focus" id="userPass" type="password"
               placeholder="Password"
               name="user-password"/>

        <div id="userPassError" class="errorBox">Password should be between 5-20 characters</div>

        <input class="form-control form-control-focus" id="confirmUserPass" type="password"
               placeholder="Confirm Password"
               name="user-confirm-password"/>

        <div id="userConfirmPassError" class="errorBox">Passwords don't match</div>

        <input class="form-control form-control-focus" id="userName" type="text"
               placeholder="Name"
               name="user-email" autofocus="true"/>

        <div id="userNameError" class="errorBox">Name should be between 5-20 characters</div>

        <div id="userSignupSuccess" class="errorBox">Welcome, writer!</div>

        <button type="button" class="btn btn-primary" id="loginBtn"
                onclick="ajaxLogin()">Log in
        </button>

        <button type="button" class="btn btn-primary" id="signupBtn"
                onclick="ajaxSignup()">Sign up
        </button>

    </div>
    <footer class="nav-row" id="footer">
        <h3>The content management system</h3>
        <h5>Creative Commons 2014</h5>
    </footer>
</nav>
<script>
    $("#loginLink").click(function () {
        $('#confirmUserPass').hide();
        $('#userName').hide();
        $('#signupBtn').hide();
        $('#userEmail').show();
        $('#userPass').show();
        $('#loginBtn').show();
    });
    $("#signupLink").click(function () {
        $('#loginBtn').hide();
        $("#userEmail").show();
        $('#userPass').show();
        $('#confirmUserPass').show();
        $('#userName').show();
        $('#signupBtn').show();
    });
    function isValidEmail(email) {
        if (!email.match("@") || email.length > 50) {
            $('#userEmailError').show();
            return false;
        }
        $('#userEmailError').hide();
        return true;
    }
    function isValidPass(pass) {
        if (pass.length < 5 || pass.length > 20) {
            $('#userPassError').show();
            return false;
        }
        $('#userPassError').hide();
        return true;
    }
    function isValidConfirmPass(pass, confirmPass) {
        if (confirmPass != pass) {
            $('#userConfirmPassError').show();
            return false;
        }
        $('#userConfirmPassError').hide();
        return true;
    }
    function isValidName(name) {
        if (name.length < 5 || name.length > 20) {
            $('#userNameError').show();
            return false;
        }
        $('#userNameError').hide();
        return true;
    }
    function validated(email, pass, confirmPass, name, isLogin) {
        var valid = true;
        if (!isLogin && (!isValidName(name) || !isValidConfirmPass(pass, confirmPass))) {
            valid = false;
        }
        if (!isValidEmail(email) || !isValidPass(pass)) {
            valid = false;
        }
        return valid;
    }
    function ajaxSignup() {
        var email = $('#userEmail').val();
        var pass = $('#userPass').val();
        var confirmPass = $('#confirmUserPass').val();
        var name = $('#userName').val();

        if (!validated(email, pass, confirmPass, name, false)) {
            return;
        }
        $.ajax({
            type: "POST",
            url: "<%= request.getContextPath() %>/signup/",
            data: "email=" + email + "&password=" + pass + "&name=" + name,
            dataType: "json",
            success: function (data) {
                if (data["result"] == "ok") {
                    $('#loginBtn').hide();
                    $("#userEmail").hide();
                    $('#userPass').hide();
                    $('#confirmUserPass').hide();
                    $('#userName').hide();
                    $('#signupBtn').hide();
                    $('#userSignupSuccess').show();
                } else {
                    $('#userSignupError').show();
                }
            }
        });
    }

    function ajaxLogin() {
        var email = $('#userEmail').val();
        var pass = $('#userPass').val();

        if (!validated(email, pass, "", "", true)) {
            return;
        }
        $.ajax({
            type: "POST",
            url: "<%= request.getContextPath() %>/login/",
            data: "email=" + email + "&password=" + pass,
            dataType: "json",
            success: function (data) {
                if (data["result"] == "ok") {
                    location.reload();
                } else {
                    $('#userLoginError').show();
                }
            }
        });
    }
    var currentArticleId;

    function setArticleId(articleId) {
        currentArticleId = articleId;
    }

    function createNewArticle() {
        $('#myModal').modal('toggle');
        $('#modalTitle').val("");
        $('#modalContent').val("");
        $('#modalType').val("small");
        $('#modalAuthorWrapper').hide();
        setArticleId(-1);
    }

    function ajaxGetArticle(articleId) {
        $.getJSON("<%= request.getContextPath() %>/articles/get/" + articleId, function (data) {
            $('#modalTitle').val(data["title"]);
            $('#modalAuthor').text(data["user"]["name"]);
            $('#modalDate').text(data["date"]);
            $('#modalContent').val(data["content"].replace(/<br\/>/g, "\n"));
            $('#modalType').val(data["type"]);
            $('#modalAuthorWrapper').show();
        })
        setArticleId(articleId);
    }

    function ajaxPostArticle() {
        var title = $('#modalTitle').val();
        var content = $('#modalContent').val().replace(/\n/g, "<br/>");
        var type = $('#modalType').val();
        if (currentArticleId == -1) {
            $.ajax({
                type: "POST",
                url: "<%= request.getContextPath() %>/articles/add",
                data: "title=" + title + "&content=" + content + "&type=" + type,
                dataType: "json",
                success: function (data) {
                    if (data["result"] == "error") {
                        alert("You are not logged in");
                    }
                    setArticleId(data["id"]);
                    var newArticleHtml = '<div id="articleTypeDiv-' + currentArticleId + '" class="post-' + type + '" data-toggle="modal" data-target="#myModal" onclick="ajaxGetArticle(' + currentArticleId + ')">\
                            <div class="article"> \
                            <h1 id="articleTitle-' + currentArticleId + '">' + title + '</h1>\
                    <br/>\
                    <h5 id="articleAuthor-' + currentArticleId + '">By ' + data["userName"] + ' published on ' + data["date"] + '</h5>\
                    <br/>\
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
                    $('#articleContent-' + data["id"]).html(content);
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
    <c:if test="${user != null}">
        <a class="form-link" id="addArticle" onclick="createNewArticle()"><h1>+ Add article</h1></a>
    </c:if>
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
            <c:if test="${user != null}">
                <c:set var="toggleModal" value='data-toggle="modal" data-target="#myModal"'/>
            </c:if>
            <div id="articleTypeDiv-${article.id}" class="${articleType}" ${toggleModal}
                 onclick="ajaxGetArticle(${article.id})">
                    <%--<div currentArticleId="img-holder" style="background-image: url('{{item.img}}');"></div>--%>
                <div class="article">
                    <br/>

                    <h1 id="articleTitle-${article.id}">${article.title}</h1>
                    <br/>
                    <h5 id="articleAuthor-${article.id}">By ${article.user.name} published on ${article.date}</h5>
                    <br/>

                    <p id="articleContent-${article.id}">${article.content}</p>
                    <br/>
                </div>
                <div class="modal-footer">
                    <c:if test="${user != null}">
                        <a class="form-link" id="deleteArticle"
                           href="<%= request.getContextPath() %>/articles/delete/${article.id}">
                            <button type="button" class="btn btn-primary">Delete</button>
                        </a>
                    </c:if>
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
                                                   class="form-control form-control-focus" placeholder="Title"/></h1>
                    <h5 id="modalAuthorWrapper" class="modal-title">By <span id="modalAuthor"></span> published on
                        <span id="modalDate"></span></h5>
                </div>
                <div class="modal-body">
                    <textarea type="text" id="modalContent" class="form-control form-control-focus"
                              placeholder="Your article"></textarea>
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