#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Main Loop Module for the LouieDogg Perl Modules  
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;
																		#############################
																		# MAIN LOOP 		
																		# DOGG HOSPITALITY			
																		#############################
package dogg_main
{
																
																		######## LIBRARIES ##########
	local $/;															#	
	use dogg_lib;														# Main Declaration file
	use dogg_log;
																		# 																	
																		#### MAIN FILE DECLARATIONS ##
																		# 
			
																		######### SUBROUTINES ########
																		#																		#
	sub viewtouch														# ViewTouch is a PreReq
	{
		my $vt_runonce = "/usr/viewtouch/bin/runonce";
		if(-e $vt_runonce)												# Viewtouch Run File
		{
			return 1;
			dogg_log::write_action(__FILE__, __LINE__, "Action:
				Viewtouch Was Found.");
		}		
	}
	
	sub run_commands													# Run Rsync commands 
	{
		foreach my $command (@_)
		{
			system("$command") or print("$!\n");
			dogg_log::write_action(__FILE__, __LINE__, 
				"Action:$command was ran" );
		}
	}
	sub update_version 
	{ 
		my $message = shift;
		dogg_log::write_version('dogg_version', $message);
	}
																	
																		######### MAIN LOOP ##########																		
	sub main
	{															
		chdir "/";
		
		if(&viewtouch == 1)	
		{	
			my $demo_db = dogg_json->new('dat','demo');			
			
			local $/;													#Enable Slurp	 			
																		#### Works for getting each object name
			my $demo = dogg_json::decoded_json();						# Decodes the file declared in new
			my $objects =  $ {$demo} { 'demo' };						# Prepage Hash Ref for objects
			my @top_nav;												# Declare an array for objects to go into
						
			foreach my $object (keys %{$objects})						# loop through keys of objects
			{
				my $label = $demo->{'demo'}->{$object}->{"label"};		# this pulls the values for the object			
				push @top_nav, $label;									# label inside the dat/demo.json
			}

			my @side_nav = qw/Exit 										
							Account 
							Packages 
							ViewTouch 
							Restaurateur/;
						
																		####### DASHBOARD ##########
																		#
																		############################
			my $mw = dogg_main_window::new();							# MAIN WINDOW
																		#
																		# MAIN LEFT NAVIGATION
			$mw = dogg_main_window::left_nav(@side_nav);				# Side Nav
																		#
																		# TOP NAVIGATION
			$mw = dogg_main_window->top_nav(@top_nav);					# Top Nav
																		#
																		# MAIN FRAME
			#$mw = dogg_main_window::main_frame(@bottom_menu);			# ---Read in an array based off json
																		# file template
																		# Does not work
			# WIDGETS WILL NOT SHOW UP IF BELOW THIS LINE # # # # # # # ###### Main Widget Main Loop ####
			$mw = dogg_main_window->main_loop;					# Must have Main Loop for Widget
		}
		else
		{
			print "You will need to install viewtouch.\n";
		}

	}
}
1;
