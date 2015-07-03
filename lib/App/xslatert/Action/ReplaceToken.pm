package App::xslatert::Action::ReplaceToken;

use strict;
use warnings;

use Carp qw/ croak /;
use IO::File;
use Text::Xslate::Parser;

sub new {
  my ($class, %args) = @_;
  my $parser = $args{tx_parser}
    or croak '|tx_parser| required';
  my $self = bless {
    parser => $parser,
    source_document => undef,
  }, $class;
  return $self;
}

sub parser {
  my ($self) = @_;
  return $self->{parser};
}

sub source_document {
  my ($self) = @_;
  return $self->{source_document};
}

sub add_document_by_path {
  my ($self, $path) = @_;
  my $fh = IO::File->new($path, 'r')
    or croak "Cannot open $path: $!";
  my $content = <$fh>;
  my $doc = $self->parser->parse($content);
  $self->{source_document} = $doc;
  return;
}

1;
