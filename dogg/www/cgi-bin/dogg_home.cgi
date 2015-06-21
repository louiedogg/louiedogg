#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Home Page
#
# License:GPLv2
#
# ####################################################################
#use strict;
use warnings;
use CGI;

$cgi = new CGI;

print $cgi-header,

$cgi->start_html
(
	-title=>'Set Cookie'
),
a line of text,

$cgi->center($cgi->h1('Home Page')), "\n",
"A line of text.", $cgi->br, "\n",
$cgi->br, "\n",
$cgi->end_html();
