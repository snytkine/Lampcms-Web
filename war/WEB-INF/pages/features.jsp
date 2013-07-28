
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<h1>LampCMS Features list</h1>
<UL>
<LI><P>Uses MongoDB as the main database storage. It can scale to very large size, capable of working with tens or even hundreds of millions or records, spanning dozens of servers</P></LI>
    <LI><P>Capable of handling very high-load websites, easily serving thousands of simultaneous requests</P></LI>
    <LI><P>Multiple sites can run off a single installation of the program.<br>Every new site just needs its own !config.ini file
    and own templates set and own .css file. All classes can be reused amount multiple sites!</P></LI>
<LI><P>Multi-lingual support. Internationalization and localization. All text strings are stored in translation files (XLIFF file format is used for translations). Support for custom date/time formatting based on country's locale</P></LI>
     <LI><P>Ajax based forms and many other features use Ajax</P></LI>
     <LI><P>Best support for UTF-8 Charset you will find in any php based app. Every incoming string is validated and if necessary converted to valid UTF-8 charset. Data is stored in DB in UTF-8, searches performed in UTF-8, all forms on this site have special instructions for browser to send data in utf-8 encoding. Tags are allowed to be any word in any language, tag can even contain special chars and symbols</P></LI>
       <LI><P>Abstract layer for plugging in any type of search engine from Lucene/Solr to Sphinx to any other search. Default is to use MySQL as search provider. This is very easy to setup and requires only one MySQL table. But MySQL is not actually required for this site, its optional and only for search feature</P></LI>
     <LI><P>All important forms use unique tokens to prevent CSRF attacks</P></LI>
       <LI><P>Password stored as sha256 + salt for extra security</P></LI>
        <LI><P>Cookie-based authentication ("Remember me" feature) used SHA256 salted values for extra security</P></LI>
    <LI><P>Our own super-lightweight php templating engine</P></LI>
    <LI><P>Extremely fast page rendering. On a 20,000 Questions site typical page with Question with 3 answers and 20 "Related Questions" links usually renders in about 35-75 milliseconds, depending on server load (Including database calls and php execution)
    (* With APC Cache)</P></LI>
    <LI><P>A page with 20 Recent Questions and 30 <em>Recent Tags</em>, and pagination links usually renderes in under 1/4 of a second
    (* With APC Cache)</P></LI>
<LI><P>Clean SEO-Friendly URLs</P></LI>
<LI><P>First N questions/answers (2 by default) from new user must be approved by moderators. This is a configurable feature and can be enabled in config file</P></LI>
<LI><P>Image Uploads feature with automatic image resizing (in Questions and Answers) can be enabled in config file</P></LI>
<LI><P>Auto-complete widget for search and for automatically similar question titles as user type in a new question</P></LI>
<LI><P>For programming-related Q&A Sites there is an optional
support for code editor and code highlighter that supports all of the popular
programming languages as well as CSS and HTML code highlighting (this feature can be turned on and off from config file)</P></LI>
<LI><P>Support for very simple way to add Youtube video to Question and Answer
by just clicking "YouTube" button and entering url of YouTube video.<br>Program will use YouTube API
to get thumbnail of video and will create all the necessary code for adding video to your site (this feature can be turned on and off from config file)</P></LI>	
<LI><P>Support for external
	authentication via Twitter (login with Twitter)</P></LI>
	<LI><P>Support for external
	authentication via Facebook (login with Facebook)</P></LI>
	<LI><P>Support for external
	authentication via LinkedIn coming soon</P></LI>
	<LI><P>Support for external
	authentication via Google FriendConnect, which allows to sign
	in<BR>with Google account, AOL, Yahoo, OpenID</P></LI>
	<LI><P>Question and Answers can also be posted to Facebook, Twitter, Tumblr and Blogger all at the same time, using post-processing feature
	that does not slow down the page load at all - all API calls are made after the page loaded and browser connection
	is closed.<br>User are rewarded with reputation points for posting content
	to external sites (Twitter, Tumblr, Facebook, Blogger)</P></LI>
	<LI><P>When external authentication is
	used, the system will still ask to provide an email address</P></LI>
	<LI><P>Email address validation via account activation email with a special link</P></LI>
	<LI><P>Ability to create own account
	without using external authentication. 
	</P></LI>
	<LI><P>User can upload own avatar which
	will be auto resized and converted into square size. 
	</P></LI>
	<LI><P>User can edit own profile and enter own
	 website, description. 
	</P></LI>
	<LI><P>Members can follow other members just like on Twitter</P></LI>
	<LI><P>Members can follow questions they are interested in monitoring</P></LI>
	<LI><P>Members can follow interesting tags</P></LI>
	<LI><P>Automatic email notification of activities in followed items (like when new question is added and contains followed tag)</P></LI>
	<LI><P>Admin can create <em>Sticky</em> posts that always stay on top of the list</P></LI>
	<LI><P><em>Dot folders</em> feature to indicate threads that you posted in</P></LI>
	<LI><P>Visually indicate questions you following on the questions list pages</P></LI>
	<LI><P>Browser-based storage to keep track of read/unread items and visually indicate when a question contain new answer or comment - something that you have not already read</P></LI>
	<LI><P>Personalization feature to highlight questions with tags you follow, and to display your followed tags on top of recent tags list</P></LI>
	<LI><P>Flexible Access control list (ACL)
	with group inheritances (based on Zend_ACL) as well as reputation
	based access permissions</P></LI>
	<LI><P>Automatic lockout after multiple
	failed login attempts</P></LI>
	<LI><P>Detection of password hack or cookie authentication hack attempts with automatic lockout of offending IP
	and notification of admin</P></LI>
		<LI><P>Intelligent Views counter - counts one view per
		Question per User or per IP if user not logged in</P></LI>
	<LI><P>Editing of existing Questions and Answers</P></LI>
	<LI><P>Deleting of Questions and Answers by Question owner
	or moderator</P></LI>
		<LI><P>Moderators can Close question, Question owner can request Question to be closed. Once closed, no more answers are accepted</P></LI>
		<LI><P>Keeps track of per-Tag statistics including count of questions with a specific tag</P></LI>
	<LI><P>Keeps track of all Unanswered Questions and Unanswered tags</P></LI>
	<LI><P>Keep track of Recent tags with the timestamp of latest question added with tag</P></LI>
	<LI><P>Keeps track of <em>Related Tags</em></P></LI>
	<LI><P>Users can report inappropriate content to moderators</P></LI>
	<LI><P>Spam fighting tools with ip and country banning</P></LI>
	<LI><P>Flood check - limit number of posts user can make in pre-defined number of minutes (configurable setting)</P></LI>
	<LI><P>Duplicate Question check - prevents user submitting the same question twice by keeping unique per-question hash</P></LI>
	<LI><P>Admin can easity change user's group or delete or ban user</P></LI>
	<LI><P>Admin can ban user at the same time when deleting a Question or Answer</P></LI>
	<LI><P>One-Click mass deletion of all posts made by spammer</P></LI>
	<LI><P>Ip-Based Geo Location stored with posts, can use to plot items
	on Google Map</P></LI>
	<LI><P>Ability to turn on/off display of page rendering time</P></LI>
	<LI><P>Support for styling &ndash; can
	create and upload set of templates plus css file to create brand new
	theme.</P></LI>
	<LI><P>Support for mobile browser &ndash;
	just create set of templates + css file suitable for mobile browser</LI>
	<LI><P>Fast, easy to use templating
	engine with no php logic inside template. A web designer can create
	templates without knowledge of php. 
	</LI>
	<LI><P>User can vote questions and
	answers up/down, can also un-vote (cancel vote). Votes
	increase/decrease reputations on question/answer posters.</P></LI>
	<LI><P>Asker can accept an answer as
	'best answer', can also change their mind if a better answer has
	been added after the one already been accepted.</P></LI>
	<LI><P>Reputation calculation is intelligent enough not to count points when user votes for own question or accepts own answer</P></LI>
	<LI><P>User is rewarded with extra points for accepting answers. This encourages to always try to accept one answer as <em>Best answer</em></P></LI>
	<LI><P>Module to create xml sitemaps
	(daily) and automatically submit new sitemaps to Google, Bing and
	Yahoo</P></LI>
	<LI><P>The program is written in good
	object oriented manner using MVC pattern, easy to understand, easy
	to write new classes or extend existing classes.</P></LI>
	<LI><P>The system uses Event model where
	events are posted at some interesting point of the program, for
	example <I>onBeforeNewQuestion</I>, <I>onNewQuestion</I>, <I>onNewUser</I>,
	etc. Custom observer class can be written to listen to any of the
	events and modify the objects passed to observer. Observer can also
	cancel event or throw a custom exception. This makes it very easy to
	write custom module without the need to touch the core classes. All
	custom observers extend LampcmsObserver class, which automatically
	has the Registry object. Registry object keeps references to all
	important objects like Mongo database driver, current Viewer object,
	settings</P></LI>
	<LI><P>Using cache headers (etag and
	last-modified) to make browser cache questions pages</P></LI>
	<LI><P>Rich text editor</P></LI>
</UL>
<%@include file="footer.jsp" %>