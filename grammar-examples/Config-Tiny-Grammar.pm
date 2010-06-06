grammar Config::Tiny::Grammar {
    token TOP {
        <root_section>?
        <section>+
    }
    token root_section {
        <property>+
    }
    token section {
        ^^ '[' \s* $<name>=<-[\n\]]>* \s* ']'  \n
        <property>*
    }
    token property {
        ^^ \n* \s* $<name>=<-[=]>* \s* '=' \s* $<value>=[\N*] \n
    }
}

my $text = Q{
[foo]
};

my $config = Config::Tiny::Grammar.parse($text);
say $config ?? 'yes' !! 'no';
say $config.perl;

