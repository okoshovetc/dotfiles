use strict;
use warnings;

use Getopt::Long;

my $colors = {
	gray => 30, red => 31,
	green => 32, yellow => 33,
	blue => 34, violet => 35,
	lblue => 36, white => 37
};

my $fonts = {
	bold => '01', normal => '02',
	italic => '03', under => '04',
	normal2 => '05', highlight => '07',
	invisible => '08', cross => '09'
};

my $config_file = '';
my $call = '';
my $extra = '';
my $grep_cascade = '';

sub grep_append {
	my $curr = shift;
	if ($curr =~ m/(.*?);(.*?) (.*)/) {
		return " | GREP_COLOR='$fonts->{$1};$colors->{$2}' grep --line-buffered -P \"($3)?\" --color=always";
	} else {
		return " | grep -P \"($curr)?\"";
	}
};

GetOptions(
	'config=s' => \$config_file,
	'call=s' => \$call,
	'extra=s' => \$extra,
);

if ($config_file) {
	open (my $fh, '<', $config_file);
	while (<$fh>) {
		chomp;
		if (m/call: (.*)/) {
			$call ||= $1;
		} else {
			$grep_cascade .= grep_append($_);
		}
	}
}

$call ||= "echo 'The quick brown fox jumps over the lazy dog'";

while (my $curr = shift) {
	$grep_cascade .= grep_append($curr);	
}

if ($extra) {
	$grep_cascade .=  "| GREP_COLOR='07;32' grep --line-buffered -P \"($extra)?\" --color=always"
}

print $call . $grep_cascade, "\n";
system($call . $grep_cascade);