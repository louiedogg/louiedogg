#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: CWD
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;

package dogg_cwd
{	
	my $cwd = 'usr/louiedogg/dogg/';			# Declare current directory	
	
	sub push_cwd														#
	{																																	
																													
		push @INC, $cwd;												# Push inc to this directory																														
	}
	
	sub get_cwd
	{
		return $cwd;
	}


}
1;
