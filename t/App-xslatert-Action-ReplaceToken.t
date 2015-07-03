package t::App::xslatert::Action::ReplaceToken;

use strict;
use warnings;
use parent qw( Test::App::xslatert::Class );

use Test::More;

sub _require : Tests {
  my $pkg = __PACKAGE__ =~ s/^t:://r;
  require_ok $pkg;
  new_ok $pkg;
}

1;
