#!/usr/bin/perl

use DBI;

$db = DBI->connect( "dbi:SQLite:data.dbl" ) || die "Cannot connect: $DBI::errstr";

$dbh->do( "CREATE TABLE users ( first_name, last_name, home )" );
   $dbh->do( "INSERT INTO users VALUES ( 'Rose', 'Tyler', 'Earth' ) " );
   $dbh->do( "INSERT INTO users VALUES ( 'Zoe', 'Heriot', 'Space Station W3' ) " );
   $dbh->do( "INSERT INTO users VALUES ( 'Jo', 'Grant', 'Earth' ) " );
   $dbh->do( "INSERT INTO users VALUES ( 'Leela', null, 'Unspecified' ) " );
   $dbh->do( "INSERT INTO users VALUES ( 'Romana', null, 'Gallifrey' ) " );
   $dbh->do( "INSERT INTO users VALUES ( 'Clara', 'Oswald', 'Earth' ) " );
   $dbh->do( "INSERT INTO users VALUES ( 'Adric', null, 'Alzarius' ) " );
   $dbh->do( "INSERT INTO users VALUES ( 'Susan', 'Foreman', 'Gallifrey' ) " );

   $data = $db->selectall_arrayref( q( SELECT first_name, last_name, home
                                           FROM users) );
   foreach( @$data ) {
    foreach $x (0..$#$_) {
       print "$_->[$x] "
       }
    print "\n";

   }

   $db->disconnect;
