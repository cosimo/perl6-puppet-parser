grammar Puppet::Parser::Grammar {
    token TOP {
        <class>?
    }

    token class {
        'class' <.ws> <identifier> <.ws> '{' <.ws> <class_body> <.ws> '}'
    }

    regex identifier {
        \w+
    }

    # class_body as \N+ doesn't work! Why???
    token class_body {
        \w+
    }
}

my $text = 'class foo { bar }';
my $parsed = Puppet::Parser::Grammar.parse($text);

say $parsed ?? 'yes' !! 'no';
say $parsed.perl;

