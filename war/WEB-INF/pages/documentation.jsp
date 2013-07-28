<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<h2 id="requirements">System Requirements</h2>
<p>
You can download the <a href="/phptest.php">phptest.php</a> file (will start download in browser),
upload to your server and access it with a browser. It will tell you if your 
server meets the minimal requirements to run our program. This is the easiest
way to run the pre-installation test.
</p>
<h3>Server</h3>
<p>We run our sites
on Linux CentOS 64 bit version.</p>
<p><I>Important
disclaimer here: </I>
</p>
<p><I>You will need a
64-bit machine if you want to run this </I>
</p>
<p><I>program in
production. </I>
</p>
<p><I>This is because
MongoDB has limitation of</I></p>
<p><I>database size
on 32-bit machines.</I></p>
<p>You can certainly
use it on 32-bit machine but you will be limited to a database of only
about 2.5 Gigs, which may not be enough for busy sites that
plan on growing.</p>
<p>MongoDB uses more
disk space than a tranditional database like MySQL, so make sure to have plenty of
disk space available. 
</p>
<p>Also, you should
take advantage of MongoDB sharding and spread your data among
multiple servers. 
</p>
<p>This is optional,
but recommended for very busy sites in order to improve performance
and add fault tolerance.</p>
<h4>PHP</h4>
<p>php 5.3 or later
(We use namespaces, closures, anonymous functions &ndash; all the
latest and greatest that php 5.3 has
to offer)<br><br>We hight recommend to use at least php 5.3.3 because it
comes with php-fpm, which is the preferred way to run not just
this program, but also all php scripts you have.<br><br>This is the most
efficient way and can outperform the 
Apache with
mod_php by as much as 10 times. Yes, you can run thousands requests
per second with it, not possible with mod_php</p>
<h4>Database(s)</h4>
<p><A HREF="http://www.mongodb.org/" TARGET="_blank">MongoDB</A>
database (main storage back-end)</p>
<p>MySQL 5.X database
(optional, but <em>Similar Questions</em> feature will not work without it)
</p>
<p>The reason for
this is that MongoDB does not have a full text search feature and we
need it in order to find 'similar' questions as well as using
it for the search feature)<BR>We use MySQL only for it's full
text search and only to index/search question titles. 
</p>
<p>This way we don't
have to require any type of external search engine like Solr.<BR>There
is still an option to search by tags, which uses user-supplied tags
to find questions that contain<BR>&ldquo;Any&rdquo; or &ldquo;All&rdquo;
tags matching search query. (under development)</p>
<h4>Required PHP extensions:</h4>
<blockquote>
<OL>
	<LI><p><A HREF="http://us2.php.net/mongo" TARGET="_blank">mongo</A></p></LI>
	<LI><p>mbstring (This project uses php mbstring to offer the top notch first class UTF8 support for all input, including support for UTF8 Tags, Titles, User Names, Questions, Answers)</p></LI>
</OL>
</blockquote>
<h4>Optional PHP extensions:</h4>
<blockquote>
	<OL><LI><p>curl (for communicating to
	external APIs like Facebook and FriendConnect)</p></LI>
	<LI><p>GD (for generating Captcha images
	and resizing avatars) Without GD the Captcha feature will be automatically disabled</p></LI>
	<LI><p><A HREF="http://us2.php.net/oauth" TARGET="_blank">oauth</A>
	(for working with Twitter API)</p></LI>
	<LI><p>pdo (only if using MySQL for search feature)</p></LI>
	<LI><p>pdo_mysql (only if using MySQL for search feature)</p></LI>
	</OL>
<p><strong>APC</strong> (it's
is not installed by default with php 5.3, we highly recommend you use
it to speed up the loading of php
classes by as much as 500%. 
</p>
<p>All you have to do
is just make sure that apc extension is enabled, it will then be able
to cache all of the core classes of our program in the compiled
state)</p>
<p><A HREF="http://us2.php.net/tidy" TARGET="_blank"><B>tidy</B></A>
(for sanitizing input in case input is in html format)</p>
</blockquote>
<p>The preferred way to use php is by
using <A HREF="http://php-fpm.org/" TARGET="_blank">php fpm</A>,
which is distributed with php 5.3</p>
<p>Running php in fastcgi mode, under the
control of php-fpm will also enable the very powerful</p>
<p>function <em>fastcgi_finish_request()</em>,
which we use throught the site in order to speed up the page</p>
<p>rendering and defer the execution to
non web related functions such as API calls and email sending</p>
<p>till after the page has been rendered
and connection has been closed by the web server.</p>
<h4>Web server. </h4>
<p>We use <strong>Lighttpd</strong>,
but it also perfectly fine to use Apache or Nginx</p>
<p>Even when using
Apache, it's best to NOT use the mod_php, but instead run php</p>
<p>as fastcgi,
controlled by php-fpm and use Apache for serving static files like
images, css and js files.<BR>If you still prefer the old-school
mod_php way, that's fine, our program will happily work with with it.</p>
<p><B>Email server. </B>
</p>
<p>Any email server
will do. We use Postfix.</p>
<p><B>The <A HREF="http://www.maxmind.com/app/geolitecity" TARGET="_blank">Geolocation
database from MaxMind</A> </B>(you can download a free version or paid version,<br>
Choose Binary Format of GeoLite City)
</p>
<p>We use it to map
ip to location. 
</p>
<p>It helps in spam
filtering and also can be used to add locations of posters' to the
map using Google Maps API or to just display the flag of poster's
country.</p>
<p>You notice that memcache is not
required. This is because MongoDB itself behaves like a caching
server. 
</p>
<p>Since documents are stored in rich
document format, all 'SELECT' queries are extremely simple and fast.
There are never any table joins, and in most cases only primary key
is used.</p>
<p>We do have the Cache class to cache
some data like results or IP to Location lookups, and our Cache class
uses MongoDB also, so there is no need to additional cache
engine like memcache.</p>
<hr>
<h2 id="installation">Installation</h2>
<p>Unzip packaged zip file</p>

<p>Copy the directory to the root
directory of your website.</p>

<p>You will have this directory structure:</p>
<blockquote>
<p>/config</p>
<p>/lib</p>
<p>/logs</p>
<p>/www</p>
</blockquote>
<p>Configure your webserver to point 
your site's root directory to the www directory</p>

<p>* Note: <I>Inside the www directory
there is a phptest.php file. It's recommended that you run it from
your web browser. It will check to see that your server has all the
requirements to run Lampcms and will report if anything is missing on
your server.</I></p>

<h5>Actual Installation</h5>

<p>Set writable permissions for the /logs
directory</p>
<p>Set writable
permissions for the /www/w directory</p>

<p class="text-success">In www directory rename
bootstrap.dist.php to bootstrap.php</p>
<p>For the most basic installation (if you
are not interested in running multiple sites using a single instance
of Lampcms library) you don't even have to edit the bootstrap.php
file</p>

<p>Now inside config directory 
</p>
<p class="text-success">Rename !config.ini.dist to !config.ini</p>
<p class="text-success">Rename acl.ini.dist to acl.ini</p>
<p class="text-success">Edit !config.ini file</p>
<p>It's a pretty large config file, most
of the settings are optional and there are good comments for each
option.</p>
<p>There are some <strong>required</strong> settings
you <strong>must</strong> define:</p>
<blockquote>
<p>All settings in the [MONGO] section are
important &ndash; define connection to your mongo server</p>

<p>[DB] section is for MySQL connection
and is optional. MySQL server can be used as a search provider 
because MySQL has decent full text indexing. Using MySQL as
search/index provide you will be able to have a working search form
and also MySQL powers <i>similar questions</i> generation.</p>

<p>Other settings you <B>must</B> define
for your site are:</p>
<p>SITE_NAME</p>
<p>SITE_TITLE</p>
<p>SERVER_TIMEZONE</p>
<p>SITE_URL 
</p>
<p>EMAIL_DEVELOPER</p>
<p>EMAIL_ADMIN</p>
<p>EMAIL_DOMAIN</p>

<p>SALT &ndash; any random string, read
comments, this value should be saved somewhere and kept in safe place
&ndash; if lost then your members will not be able to login back to
site.</p>

<p>COOKIE_SALT &ndash; similar to SALT but
for cookies</p>

<p>[EMAIL_SERVER] section has important
setting to define your own email transport. On Linux server it's
usually a path to sendmail, on Windows you need to define SMTP server
and login/password for your SMTP server.</p>
</blockquote>
<p>You don't have to change anything else
unless you want to and understand all the comments.</p>
<p>If you want to configure rewrite rules
on your webserver for having nice static-looking urls (without having
to always point to index.php file) you should read RewriteRules.txt
file and can use it for Apache webserver or lighttpd.conf for
Lighttpd server.</p>

<p>We don't have rules for Nginx server
yet, but you will probably figure it out if you using Nginx.</p>

<p>If you setup rewrite rules then you
must also change the value of FILE (in the [URI_PARTS] section of
!config.ini) to an empty value. Just read comments above the FILE
setting.</p>
<p>If you want to run multiple sites using
the same Lampcms library remember that each site needs own copy of www
directory with all files, including own bootstrap.php and own config
directory.</p>
<p>Optionally you can move config
directory to any location you want and in bootstrap just define a
path to it.</p>
<h2 id="codedocs">Code Documentation</h2>
<p><strong>For developers</strong> - all classes contain detailed comment blocks, you can
	find all the info you need in the code comments</p>
<%@include file="footer.jsp" %>