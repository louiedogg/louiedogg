# /usr/bin/perl

use CGI;

$cgi = new CGI

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
),
a line of text,

$cgi->center($cgi->h1('My Page Header')), "\n",
"A line of text.", $cgi->br, "\n",
$cgi->br, "\n",
$cgi->end_html();

unless ($name) {print "Cookie has been set!"}
else{print "Hi $name\n";}

#$cgi->end_html;
