#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ######################################################################
# Description: Dogg Demo
#
# License:GPLv2
#
# ######################################################################
use strict;
use warnings;
																		#############################		
																		# DOGG DEMO		
																		#############################
package dogg_demo
{
	use dogg_json;
	my $id = 1000;
																		######### SUBROUTINES #######																	#																		#

	my @breakfast = viewtouch_demo("demo", 
									"breakfast",
									++$id,
									"Breakfast",
									"1",
									"bin_breakfast",
									"dat_breakfast",
									"demo_breakfast",
									"demo_breakfast_image.png",
									"https://github.com/revenuerivertechnologies/demo_breakfast.git");
	
							
	my @burger = viewtouch_demo("demo", 
									"burger",
									++$id,
									"Burger",
									"1",
									"bin_burger",
									"dat_burger",
									"demo_burger",
									"demo_burger_image.png",
									"https://github.com/revenuerivertechnologies/demo_burger.git");
	
	my @mexican = viewtouch_demo("demo", 
									"mexican",
									++$id,
									"mexican",
									"1",
									"bin_mexican",
									"dat_mexican",
									"demo_mexican",
									"demo_mexican_image.png",
									"https://github.com/revenuerivertechnologies/demo_mexican.git");

	my @deli = viewtouch_demo("demo", 
									"deli",
									++$id,
									"deli",
									"1",
									"bin_deli",
									"dat_deli",
									"demo_deli",
									"demo_deli_image.png",
									"https://github.com/revenuerivertechnologies/demo_deli.git");
									
	my @chinese = viewtouch_demo("demo", 
									"chinese",
									++$id,
									"chinese",
									"1",
									"bin_chinese",
									"dat_chinese",
									"demo_chinese",
									"demo_chinese_image.png",
									"https://github.com/revenuerivertechnologies/demo_chinese.git");
			
	sub viewtouch_demo
	{	
		my $db = shift @_;
		my $db_name = shift @_;
		my $key = shift @_;
		my $label = shift @_;
		my $status = shift @_;
		my $bin = shift @_;
		my $dat = shift @_;
		my $demo_dir = shift @_;
		my $image = shift @_;
		my $repo = shift @_;
			
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
	
	sub start_viewtouch_demo
	{
		my $arg = shift @_;
		#move files and start appropraite demo
	}
	
	sub demo_main
	{
		my $demo_db = dogg_json->new('demo');				
		local $/;													#Enable Slurp	 																					#### Works for getting each object name
		my $demo = dogg_json::decoded_json();
				
		my $objects =  $ {$demo} { 'demo' };
		my @labels;
					
		foreach my $obj1 (keys %{$objects})
		{
			my $label = $demo->{'demo'}->{$obj1}->{"label"};						
			push @labels, $label;
		}
		
		if(@labels ~~ "chinese")
		{
			
		}
		else
		{
			my $bin = 
			my $dat = 
			my 
			
		}
		
	}
		
}
1;
