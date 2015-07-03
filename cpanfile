requires 'perl', '5.008001';

requires 'Text::Xslate';

on 'test' => sub {
    requires 'Devel::Cover';
    requires 'Devel::Cover::Report::Coveralls';
    requires 'Test::Class';
    requires 'Test::Fatal';
    requires 'Test::More', '0.98';
};

