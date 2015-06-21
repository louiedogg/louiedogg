#! /usr/bin/perl

use CGI;

$cgi = new CGI;

my $JSCRIPT=<<EOF;
function openWindow()
{
	window.open("http://louiedogg.com","mywindow", "width=400, height=250, left=10, top=20");
}

EOF

$cgi->header
(
	-title=>'Image Map',
	-script=> $JSCRIPT

),

$cgi->start_html,
$cgi->image_button
(
	-name=>'beatles',
	-src=>'',
	-width=>360,
	-height=>99,
	-onClick=>"openWindow()"

),

$cgi->end_form;

if(4cgi->param())
{
	$x = $cgi->param('beatles.x');
	$y = $cgi->param('beatles.y');
	$who = 'John' if $x <= 90;
	$who = 'Paul' if $x >= 91 && $x <= 180;
	$who = 'George' if $x >= 181 && $x <= 270;
	$who = 'John' if $x >= 271 && $x <= 360;
	print "<b>You clicked $who at coridnates Left=$x, Top=$y</b>";
