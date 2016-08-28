#!/usr/bin/perl

# This program rextracts a particular number of a specific type of publication
# from a source XML file, obtained from DBLP

# Check correct program usage
if (@ARGV < 3) {
	print "Usage: perl count_publications.sh <publication type> <amount> <source xml>\n";
	exit;
}

# Prepare variables
my $pubFlag = 0;
my $numPubs = 0;

# Open output file
my $outputfilename = "output.xml";
open(my $outputlines, '>', $outputfilename) or die "Could not open file '$filename' $!";

# Construct start and end tags for specified publication, provided
# as first argument
my $pubType = $ARGV[0];
my $startTag = '<' . $pubType . ' mdate.*';
my $endTag = '</' . $pubType . '>';

# Set limit to extract from second argument
my $pubLimit = $ARGV[1];

# Open file, provided as third argument
my $inputfilename = $ARGV[2];
open( my $inputlines, '<', $inputfilename ) or die "Can't open $inputfilename: $!";
while ( my $line = <$inputlines> ) {
	#chomp $line;

	if ($numPubs == $pubLimit) {
		last;
	}

	# Open tag for publication
	if (( $line =~ /^$startTag/ ) && ($numPubs < $pubLimit)) {
		print $outputlines $line;
		$pubFlag = 1;
	} 

	# Closing tag for publication
	elsif ( $line =~ /^$endTag/ ) {
		print $outputlines ($endTag . "\n");
		$pubFlag = 0;
		$numPubs = $numPubs + 1;
	}

	# Content from desired publication detected
	elsif ( $pubFlag ) {
		print $outputlines $line;
	}
}

# Close input file
close $inputlines;

# Close output file
close $outputlines;
