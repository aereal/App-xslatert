requires 'perl', '5.008001';

on 'test' => sub {
    requires 'Devel::Cover';
    requires 'Test::Class';
    requires 'Test::More', '0.98';
};

