#!/usr/bin/perl
use strict;
use warnings;

use Data::Dumper;

# hash that contains all the files we need to track as keys
# and timestamp of their last modifies as values
my $filenames = {
	'filewatcher.pl' => 1,
	'towatch' => 1
};

my $child = undef;
my $read_fh, my $write_fh;

my $callback = "echo Shla_sasha_po_shosse";


sub refreshTime {
	for (keys %$filenames) {
		$filenames->{$_} = (stat($_))[9];
	}
};

sub checkChanges {
	my ($callback) = @_;
	my $action_flag = 0;
	for (keys %$filenames) {
		my $modify = (stat($_))[9];
		$action_flag ||= ($filenames->{$_} != $modify);
	}
	if ($action_flag) {
		print "SMTHING CHANGED\n";
		refreshTime();
	};
	return $action_flag;
};

sub makeCallback {
	my ($callback) = @_;
	if (defined $child) {
		kill('KILL', $child);
	};
	if (defined $read_fh) {
		close $read_fh;
	};
	if (defined $write_fh) {
		close $write_fh;
	}
	pipe($read_fh, $write_fh);
	if ($child = fork) {
		close $write_fh;
		#open($read_fh, '>&', STDOUT);
		while (<$read_fh>) {
			print "FROM PIPE: $_";
			last;
		}
	} else {
		close $read_fh;
		select $write_fh;
		#open(STDOUT, '>', $write_fh);
		exec($callback);
	}
}

refreshTime();
while (1) {
	if (checkChanges()) {
		print "GOING TO CALLBACK\n";
		makeCallback($callback);
	}
	sleep 1;
};
print Dumper $filenames;
__END__
while (1) {
	@stat_arr = stat($filename);
	checkChanges("testcmnd");
	sleep 1;
}

