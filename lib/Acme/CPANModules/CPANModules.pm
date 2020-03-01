package Acme::CPANModules::CPANModules;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use Acme::CPANModulesUtil::Misc;

our $LIST = {
    summary => 'Modules related to Acme::CPANModules',
    description => <<'_',

## Specification

<pm:Acme::CPANModules> is the specification.


## CLIs

<pm:App::cpanmodules> distribution contains the `cpanmodules` CLI to view lists
and entries from the command-line.

<pm:App::lcpan::CmdBundle::cpanmodules> distribution provides `cpanmodules-*`
subcommands for <pm:App::lcpan> which, like `cpanmodules` CLI, lets you view
lists and entries from the command-line.

<pm:App::CPANModulesUtils> distribution contains more CLI utilities related to
Acme::CPANModules, e.g. `acme-cpanmodules-for` to find whether a module is
mentioned in some Acme::CPANModules::* modules.

<pm:App::CreateAcmeCPANModulesImportModules>

<pm:App::CreateAcmeCPANModulesImportCPANRatingsModules>


## Dist::Zilla (and Pod::Weaver)

If you develop CPAN modules with Dist::Zilla, you can use
<pm:Dist::Zilla::Plugin::Acme::CPANModules> and
<pm:Pod::Weaver::Plugin::Acme::CPANModules>. There is also
<pm:Dist::Zilla::Plugin::Acme::CPANModules::Blacklist> to prevent adding
blacklisted dependencies into your distribution.


## Other modules

<pm:Acme::CPANLists> is an older, deprecated specification.

<pm:Pod::From::Acme::CPANModules>


## Snippets

Acme::CPANModules::CPANModules contains this snippet to create entries by
extracting `<pm:...>` in the description:

    $LIST->{entries} = [
        map { +{module=>$_} }
            ($LIST->{description} =~ /<pm:(.+?)>/g)
    ];

This does not prevent duplicates. To do so:

    $LIST->{entries} = [
        map { +{module=>$_} }
            do { my %seen; grep { !$seen{$_}++ }
                 ($LIST->{description} =~ /<pm:(.+?)>/g)
             }
    ];

_
    'x.app.cpanmodules.show_entries' => 0,
};

Acme::CPANModulesUtil::Misc::populate_entries_from_module_links_in_description;

1;
# ABSTRACT:
