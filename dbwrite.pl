use strict;
use warnings;

sub new_db{
	print "\nNOTE: The DB may be truncated if the file exists.\n";
	print "Enter the new DB name: ";
	my $db = <STDIN>;
	chomp $db;
	open(my $fh, '>', $db) or die "Couldn't open new file.";
	
	print "Enter name: ";
	my $name = <STDIN>;
	chomp $name;
	print $fh $name;
	close $fh;
	print "Entry added.\n";
}

sub append_db{
	print "Enter the DB name: ";
	my $db = <STDIN>;
	chomp $db;
	open(my $fh, '>>', $db) or die "Couldn't open file.";
	print "Enter name: ";
	my $name = <STDIN>;
	chomp $name;
	print $fh "\n$name";
	close $fh;
	print "Entry added.\n";
}

sub read_db{
	print "Enter the name of DB: ";
	my $db = <STDIN>;
	chomp $db;
	open(my $fh, "<$db") or print "DB doesn't exist.";
	while(<$fh>){
		print "$_";
	}
}

my $filename = 'sampleDB.txt';
while(1){
	print "\n\nSelect one of the Options below:\n";
	print "1. Write a new DB.\n";
	print "2. Read from existing DB.\n";
	print "3. Append to the existing DB.\n";
	print "0. Exit\n";
	print "\nEnter your choice: ";

	my $userchoice = <STDIN>;
	chomp $userchoice;

	if ($userchoice eq "1"){
		new_db();
	}
	elsif ($userchoice eq "2"){
		read_db();
	}
	elsif ($userchoice eq "3"){
		append_db();
	}
	elsif ($userchoice eq "0"){
		last;
	}
}

print "Thank You!!\n";
