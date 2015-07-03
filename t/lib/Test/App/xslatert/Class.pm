package Test::App::xslatert::Class;

use strict;
use warnings;

use parent qw( Test::Class );

END {
  __PACKAGE__->runtests;
}

1;
