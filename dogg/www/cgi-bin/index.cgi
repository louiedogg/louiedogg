#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description:
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;
use CGI;

my $cgi = new CGI;

print $ cgi->header,

$cgi->start_html
	(
		-title=>'My Web Page'
	),

	$cgi->h1('My Page Header'),
	"A line of text",

$cgi->end_html;
