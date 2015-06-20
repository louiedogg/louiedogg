#! /usr/bin/perl

# Copyright 2015 LouieDogg LLC
my $author = "admin\@louiedogg.com";
# ####################################################################
# Description: lib constanct variables
#
# License:GPLv2
#
# ####################################################################
use strict;
use warnings;
				
package dogg_lib														
{																	
   	use dogg_cwd;
    my $cwd = dogg_cwd::get_cwd();										# Declare current directory
    	
																		######## NEW #######
																		
																		######## DOGG JSON DB ######
	sub dogg_dat														
	{																																																		#
		my $dogg_dat = $cwd.'dat/';										# Encode and Decode JSON Database
		return $dogg_dat;												# JSON database files
				
	}
																		######## DOGG LOG #########
	sub dogg_log														#
	{																	
		my $dogg_log = $cwd."log/";										# Log files
		return $dogg_log;	
	}
	
	sub dogg_version													#
	{																	
		my $dogg_version = $cwd."version/";								# Version files
		return $dogg_version;	
	}
																		####### WIDGET LIBS ########
	sub dogg_widgets													# tk widget & window files
	{																	
		use lib 'widgets';												
		use dogg_main_window;											# Main Window
		use dogg_demo;													# Demo Bar and Buttons
		our $dogg_widgets = $cwd."widgets/";							# Widget Files
	}	
	
	sub	dogg_web					
	{																	############# WEB ##########
		use lib 'web';													# web based files
		our $dogg_web = $cwd."web/";									# Web Files		
																		# Comming Soon
	}																	


}
1;
