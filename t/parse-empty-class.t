use v6;
use Test;
use Puppet::Parser;

#sub test_parsing($module, $parse_output, $description = 'Parsing succeeded') {
#    my $match = Puppet::Parser.parse($input);
#    is_deeply Puppet::Parser.parse($input), $parse_output, $description;
#    }
#}

is_deeply(
    # WTF? How comes this works? It's highly magic!
    Puppet::Parser.parse(''), (),
    'Empty class declaration is parsed'
);

#diag(Puppet::Parser.parse('').perl);

ok(
    ! Puppet::Parser.parse('class { }'),
    'Class without identifier should not parse'
);

ok(
    Puppet::Parser.parse("class foo \{\nbar\n\}\n"),
    'Simple class with name and body should be ok'
);

done_testing;

# vim:ft=perl6
