#!perl

use Test::More;

use Net::RIR_CC;

my %data = (
  AU    => [ 'APNIC', 'AP' ],
  NZL   => [ 'APNIC', 'AP' ],
  KR    => [ 'APNIC', 'AP' ],
  THA   => [ 'APNIC', 'AP' ],
  US    => [ 'ARIN', 'AR' ],
  USA   => [ 'ARIN', 'AR' ],
  CA    => [ 'ARIN', 'AR' ],
  SE    => [ 'RIPE', 'RI' ],
  FR    => [ 'RIPE', 'RI' ],
  UK    => [ 'RIPE', 'RI' ],
  GB    => [ 'RIPE', 'RI' ],
  EU    => [ 'RIPE', 'RI' ],
  MX    => [ 'LACNIC', 'LA' ],
  CO    => [ 'LACNIC', 'LA' ],
  AR    => [ 'LACNIC', 'LA' ],
  DOM   => [ 'LACNIC', 'LA' ],
  EG    => [ 'AFRINIC', 'AF' ],
  MA    => [ 'AFRINIC', 'AF' ],
  ZA    => [ 'AFRINIC', 'AF' ],
);

my ($rc, $rir);

ok($rc = Net::RIR_CC->new, 'constructor ok: ' . $rc);

for my $code (keys %data) {
  ok($rir = $rc->get_rir($code), "get_rir for $code ok");
  is($rir->name, $data{$code}->[0], 'RIR name ok: ' . $rir->name);
  is($rir->code, $data{$code}->[1], 'RIR code ok: ' . $rir->code);
  ok($rir->whois_server, 'RIR whois_server is set: ' . $rir->whois_server);
}

done_testing;

