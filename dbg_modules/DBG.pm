package Olejik::DBG;

BEGIN {
	use base 'Exporter';
	our @EXPORT = qw(olog ologspace ologdelim ologdump owarn owarndump ocaller ocallerwarn ocallerlog);
}

use strict;
use warnings;

use Data::Dumper;
use Carp qw(cluck);

my $o_log_path = '/home/okoshovets/_/logs/custom';

sub olog {
	my $msg = shift // '';
	_rawWrite(_formMesage(sprintf("%s at %s:%d", $msg, (caller)[0,2])));
	return $msg;
}

sub ologspace {
	my $n = shift || 10;
	for (1..$n) {
		_rawWrite("\n");
	}
}

sub ologdelim {
	_rawWrite("**************************\n");
}

sub ologdump {
	my $dump = @_ > 1 ? Dumper(\@_) : Dumper(shift);
	chomp $dump;
	_rawWrite(_formMesage(sprintf("%s at %s:%d", $dump, (caller)[0,2])));
}

sub owarn {
	warn shift;
}

sub owarndump {
	oWarn(Dumper shift);
}

sub ocaller {
	my $msg = "\n";
	my $depth = shift;
	$depth = $depth ? $depth + 2 : 2;
	for (2..$depth) {
		my @calls = (caller($_))[0, 2, 3];
		if ($calls[0]) {
			$msg .= "[CALLER] In package $calls[0] sub $calls[2] at line $calls[1]\n";
		}
	}
	return $msg;
}

sub ocallerwarn {
	oWarn(oCaller(shift));
}

sub ocallerlog {
	_rawWrite(oCaller(shift));
}
sub _formMesage {
	return '[PERL] ' . (shift) . "\n";
}

sub _rawWrite {
	open (my $fh, '>>', $o_log_path) or die $!;
	print $fh shift;
	close $fh;
}

