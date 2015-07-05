package t::App::xslatert::Action::ReplaceToken;

use strict;
use warnings;
use parent qw( Test::App::xslatert::Class );

use Test::App::xslatert::Utils;
use Test::Differences qw( eq_or_diff );
use Test::Fatal qw/ exception /;
use Test::More;

sub _require : Test(startup => 2) {
  my $pkg = __PACKAGE__;
  $pkg =~ s/^t:://;
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

sub run : Tests {
  my $parser = Text::Xslate::Parser->new;
  my $action = App::xslatert::Action::ReplaceToken->new(tx_parser => $parser);
  $action->add_document_by_path('t/assets/replace_token.before.tx');
  ok $action->source_document;
  my $result_document = $action->run('$n' => '$name');
  my $expected_content = asset_file('replace_token.after.tx');
  my $expected = $parser->parse($expected_content);
  eq_or_diff format_tx_document($result_document), format_tx_document($expected);
}

1;
