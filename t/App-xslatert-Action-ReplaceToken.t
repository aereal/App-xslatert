package t::App::xslatert::Action::ReplaceToken;

use strict;
use warnings;
use parent qw( Test::App::xslatert::Class );

use Test::Fatal qw/ exception /;
use Test::More;

sub _require : Test(startup => 2) {
  my $pkg = __PACKAGE__ =~ s/^t:://r;
  require_ok $pkg;
  new_ok $pkg, [ tx_parser => Text::Xslate::Parser->new ];
}

sub add_document_by_path : Tests {
  subtest 'readable path' => sub {
    my $action = App::xslatert::Action::ReplaceToken->new(tx_parser => Text::Xslate::Parser->new);
    my $e = exception { $action->add_document_by_path('t/assets/replace_token.before.tx') };
    is $e, undef;
    ok $action->source_document;
  };
  subtest 'not readable path' => sub {
    my $action = App::xslatert::Action::ReplaceToken->new(tx_parser => Text::Xslate::Parser->new);
    my $e = exception { $action->add_document_by_path('t/assets/missing.tx') };
    like $e, qr/Cannot open/;
  };
}

1;
