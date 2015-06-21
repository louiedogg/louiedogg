#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description:Write New Files to the Dat folder
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;

package dogg_dat
{
	use dogg_key;
	use dogg_json;
	
	my $dat_dir = 'dat';
																		######### SUBROUTINES #######
	sub prepare_dat
	{
		use DateTime;
		my $dt = DateTime->now;
		my $date_time = join ' ', $dt->ymd, $dt->hms;
		my $status = 0;
		my $permission = 100;
		my @dat_arr = ( "key" => "$_[0]",
						"date_time" => "$date_time",
						"status" => "$status",
						"permission" => "$permission",);		
		return @dat_arr;
		
	}
		
	sub write_dat 
	{ 	
		my $db_name = shift;
		my $key = dogg_key::get_key($dat_dir, $db_name);					#Object name , Name of file							
		my @dat = prepare_dat("$key"); 		
		push @dat, @_;
		dogg_json->new($dat_dir, $db_name);
		dogg_json::add_object("$key", @dat);
	}
		
}
1;
