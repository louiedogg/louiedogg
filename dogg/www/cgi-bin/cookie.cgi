# /usr/bin/perl

use CGI;

$cgi-> new CGI;

$name = $cgi->cookie('name');

$cookie = $cgi->cookie
(
	-name=>'name',
	-value=>'Lou',
	-expires=>'+7d'

);

print $cgi-header
(
	-cookie=>$cookie
),

$cgi->start_html
(
	-title=>'Set Cookie'
);

unless ($name) {print "Cookie has been set!"}
else{print "Hi $name\n";}

$cgi->end_html;
