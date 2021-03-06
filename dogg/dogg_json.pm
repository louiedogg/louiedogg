#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: JSON FLAT FILE DATABASE
# 
# License:GPLv2
#
# ####################################################################
#use strict;
#use warnings;
																		#############################
																		# READ, WRITE, & APPEND		
																		# JSON CONFIG FILE 			
																		#############################
																															
package dogg_json
{															
   
   	use JSON::PP;														# Include JSON pure perl
	my $json = JSON::PP->new->allow_nonref;								# Create the $json object
		
    chdir "/";															# Saving a headache
    local $/;															# Enable slurp for file reading
	my $json_file;														# Declare a global file object
	my $db_name;														# Declare a global name JSON db
	my $key = 9999;
																																																	# Database
	use dogg_lib;														# JSON database files
	my $dogg_db;														# The Directory that we are writing to

	sub new																# Takes file name w/o extension 
	{																	# as argument

		my $arg1 = shift;
		my $dat_dir;
		
		if($arg1 eq "dogg_json")
		{
			$dat_dir = shift;
			$db_name = shift ;
		}
		else
		{
			$dat_dir = $arg1;
			$db_name = shift;
		}
		
		if($dat_dir eq "dat")
		{
			$dogg_db = dogg_lib::dogg_dat();							# Demo info files
		}
		elsif($dat_dir eq "log")
		{
			$dogg_db = dogg_lib::dogg_log();
		}
		elsif($dat_dir eq "version")
		{
			$dogg_db = dogg_lib::dogg_version();
		}
		else
		{
			print "Error: with----\n";
			print "$dat_dir\n\n";
		}	
				
		$json_file = $dogg_db."$db_name".'.json';
				
		unless(-e $json_file)
		{	
			my $first_row = {$db_name => undef};
			encode_and_write($first_row);
		}
	}
	
	sub standard_key 
	{
		return $key;													# First key in any file
	}									
	
	sub encode_and_sort													# Encode to JSON and sort for better
	{																	# readability
		my $encoded;
		#$encoded = $json->encode($_[0]);								# without sort
		$encoded = $json->sort_by(sub { $JSON::PP::a cmp $JSON::PP::b })->pretty->encode($_[0]);	
		return $encoded;
	}
	
	sub decoded_json													# Decode full file
	{
		local $/;														# Enable slurp
		my @read = read_file();
		my $decoded = decode_json(@read);
		return $decoded;
	
	}
	
	sub decode_table													# Decode table item, takes 1 arg 
	{																	# the column name, though I believe
		my $table = shift;	
		my $ref = shift;															
		my $db = decoded_json();										# Decodes the file declared in new
		my $objects =  $ {$db} { $table };								# Prepage Hash Ref for objects
		my @items;														# Declare an array for objects to go into
						
		foreach my $obj (keys %{$objects})								# loop through keys of objects
		{
			my $item = $db->{$table}->{$obj}->{$ref};					# this pulls the values for the object			
			push @items, $item;											# label inside the dat/demo.json
		}
		return @items;
	}																	 
																			
		
	sub add_object														# Reads in file and append object
	{																	# inside the main object
		my $decoded = decoded_json();
		my $prev_data = $ {$decoded} { $db_name };		
		my $table_name = shift @_;
		my $row = {$table_name=>{@_}};
		$decoded -> {$db_name} = {%{$prev_data}, %{$row}};	
		my $encoded = $json->sort_by(sub { $JSON::PP::a cmp $JSON::PP::b })->pretty->encode($decoded);		
		encode_and_write($decoded);
		
	}
			
	sub read_file														# Reads a file and returns as array
	{		
		open(FILE, "$json_file");
		my @read = <FILE>;
		close(FILE);	
		return @read;
	}
	
		
	sub encode_and_write												# Encode and write a file
	{																	# arument must be scalar (a reference)
		my $encoded = encode_and_sort($_[0]);
		
		#Do it
		open(FILE, ">$json_file");
		print FILE $encoded;
		close(FILE);
	}
	
# TEST BAY																
	my @arr = (	
				"key" => "$key",
				"label" => "BreakMEX",
				"status" => "1",
				"bin" => "bin_breakfast",									
				"dat" => "dat_breakfast",
				"demo_directory" => "demo_breakfast",
				"image" => "demo_breakfast_image.png",			
				"repo" => "https://github.com/revenuerivertechnologies/demo_breakfast.git"
				);
	my @mex = (	
				"key" => "$key",
				"label" => "Mexican",
				"status" => "1",
				"bin" => "bin_mexican",									
				"dat" => "dat_mexican",
				"demo_directory" => "demo_mexican",
				"image" => "demo_mexican_image.png",			
				"repo" => "https://github.com/revenuerivertechnologies/demo_mexican.git"
				);
	my @burger = (
				"key" => "$key",
				"label" => "Burger",
				"status" => "1",
				"bin" => "bin_burger",									
				"dat" => "dat_burger",
				"demo_directory" => "demo_burger",
				"image" => "demo_burger_image.png",			
				"repo" => "https://github.com/revenuerivertechnologies/demo_burger.git"
				);
	my @deli = (
				"key" => "$key",
				"label" => "Deli",
				"status" => "1",
				"bin" => "bin_deli",									
				"dat" => "dat_deli",
				"demo_directory" => "demo_deli",
				"image" => "demo_deli_image.png",			
				"repo" => "https://github.com/revenuerivertechnologies/demo_deli.git"
				);
				
				
	
	#new("demo");
	
	#add_object("Breakmex",@arr);
	#add_object("breakfast", @arr);
	#add_object("burger", @burger);
	#add_object("deli", @deli);

	
	#### Works for getting each object name
	#my $decoded = decoded_json();

	#my $objects =  $ {$decoded} { $db_name };
	#foreach my $object (keys %{$objects})
	#{
	#	print "$object\n";
	#}
	
	#print "$decoded->{\"demo\"}->{\"burger\"}->{\"key\"}\n";
	
	#print($INC{"dogg_json.pm"}, "\n");
		
	######################

}
1;
