#!/usr/bin/perl
use strict;
use warnings;

use POSIX ":sys_wait_h";
use Data::Dumper;
use Getopt::Long;

# hash that contains all the files we need to track as keys
# and timestamp of their last modifies as values

my $filenames = {};
my $callback = '';
my $config_file = '';
my $child = undef;

GetOptions(
	'config=s' => \$config_file,
	'call=s' => \$callback
);

if ($config_file) {
	open (my $fh, '<', $config_file);
	while (<$fh>) {
		if (m/^callback: (.*)/) {
			$callback ||= $1;
		} else {
			chomp;
			$filenames->{$_} = 1;
		}
	}
}

$callback ||= "echo 'The big brown fox jumps over the lazy dog'";

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
