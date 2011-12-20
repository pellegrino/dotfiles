## Put me in ~/.irssi/scripts, and then execute the following in irssi:
##
##       /load perl
##       /script load notifier-minivan
##

use strict;
use Irssi;
use vars qw($VERSION %IRSSI);
use HTML::Entities;
use IPC::Message::Minivan;

$VERSION = "0.01";
%IRSSI = (
    authors     => 'Allan Willems Joergensen',
    origauthors => 'Luke Macken, Paul W. Frields, Jared Quinn, Anton Berezin, Kristoffer Larsen',
    contact     => 'allan@nowhere,dk',
    name        => 'notifier-minivan.pl',
    description => 'Alert the user of new messages or hilights through IPC::Message::Minivan',
    license     => 'Beerware',
    url         => 'http://www.nowhere.dk/articles/irssi-notifications-minivan',
);

# Default settings in Irssi
Irssi::settings_add_str('notifier','minivan_host', 'localhost');
Irssi::settings_add_str('notifier','minivan_port', 6826);
Irssi::settings_add_str('notifier','minivan_channel','#irssi');

# Fetch settings from Irssi
my $minivan_host = Irssi::settings_get_str('minivan_host');
my $minivan_port = Irssi::settings_get_str('minivan_port');
my $minivan_channel = Irssi::settings_get_str('minivan_channel');

# Connect to the Minivan
our $van = IPC::Message::Minivan->new(host => $minivan_host, port => $minivan_port);

sub notify {
    my ($server, $summary, $message) = @_;

    # Encode certain characters using HTML
    my $safemsg = HTML::Entities::encode($message, '<>&"');

    # Load everyone into the minivan
    $van->msg($minivan_channel, {summary => $summary, msg => $safemsg});
}

sub print_text_notify {
    my ($dest, $text, $stripped) = @_;
    my $server = $dest->{server};
    return if (!$server || !($dest->{level} & MSGLEVEL_HILIGHT));
    my $sender = $stripped;
    $sender =~ s/^\<.([^\>]+)\>.+/\1/ ;
    $stripped =~ s/^\<.[^\>]+\>.// ;
    my $summary = "Hilite in " . $dest->{target};
    notify($server, $summary, $stripped);
}


sub message_private_notify {
    my ($server, $msg, $nick, $address) = @_;
    return if (!$server);
    notify($server, "Private message from ".$nick, $msg);
}

sub dcc_request_notify {
    my ($dcc, $sendaddr) = @_;
    my $server = $dcc->{server};

    return if (!$dcc);
    notify($server, "DCC ".$dcc->{type}." request", $dcc->{nick});
}

sub notify_test {
        notify('localhost', 'Test from Irssi', 'This is a test of Minivan notifications');
}

Irssi::command_bind('minivan-test', 'notify_test');

Irssi::signal_add('print text', 'print_text_notify');
Irssi::signal_add('message private', 'message_private_notify');
Irssi::signal_add('dcc request', 'dcc_request_notify');
