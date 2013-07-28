<%-- 
    Document   : download
    Created on : Dec 16, 2012, 12:05:03 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>Download LampCMS</h1>
<c:if test="${not empty versionNum}">
    <dl class="dl-horizontal">
        <dt>Current Version:</dt>
        <dd>${versionNum}</dd>
        <dt>Build time:</dt>
        <dd>${lastMod}</dd>
    </dl>
</c:if>
<p>A Lampcms.zip contains everything you need to create your own LampCMS powered Q&A site. 
    <br>Official ZIP file distribution
    includes minified versions of .css and .js files</p>
<p>Zip archive also contains lampcms.phar which is the entire structure of the lib directory in one archive file</p>
<p>If you don't plan on modifying source code of the core library then using lampcms.phar may be the better option</p>
<p>Using a lampcms.phar (included inside the zip archive) is also preferred when running multiple Q&A websites powered by single LampCMS library</p>

<p><a class="btn btn-large btn-primary" href="/lampcms.zip"><i class="icon-download icon-white"></i> Download the latest LampCMS ZIP archive</a>
<hr>
<p>The latest development code is available at Github. </p>
<p class="text-warning">The code on Github does not have minified .css and .js files
    and should be run in debug mode (you enable or disable debug mode in !config.ini config file)</p>
<p class="text-warning">lampcms.phar file is not available on github as it is generated only during the build of the official zip archive release</p>
<p><a href="https://github.com/snytkine/LampCMS" class="btn">Official LampCMS Github repository</a>
    <%@include file="/WEB-INF/pages/footer.jsp" %>
