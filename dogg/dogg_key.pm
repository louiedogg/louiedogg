#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Key Service
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;


package dogg_key
{		
	use dogg_json;
	sub new																# Creates key based off last line
	{																	# of file	
		my $dat_dir = shift @_;
		my $db_name = shift @_;
		my $decoded = dogg_json::new($dat_dir, $db_name);
		$decoded = dogg_json::decoded_json();
		my $objects =  $ {$decoded} { $db_name } ;
		my @list;
		my $max = dogg_json::standard_key();
		push @list, $max;
		
		foreach my $object (keys %{$objects})
		{		
			my $key = $decoded->{$db_name}->{$object}->{"key"};	
			push @list, $key;	
		}
		@list = sort { $a <=> $b } @list;
		$max = $list[$#list];
		return ++$max;	
	}
	
	sub get_key
	{
		my $dat_dir = shift;
		my $db_name = shift;
		my $key = new($dat_dir, $db_name);		
	}
			
}
1;
