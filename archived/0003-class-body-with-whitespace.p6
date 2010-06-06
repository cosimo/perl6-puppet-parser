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
    token class_body {
        \w+
    }
}

my $text = "class foo \{\nbar\n\}\n";
my $parsed = Puppet::Parser::Grammar.parse($text);

say $parsed ?? 'yes' !! 'no';
say $parsed.perl;

