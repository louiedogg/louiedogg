#! /usr/bin/perl


use CGI;

$cgi = new CGI;
print "Content-type: text/html\n\n";
print $cgi-header,

$cgi->start_html
(
	-title=>'Revenue River Technologies LLC'
),

$cgi->center($cgi->h1('Home Page')), "\n",
"A line of text.", $cgi->br, "\n",
$cgi->br, "\n",

$cgi->start_table({-width=>'400',
			-border=>'1'}), "\n",

$cgi->start_Tr, "\n",
	$cgi->start_td({-width=>'200',
			-align=>'center'}),
			"Cell 1",
	$cgi->end_td, "\n",
$cgi->start_Tr, "\n",
	$cgi->start_td({-width=>'200',
			-align=>'center'}),
			"Cell 2",
	$cgi->end_td, "\n",
 
$cgi->end_Tr, "\n",
$cgi->start_Tr, "\n",
	$cgi->start_td({-colspan=>'2',
			-align=>'right',
			-bgcolor=>'red'}),
			"Cell 2",
	$cgi->end_td, "\n",
 
$cgi->end_Tr, "\n",
$cgi->end_table, "\n",

$cgi->start_form
(
	-method=>'post',
	-action=>'http://louiedogg.com',

), "\n",

"Textbox:",
$cgi->textfield(-name=>'textbox',-size=>15), $cgi->br, "\n",
"Password: ",
$cgi->password_field(-name=>'password',-size=>15), $cgi->br, "\n",

"Radio:",
$cgi->radio_group
(
	-name=>'radio',
	-value=>['Red', 'Blue', 'Green'],
	-default=>'Blue'
), $cgi->br, "\n",

"Checkboxes:",
$cgi->checkbox_group
(
	-name=>'checkboxes',
	-values=>['Burger', 'Fries', 'Coke'],
	-defaults=>['Burger']
), $cgi->br, "\n",

"Scrollbox:",
$cgi->scrolling_list
(
	-name=>'scrollbox',
	-size=>1,
	-values=>['Hat', 'Coat', 'Jacket'],
	-defaults=>['Jackets']

),$cgi->br, "\n",
"Comments: ", $cgi->br, "\n",
$cgi->textarea
(
	-name=>'textarea',
	-columns=>20,
	-rows=>5
),
$cgi->hidden(-name=>'hidden',
		-value=>'Toys'), "\n",


$cgi->submit(-name=>'submit', -value=>'Submit'), "\n",
$cgi->reset, "\n",
$cgi->end_form,
$cgi->end_html;


#results
print "<br>\n";
if($cgi->param('textbox')) {print "Textbox: ", $cgi->param('textbox'), $cgi->br, "\n";}
if($cgi->param('password')) {print "Password: ", $cgi->param('password'), $cgi->br, "\n";}
if($cgi->param('radio')) {print "Radio: ", $cgi->param('radio'), $cgi->br, "\n";}
if($cgi->param('checkboxes')) {print "Checkbox: ", $cgi->param('checkboxes'), $cgi->br, "\n";}
if($cgi->param('textarea')) {print "Textarea: ", $cgi->param('textarea'), $cgi->br, "\n";}
if($cgi->param('hidden')) {print "hidden: ", $cgi->param('hidden'), $cgi->br, "\n";}
if($cgi->param('scrollbox')) {print "scrollbox: ", $cgi->param('scrollbox'), $cgi->br, "\n";}


