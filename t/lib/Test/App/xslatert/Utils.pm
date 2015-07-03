package Test::App::xslatert::Utils;

use strict;
use warnings;

use Carp qw/ croak /;
use Exporter 'import';
use IO::File;

our @EXPORT = qw/
  asset_file
  format_tx_document
  format_tx_node
/;

sub asset_file {
  my ($basename) = @_;
  my $qualified = "t/assets/$basename";
  my $fh = IO::File->new($qualified, 'r')
    or croak "Cannot open $qualified: $!";
  my $content = <$fh>;
  return $content;
}

sub format_tx_document {
  my ($document) = @_;
  return [ map { format_tx_node($_) } @$document ];
}

sub format_tx_node {
  my ($node) = @_;
  return +{

    (map {
      my $name = $_;
      my $nodes = $node->$_ // [];
      ( $name => [ map { format_tx_node($_) } @$nodes ] );
    } qw/ first second third / ),

    (map { ($_ => $node->$_) } qw/ id value /),
  };
}

1;
