#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Dogg arrays hold the format of there resective dat files
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;

package dogg_arrays
{
																		## Every Dat file needs a format array
	sub vt_demo_array
	{
		my $db_name = shift;
		my $name = shift;
		my $label = ucfirst($name);	
		my $bin = "bin_".$name;
		my $dat = "dat_".$name;
		my $demo_dir = "demo_".$name;
		my $image = "demo_".$name."_image.png";
		my $repo = "https://github.com/revenuerivertechnologies/demo_$name.git";

				
		my @demo_array = (	"name" => "$name",
							"label" => "$label",
							"bin" => "$bin",									
							"dat" => "$dat",
							"demo_dir" => "$demo_dir",
							"image" => "$image",			
							"repo" => "$repo"
							);
		
		return @demo_array;
	}
}
1;
