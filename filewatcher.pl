#!/usr/bin/perl
use strict;
use warnings;

use POSIX ":sys_wait_h";
use Data::Dumper;

# hash that contains all the files we need to track as keys
# and timestamp of their last modifies as values
my $filenames = {
	'filewatcher.pl' => 1,
	'towatch' => 1
};

my $child = undef;
my $read_fh, my $write_fh;

my $callback = "clear && echo -e 'Shla_sasha_po_shosse\n'";


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
		refreshTime();
	};
	return $action_flag;
};

sub makeCallback {
	my ($callback) = @_;
	if (defined $child) {
		kill('KILL', $child);
		while (waitpid(-1, WNOHANG) > 0){};
	};
	if ($child = fork) {
	} else {
		system($callback);
		kill('KILL', $$);
	}
}

refreshTime();
while (1) {
	if (checkChanges()) {
		makeCallback($callback);
	}
	sleep 1;
};
