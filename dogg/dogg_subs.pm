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
																		# SUBS that need dogg_json.pm	
																		#############################																																		
package dogg_subs
{
	use dogg_json;
	
	sub start_vt_demo
	{
		my $demo_name = shift;
		my $dat_dir = 'dat';
		my $db_name = 'demo';
		dogg_json::new($dat_dir, $db_name);			
		my @bins = dogg_json::decode_table($db_name, 'bin');
		my @dats = dogg_json::decode_table($db_name, 'dat');
		my @repos = dogg_json::decode_table($db_name, 'repo');
		my @labels = dogg_json::decode_table($db_name, 'label');
		
		my $vt = '/usr/viewtouch/';
		my $vt_demo = $vt.'demo/';

			
		if($db_name ~~ @labels)
		{
			unless(-e "$vt_demo")
			{
				mkdir("$vt_demo") or dogg_log::write_error(__FILE__, __LINE__, 
					"Error:$!, cannot make directory");
			}
			
			chdir("$vt_demo") or dogg_log::write_error(__FILE__, __LINE__, 
				"Error:$!, cannot change directories");
						
			my $bin = 'bin_'.lcfirst($db_name);
			my $dat = 'dat_'.lcfirst($db_name);

			unless(-e $bin){ $x = 1; };
			unless(-e $dat){ $y = 1; };
			
			foreach my $repo (@repos)
			{
				system("git clone $repo");
				dogg_log::write_action(__FILE__, __LINE__, 
					"Action:$repo has been cloned!");
			}
		

			
			if(($bin ~~ @bins) and ($dat ~~ @dats))
			{
				my $arch_bin = $vt_demo.$bin.'archive/'; 
				unless(-e $arch_bin) { mkdir("$arch_bin"); }
				my $new_bin = $vt_demo.$bin;
				my $vt_bin = $vt.'bin/';
				

				my $arch_dat = $vt_demo.$dat.'archive/';
				unless(-e $arch_dat) { mkdir("$arch_dat"); }
				my $new_dat = $vt_demo.$dat;
				my $vt_dat = $vt.'dat/';
				
							
				chdir("/usr/viewtouch/") or dogg_log::write_error(__FILE__, __LINE__, 
					"Error:$!, could not change directory $bin");
				
				
				rename $vt_bin, $arch_bin;
				rename $vt_dat, $arch_dat;
				use File::Copy qw(copy);
				copy $new_bin, $vt_bin;
				copy $new_dat, $vt_dat;
				
				unless(-e $vt.'fonts/')
				{
					system('wget http://rrtpos.com/fonts.tar');
					
					if(-e $vt.'fonts.tar')
					{
						system('tar -zvf fonts.tar')
						unlink 'fonts.tar';
					
					}
					unless(-e $vt.'fonts.tar')
					{
						chdir("/");
						system('xset f+p /usr/viewtouch/fonts/');
					}
				}
						
				dogg_log::write_action(__FILE__, __LINE__, 
					"Action: Viewtouch is Ready to start!");
							
				return 1;
			}	
			else
			{
					print "Error:\n";
					dogg_log::write_error(__FILE__, __LINE__, 
						"Error: $bin was not found, viewtouch demo cannot be started
								and/or $dat was not found");
					return 0;
				
			}		
		}		
	}
}
1;
