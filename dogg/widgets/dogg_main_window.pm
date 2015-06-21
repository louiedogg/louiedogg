#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: Declarations and Subroutines for 
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;

package dogg_main_window
{
																		##### Main Declaratoins #####
	use Tk 800.00;
	my $mw;
	
	sub new 															##### Main Window #####
	{		
		$mw = MainWindow->new; 											#Declare Tk Window
		$mw->title("Revenue River Technologies LLC");					# Declare Window Title 
		$mw->geometry($mw->screenwidth . 'x' . $mw->screenheight . '+0+0');
		$mw->optionAdd("*font", "-*-arial-normal-r-*-*-*-120-*-*-*-*-*-*");
		$mw->optionAdd("*borderWidth", 1);

	}
	
	sub top_nav
	{
		my @labels = @_;
		my $D = shift(@labels);
		
		#GUI Building Area;
		my $nav = $mw->Frame(-background => "white")->pack(-side => 'top',
                                                                   -fill => 'x');
		
			foreach my $mi (@labels)
			{
				$nav->Button(-text => "$mi", 
							-command => \&exit, 
							-height => 1, 
							-width => 10,
							-font => "Courier 20 bold")
						->pack(#-expand => 'left',
								-side => 'left');
			}
		
	}
	
	
	sub left_nav
	{
		my @labels = @_;
		#my $D = shift(@labels);
		
		#GUI Building Area;
		my $left_nav = $mw->Frame(-background => "white")->pack(-side => 'left',
                                                                   -fill => 'y');
		
			foreach my $mi (@labels)
			{
				$left_nav->Button(-text => "$mi", 
							-command => sub { exit }, 
							-height => 2, 
							-width => 11,
							-font => "Courier 20 bold")
						->pack(#-expand => 'right',
								-side => 'top');
			}
		
	}
	
	sub bottom_left_button
	{
		my @labels = @_;
		#my $D = shift(@labels);
		
		#GUI Building Area;
		my $left_nav = $mw->Frame(-background => "white")->pack(-side => 'bottom',
                                                                   -fill => 'y');
		
			foreach my $mi (@labels)
			{
				$left_nav->Button(-text => "$mi", 
							-command => sub { exit }, 
							-height => 2, 
							-width => 10,
							-font => "Courier 20 bold")
						->pack(#-expand => 'right',
								-side => 'left');
			}
		
	}
	
	sub top_left_button
	{
		my @labels = @_;
		my $D = shift(@labels);
		
		#GUI Building Area;
		my $left_nav = $mw->Frame(-background => "white")->pack(-side => 'bottom',
                                                                   -fill => 'y');
		
			foreach my $mi (@labels)
			{
				$left_nav->Button(-text => "$mi", 
							-command => sub { exit }, 
							-height => 2, 
							-width => 10,
							-font => "Courier 20 bold")
						->pack(#-expand => 'top',
								-side => 'bottom');
			}
		
	}
	
	sub Account 
	{}
	sub Packages 
	{}
	sub ViewTouch 
	{}
	sub Restaurateur 
	{}
	
	
	##### Main Loop ######
	sub main_loop
	{
		##### Main Loop ^^^^^^^^ 	# All Tk declarations above here
		MainLoop; 					# Main Loop 
	}
	sub DESTROY
	{}
	
}
1;
