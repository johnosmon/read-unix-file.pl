#!/usr/bin/perl

#  A template to read "unix-style" files
#
#   ignores comment lines (starting with "#")
#   ignores whitespace only files
#   concatinates lines if the previous line ended with a "\"


use Getopt::Std;

#  Deal with command line options

if (!getopts('f:h')  or $opt_h)
   {
   &usage;
   exit 1;
   }

$infile   = $opt_f if ($opt_f);


############################################################
# usage - how to use this utility
#
sub usage
   {
   print "-------->You really need to fix this<--------\n";
   }


############################################################
# begin Main
#
#
# Setup input and output file handles
if ($infile)
   {
   open(IN, "<$infile") || die "Couldn't open $infile for input\n";
   }
else
   {
   open (IN, "<&STDIN")
   }


#  Process the input file until it is done
while ( <IN> )
   {
   chomp; 				# get rid of linefeed
   next if ((/^\s*#/) or /^\s?$/ );	# whitespace and comments ignored
   s/^\s*//;				# strip leading whitespace
   s/\s*$//;				# strip trailing whitespace
   if ((s/\\$//) and (! eof (IN)))	# line continues a
      {
      $tmpLine .= $_;			# add current input to tmp
      next;				# and get another line
      }
   else
     {
     $dataLine = $tmpLine . $_;		# build up the data line
     $tmpLine = "";			# reset tmpLine
     }
   
   #
   #  do what you want with the data....
   print "-->Data:  $dataLine\n";

   }  # END of file input


exit(0);

