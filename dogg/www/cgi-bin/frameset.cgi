#! /usr/bin/perl

use CGI;

$cgi = new CGI;


print $cgi->header,


$cgi->frameset(
	{-rows=> '40%,60%'}, "\n",
	$cgi->frame({-name=>'top',
			-src=>'http://louiedogg.com/'}), "\n",
	$cgi->frame({-name=>'bottom',
			-src=>'http://louiedogg.com/'}), "\n",

);
	
