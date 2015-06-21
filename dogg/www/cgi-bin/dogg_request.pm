#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Post and Get
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;



package dogg_request
{
	sub post
	{
	#POST
		my %FORM;
		read(STDIN, my $buffer, $ENV{'CONTENT_LENGTH'});
		my @pairs = split(/&/, $buffer);
		foreach my $pair (@pairs) 
		{
			my ($name, $value) = split(/=/, $pair);
			$value =~ tr/+/ /;
			$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
			$FORM{$name} = $value;
		}
	}
	#GET
	sub get
	{
		my %query;
		my $buffer = $ENV{'QUERY_STRING'};
		my @pairs = split(/&/, $buffer);
		foreach my $pair (@pairs) 
		{
			my ($name,$value) = split(/=/, $pair);
			$value =~ tr/+/ /;
			$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
			$value =~ s/~!/ ~!/g;
			$query{$name} = $value;
		}
	}
}
1;
