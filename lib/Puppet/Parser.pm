#
# Puppet::Parser module
#

grammar Puppet::Parser::Grammar {
    token TOP {
        <class>?
    }
    token class {
        'class' <.ws> <identifier> <.ws> '{' <.ws> <class_body> <.ws> '}'
    }
    token identifier {
        \w+
    }
    token class_body {
        \w+
    }
}

class Puppet::Parser {

    method parse ($text = '') {

        if ! $text {
            return
        }

        Puppet::Parser::Grammar.parse($text)
            or die "Sorry, cannot parse";

        my @classes = $<class>;
        return @classes;
    }

    method parse_file($filename) {
        return self.parse( slurp($filename) );
    }

}

