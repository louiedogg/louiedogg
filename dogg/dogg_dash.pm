#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ######################################################################
# Description: Dogg Dashboard 
#
# License:GPLv2
#
# ######################################################################
use strict;
use warnings;
																		#############################		
																		# DOGG DASHBOARD		
																		#############################
package dogg_dash
{
	#use dogg_cwd;
		
																
																		######## LIBRARIES ##########
	use lib 'lib';														#	
	use dogg_lib;														# Main Declaration file
	local $/;																															


	my @nav_bars = qw(demo user);
						
	sub point_of_sale_demo
	{

	}
	
	sub user_basic
	{
		my $key;
		my $label;
		my $status;
		my $fname;
		my $lname;
		my $email;
		my $phone;
		my $pin;
		my $permission;			
			
		my @admin_array = (
						"key" => "$key",
						"label" => "$label",
						"status" => "$status",
						"first_name" => "$fname",									
						"last_name" => "$lname",
						"email" => "$email",
						"phone" => "$phone",
						"pin" => "$pin",			
						"permission" => "$permission"
						);
	}
																		######### SUBROUTINES ########
														#																		#
	sub viewtouch_demo
	{	
		my $db_name;
		my $key;
		my $label;
		my $status;
		my $bin;
		my $dat;
		my $demo_dir;
		my $image;
		my $repo;
			
		my @demo_array = (
						"key" => "$key",
						"label" => "$label",
						"status" => "$status",
						"bin" => "$bin",									
						"dat" => "$dat",
						"demo_directory" => "$demo_dir",
						"image" => "$image",			
						"repo" => "$repo"
						);
		
		return @demo_array;
	}
	
	sub add_db_object
	{
													
		my $db_name = shift @_;
		my $new_db = dogg_json->new("$db_name");
		dogg_json::add_object($db_name, @_);
	}
	
	sub render_db
	{			
		my $db_name = shift @_;
		local $/;														#Enable Slurp	 			
		my $db = dogg_json->new("$db_name");						#### Works for getting each object name
		$db = dogg_json::decoded_json();		
		my $objects =  $ {$db} { "$db_name" };
		my @nav;
						
		foreach my $obj (keys %{$objects})
		{
			my $label = $db->{"db_name"}->{$obj}->{"label"};						
			push @nav, $label;
		}
		
		return @nav;
		
	}
	
	
}
1;
