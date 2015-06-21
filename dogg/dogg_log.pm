#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Logging actions in dogg/log file
#
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;

package dogg_log
{
	use dogg_key;
	use dogg_json;
	
	my $dat_dir = 'log';
	my $db_name;
	my $key;
	
	sub prepare_log
	{
		use DateTime;
		my $dt = DateTime->now;
		my $date_time = join ' ', $dt->ymd, $dt->hms;
		my $status = 0;
		my @log_arr = ( "key" => "$_[0]",
						"date_time" => "$date_time",
						"status" => "$status");		
		return @log_arr;
		
	}
		
	sub write_log 
	{ 
		$db_name = shift;
		$key = dogg_key::get_key($dat_dir, $db_name);					#Object name , Name of file							
		my @error = prepare_log("$key"); 
		my @err_info = ("file" => (shift),
						"line" => (shift),
						"message" => (shift));
		
		push @error, @err_info;
		dogg_json->new($dat_dir, $db_name);
		dogg_json::add_object("$key", @error);
	}
	
	sub write_action 
	{ 
		write_log('dogg_action', shift, shift, shift);
	}
	sub write_error
	{
		write_log('dogg_error', shift, shift, shift);
	}	
	
		
	sub prepare_version
	{
		use DateTime;
		my $dt = DateTime->now;
		my $date_time = join ' ', $dt->ymd, $dt->hms;
		my $version = 0;
		my @version_arr = ( "key" => "$_[0]",
							"date_time" => "$date_time",
							"version" => "$version",
							"readable" => "$version."."$_[0]");		
		return @version_arr;
		
	}
		
	sub write_version 
	{ 
		$db_name = shift;
		$dat_dir = 'version';
		$key = dogg_key::get_key($dat_dir, $db_name);					#Object name , Name of file							
		my @version = prepare_version("$key"); 
		my @version_info = ("message" => (shift));
		
		push @version, @version_info;
		dogg_json->new($dat_dir, $db_name);
		dogg_json::add_object("$key", @version);
	}
		
}	
1;				
