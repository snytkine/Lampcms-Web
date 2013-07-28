<%-- 
    Document   : header.jsp
    Created on : Dec 9, 2012, 2:42:41 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>LampCMS Open Source Question Answer program</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Le styles -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        </style>
        <link href="bootstrap/css/bootstrap-responsive.min.css"
              rel="stylesheet">

        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
              <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <![endif]-->
    </head>

    <body>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse"
                       data-target=".nav-collapse"> <span class="icon-bar"></span> <span
                            class="icon-bar"></span> <span class="icon-bar"></span>
                    </a> <a class="brand" href="/">LampCMS</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">                          
                            <c:forEach items="${menu}" var="item">
                                <c:choose>
                                    <c:when test="${currentUrl == item.key}">
                                        <li class="nav active"><a href="${item.key}.htm">${item.value}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="nav"><a href="${item.key}.htm">${item.value}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <li class="dropdown${currentUrl == 'documentation' ? ' active' : ''}"><a href="#" class="dropdown-toggle"
                                                                                                           data-toggle="dropdown">Documentation <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="/documentation.htm#requirements">Requirements</a></li>
                                    <li><a href="/documentation.htm#installation">Installation</a></li>
                                    <li><a href="/documentation.htm#installation">Code Documentation</a></li>
                                </ul></li>
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
        <div class="container">
 