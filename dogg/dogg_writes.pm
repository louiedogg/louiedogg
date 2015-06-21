#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Sub routines that Render arrays from dogg_arrays and
# and run subroutines from dogg_dat to write the respective files
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;

package dogg_writes
{																		##### Write Files #####	
	use dogg_arrays;
	use dogg_dat;
	
	sub write_demo														# this is intended for any table
	{ 																	# needs to have different name
		my $db_name = shift;
		my $obj_name = shift;
		my @demo_arr = dogg_arrays::vt_demo_array($db_name, $obj_name);
		dogg_dat::write_dat($db_name, @demo_arr);		
	}
	#my $table = 'breakfast';
	#my $ref = 'label';
	#my @demo_objects = dogg_json::decode_table($table, $ref)
	#unless($db_object ~~ @demo_objects)
	#{
	#	write_demo($db_name, $db_object);
	#}
}
