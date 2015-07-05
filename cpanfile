requires 'perl', '5.008001';

requires 'Clone';
requires 'Text::Xslate';
requires 'Text::Xslate::AST::Walker';

on 'test' => sub {
    requires 'Devel::Cover';
    requires 'Devel::Cover::Report::Coveralls';
    requires 'Test::Class';
    requires 'Test::Differences';
    requires 'Test::Fatal';
    requires 'Test::More', '0.98';
};

