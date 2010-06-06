grammar Puppet::Parser::Grammar {
    token TOP {
        <class>?
    }
    token class {
        'class' <.ws> '{' <.ws> <class_body> <.ws> '}'
    }
    token class_body {
        'ahaha'
    }
}

my $text = 'class { ahaha }';
my $parsed = Puppet::Parser::Grammar.parse($text);

say $parsed ?? 'yes' !! 'no';
say $parsed.perl;

