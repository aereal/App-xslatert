package t::App::xslatert;

use strict;
use warnings;
use parent qw( Test::App::xslatert::Class );

use Test::More;

sub _require : Tests {
  require_ok 'App::xslatert';
}

1;
