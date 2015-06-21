#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description:
#
# License:GPLv2
#
# ####################################################################
use CGI;
use lib "cgi-bin";
use dogg_request;

use CGI;
$cgi = new CGI;

sub dogg_login
{
	print $cgi->header,

	$cgi->start_html
	(
		-title=>"Revenue River Technologies LLC",
		-keywords=>["louiedogg", "louiedogg85", "point-of-sale"],
		-bgcolor=>"#E8E8E8",
		-Link=>({-rel=>"stylesheet", -type=>"text/css", -href=>"css/louiedogg.css"})

	),

	$cgi->center($cgi->h1("Welcome to Restaurateur"), $cgi->br, "\n",
	$cgi->h3("Please Login.")), "\n",
	$cgi->br, "\n",
	$cgi->center(
	$cgi->start_table({-width=>"400",
				-border=>"1"}), "\n",

	$cgi->start_form
	(
		-method=>"post",
		-action=>"",

	), "\n",

		$cgi->start_Tr, "\n",
			$cgi->start_td({-colspan=>"2",
							-width=>"200",
							-align=>"center",
							-bgcolor=>"lightgrey"}),
				$cgi->h5("Username:",$cgi->textfield(-name=>"textbox",-size=>15)),  "\n",
			$cgi->end_td, "\n",
		$cgi->end_Tr, "\n",
		$cgi->start_Tr, "\n",
			$cgi->start_td({-colspan=>"2",
							-width=>"200",
							-align=>"center",
							-bgcolor=>"lightgrey"}),
				$cgi->h5("Password:",$cgi->password_field(-name=>"password",-size=>15)),  "\n",
			$cgi->end_td, "\n",
		$cgi->end_Tr, "\n",
		$cgi->start_Tr, "\n",
			$cgi->start_td({-align=>"center",
							-bgcolor=>"grey"}),	
					$cgi->a( {-href=>"cgi-bin/dogg_forgot.cgi"}, "Forgot Password ?"),"\n",
			$cgi->end_td, "\n",
			$cgi->start_td({-align=>"center",
							-bgcolor=>"grey"}),
					 $cgi->submit(-name=>"login", -value=>"Login"), "\n",
			$cgi->end_td, "\n", 
		$cgi->end_Tr, "\n",
	$cgi->end_table, "\n",

	$cgi->hidden(-name=>"hidden",
			-value=>"Toys"), "\n",

	$cgi->end_form,
	),
	$cgi->end_html;
}

sub dogg_login_submit
{
	#results
	print "<br>\n";
	if($cgi->param("textbox")) {print "Textbox: ", $cgi->param("textbox"), $cgi->br, "\n";}
	if($cgi->param("password")) {print "Password: ", $cgi->param("password"), $cgi->br, "\n";}
	if($cgi->param("radio")) {print "Radio: ", $cgi->param("radio"), $cgi->br, "\n";}
	if($cgi->param("checkboxes")) {print "Checkbox: ", $cgi->param("checkboxes"), $cgi->br, "\n";}
	if($cgi->param("textarea")) {print "Textarea: ", $cgi->param("textarea"), $cgi->br, "\n";}
	if($cgi->param("hidden")) {print "hidden: ", $cgi->param("hidden"), $cgi->br, "\n";}
	if($cgi->param("scrollbox")) {print "scrollbox: ", $cgi->param("scrollbox"), $cgi->br, "\n";}
}
dogg_login();
