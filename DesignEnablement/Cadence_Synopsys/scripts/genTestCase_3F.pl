#! /usr/bin/perl

use strict 'vars';
use strict 'refs';
use strict 'subs';

use POSIX;

use Cwd;

### Revision History : Ver 1.0 #####
# 2019-03-18 Test Case Generator
### Pre-processing ########################################################
my $ARGC        = @ARGV;
my $workdir     = getcwd();
my $outdir      = "$workdir/pinLayouts";
my $infile      = "";

my @mapTrack = ([1,1], [2,1], [3,1], [4,2], [5,2], [6,3], [7,3]);  # Horizontal Track Mapping

sub getTrack{
	my $track = @_[0];
	my $nTrack = -1;
	for my $i(0 .. $#mapTrack){
		if($mapTrack[$i][0] == $track){
			$nTrack = $mapTrack[$i][1];
		}
	}
	if($nTrack == -1){
		print "[ERROR] Track Matching Failed. Input Track => $track\n";
		exit(-1);
	}
	return $nTrack;
}

my %h_mapTrack = ();
for my $i(0 .. $#mapTrack){
	$h_mapTrack{$mapTrack[$i][1]} = 1;
}

my $sizeOffset = 0;
if ($ARGC != 2) {
    print "\n*** Error:: Wrong CMD";
    print "\n   [USAGE]: ./PL_FILE [inputfile_spfile] [numTrackV Offset]\n\n";
    exit(-1);
} else {
    $infile             = $ARGV[0];
    $sizeOffset         = $ARGV[1];
}

if (!-e "./$infile") {
    print "\n*** Error:: FILE DOES NOT EXIST..\n";
    print "***         $workdir/$infile\n\n";
    exit(-1);
} else {
    print "\n";
    print "a   Version Info : 1.0 Initial Version\n";
    print "a   Generating TestCase pinLayout based on the following files.\n";
    print "a     Input Circuit :  $workdir/$infile\n";
}

### Output Directory Creation, please see the following reference:
system "mkdir -p $outdir";

my $outfile     = "";


my $designName = "";

my @ext_pins = ();
my @ext_powerpins = ();
my @pins = ();
my @nets = ();
my @inst = ();

my %h_inst = ();
my %h_nets = ();
my %h_name_nets = ();
my %h_nets_source = ();
my %h_pintype = ();
my %h_netcnt = ();
my %h_pinmatch = ();

my $idx_inst = 0;
my $idx_net = 0;
my $idx_pin = 0;

my $sizeNMOS = 0;
my $sizePMOS = 0;

my $numPTrackH = 3;
my $numTrackH = 3.5;
my $numClip = 2;

### Read Inputfile and Build Data Structure
open (my $in, "./$infile");
while (<$in>) {
    my $line = $_;
    chomp($line);

    ### Status of Input File
    if ($line =~ /\.SUBCKT (\S+)/) {
		$outfile     = "";
		$designName = "";
		@ext_pins = ();
		@ext_powerpins = ();
		@pins = ();
		@nets = ();
		@inst = ();
		%h_inst = ();
		%h_nets = ();
		%h_nets_source = ();
		%h_name_nets = ();
		%h_pintype = ();
		%h_netcnt = ();
		%h_pinmatch = ();
		$idx_inst = 0;
		$idx_net = 0;
		$idx_pin = 0;
		$sizeNMOS = 0;
		$sizePMOS = 0;
		$designName = $1;

		$designName =~ s/_ASAP7_75t_R//g;
		print "a     Cell Design Name :    $designName\n";
		$outfile     = "$outdir/".(split /\./, (split /\//, $designName)[$#_])[0].".pinLayout";
    } 
    elsif ($line =~ /\.PININFO/) {
		my @tmp_arr = ();
		@tmp_arr = split /\s+/, $line;
		for my $i(1 .. $#tmp_arr){
			my $pinType = "";
			my $pinName = "";
			if ($tmp_arr[$i] =~ /(\S+):(\S+)/){
				$pinName = $1;
				$pinType = $2;
				if($pinType eq "I" || $pinType eq "O" || ($pinType eq "B" && $pinName eq "VDD") || ($pinType eq "B" && $pinName eq "VSS")){
					print "a     External Pin Info : $pinName [".(($pinType eq "I")?"Input":(($pinType eq "O")?"Output":(($pinType eq "P")?"Power":"Ground")))."]\n";
					# @ext_pins = (pinName, pinType)
					if($pinType eq "B"){
						$pinType = "P";
					}
					
					$h_pintype{$pinName} = $pinType;	
					if($pinType eq "I" || $pinType eq "O"){
						push(@ext_pins, [($pinName, $pinType)]);
					}
					else{
						push(@ext_powerpins, [($pinName, $pinType)]);
					}
				}
			}	
		}
    }
    elsif ($line =~ /^(MM\d+) (\S+) (\S+) (\S+) (\S+) (\S+) w=(\S+) l=(\S+) nfin=(\d+)/) {
		my $inst = $1;
		my $instID = $1;
		my $net_s = $4;
		my $net_g = $3;
		my $net_d = $2;
		my $instType = ($6 eq "nmos_rvt")?"NMOS":"PMOS";
		my $nFin = $9;

		if(!exists($h_inst{$instID})){
			# @inst = (instID, Type, Width)
			push(@inst, [($instID, $instType, $nFin)]);
			print "Inst => ID:$1, Type:$instType, Width:$nFin -> ".$nFin."\n";
			$h_inst{$instID} = $idx_inst;
			$idx_inst++;
		}
		else{
			# update width
			$inst[$h_inst{$instID}][2] += $nFin;
		}
		if(!exists($h_nets{$net_s})){
			# @nets = (netID, N-pinNet, PinList)
			push(@nets, [($idx_net, 0, "")]);
			$h_nets{$net_s} = $idx_net;
			$h_name_nets{$idx_net} = $net_s;
			$idx_net++;
		}
		if(!exists($h_nets{$net_g})){
			# @nets = (netID, N-pinNet, PinList)
			push(@nets, [($idx_net, 0, "")]);
			$h_nets{$net_g} = $idx_net;
			$h_name_nets{$idx_net} = $net_g;
			$idx_net++;
		}
		if(!exists($h_nets{$net_d})){
			# @nets = (netID, N-pinNet, PinList)
			push(@nets, [($idx_net, 0, "")]);
			$h_nets{$net_d} = $idx_net;
			$h_name_nets{$idx_net} = $net_d;
			$idx_net++;
		}
		if($instType eq "PMOS"){
			if(!exists($h_netcnt{"P_$h_nets{$net_s}"})){
				$h_netcnt{"P_$h_nets{$net_s}"} = 1;
				print "$net_s P_$h_nets{$net_s} $h_netcnt{\"P_$h_nets{$net_s}\"}\n";
			}
			else{
				$h_netcnt{"P_$h_nets{$net_s}"} += 1;
				print "$net_s P_$h_nets{$net_s} $h_netcnt{\"P_$h_nets{$net_s}\"}\n";
			}
			if(!exists($h_netcnt{"P_$h_nets{$net_d}"})){
				$h_netcnt{"P_$h_nets{$net_d}"} = 1;
				print "$net_d P_$h_nets{$net_d} $h_netcnt{\"P_$h_nets{$net_d}\"}\n";
			}
			else{
				$h_netcnt{"P_$h_nets{$net_d}"} += 1;
				print "$net_d P_$h_nets{$net_d} $h_netcnt{\"P_$h_nets{$net_d}\"}\n";
			}
		}
		else{
			if(!exists($h_netcnt{"N_$h_nets{$net_s}"})){
				$h_netcnt{"N_$h_nets{$net_s}"} = 1;
				print "$net_s N_$h_nets{$net_s} $h_netcnt{\"N_$h_nets{$net_s}\"}\n";
			}
			else{
				$h_netcnt{"N_$h_nets{$net_s}"} += 1;
				print "$net_s N_$h_nets{$net_s} $h_netcnt{\"N_$h_nets{$net_s}\"}\n";
			}
			if(!exists($h_netcnt{"N_$h_nets{$net_d}"})){
				$h_netcnt{"N_$h_nets{$net_d}"} = 1;
				print "$net_d N_$h_nets{$net_d} $h_netcnt{\"N_$h_nets{$net_d}\"}\n";
			}
			else{
				$h_netcnt{"N_$h_nets{$net_d}"} += 1;
				print "$net_d N_$h_nets{$net_d} $h_netcnt{\"N_$h_nets{$net_d}\"}\n";
			}
		}

		my $isSource = 0;
		if(!exists($h_nets_source{$net_s})){
			$isSource = 1;
			$h_nets_source{$net_s} = $idx_pin;
		}
		# @pins = (pinID, netID, instID, pinName, pinDirection, pinLength)
		push(@pins, [($idx_pin, (exists($h_nets{$net_s})?$h_nets{$net_s}:$idx_net), $instID, "S", ($isSource==1?"s":"t"), $inst[$h_inst{$1}][2] )]);
		# update net info
		$nets[$h_nets{$net_s}][1] = $nets[$h_nets{$net_s}][1] + 1;
		$nets[$h_nets{$net_s}][2] = $isSource==1?(($nets[$h_nets{$net_s}][2] eq ""?"":" ").$nets[$h_nets{$net_s}][2]."pin$idx_pin"):("pin$idx_pin ".$nets[$h_nets{$net_s}][2]);
		my $idx_pin_s = $idx_pin;
		$idx_pin++;
		$isSource = 0;
		if(!exists($h_nets_source{$net_g})){
			$isSource = 1;
			$h_nets_source{$net_g} = $idx_pin;
		}
		# @pins = (pinID, netID, instID, pinName, pinDirection, pinLength)
		push(@pins, [($idx_pin, (exists($h_nets{$net_g})?$h_nets{$net_g}:$idx_net), $instID, "G", ($isSource==1?"s":"t"), $inst[$h_inst{$1}][2] )]);
		# update net info
		$nets[$h_nets{$net_g}][1] = $nets[$h_nets{$net_g}][1] + 1;
		$nets[$h_nets{$net_g}][2] = $isSource==1?(($nets[$h_nets{$net_g}][2] eq ""?"":" ").$nets[$h_nets{$net_g}][2]."pin$idx_pin"):("pin$idx_pin ".$nets[$h_nets{$net_g}][2]);
		$idx_pin++;
		$isSource = 0;
		if(!exists($h_nets_source{$net_d})){
			$isSource = 1;
			$h_nets_source{$net_d} = $idx_pin;
		}
		# @pins = (pinID, netID, instID, pinName, pinDirection, pinLength)
		push(@pins, [($idx_pin, (exists($h_nets{$net_d})?$h_nets{$net_d}:$idx_net), $instID, "D", ($isSource==1?"s":"t"), $inst[$h_inst{$1}][2] )]);
		# update net info
		$nets[$h_nets{$net_d}][1] = $nets[$h_nets{$net_d}][1] + 1;
		$nets[$h_nets{$net_d}][2] = $isSource==1?(($nets[$h_nets{$net_d}][2] eq ""?"":" ").$nets[$h_nets{$net_d}][2]."pin$idx_pin"):("pin$idx_pin ".$nets[$h_nets{$net_d}][2]);
		$h_pinmatch{$idx_pin_s} = $idx_pin;
		$h_pinmatch{$idx_pin} = $idx_pin_s;
		$idx_pin++;
	}
    elsif ($line =~ /\.ENDS/) {
		foreach my $key(keys %h_netcnt){
			print "$key => $h_netcnt{$key}\n";
		}
		# Add External Pins
		# @ext_powerpins = (pinName, pinType)
		for my $i(0 .. $#ext_powerpins){
			# @pins = (pinID, netID, instID, pinName, pinDirection, pinLength)
			push(@pins, [($idx_pin, $h_nets{$ext_powerpins[$i][0]}, "ext", $ext_powerpins[$i][0], "t", "-1")]);
			# update net info
			$nets[$h_nets{$ext_powerpins[$i][0]}][1] = $nets[$h_nets{$ext_powerpins[$i][0]}][1] + 1;
			$nets[$h_nets{$ext_powerpins[$i][0]}][2] = ("pin$idx_pin ".$nets[$h_nets{$ext_powerpins[$i][0]}][2]);
			$idx_pin++;
		}
		# @ext_pins = (pinName, pinType)
		for my $i(0 .. $#ext_pins){
			# @pins = (pinID, netID, instID, pinName, pinDirection, pinLength)
			push(@pins, [($idx_pin, $h_nets{$ext_pins[$i][0]}, "ext", $ext_pins[$i][0], "t", "-1")]);
			# update net info
			$nets[$h_nets{$ext_pins[$i][0]}][1] = $nets[$h_nets{$ext_pins[$i][0]}][1] + 1;
			$nets[$h_nets{$ext_pins[$i][0]}][2] = ("pin$idx_pin ".$nets[$h_nets{$ext_pins[$i][0]}][2]);
			$idx_pin++;
		}
		for my $i(0 .. $#inst){
			print "a     Instance Info : ID => $inst[$i][0], Type => $inst[$i][1], Width => $inst[$i][2]\n";
			if($inst[$i][1] eq "NMOS"){
				$sizeNMOS = $sizeNMOS + 2*ceil($inst[$i][2]/$numPTrackH) + 1;
				print "$sizeNMOS\n";
			}
			else{
				$sizePMOS = $sizePMOS + 2*ceil($inst[$i][2]/$numPTrackH) + 1;
			}
		}
		$sizeNMOS += $sizeOffset;
		$sizePMOS += $sizeOffset;
		my %h_touchedpin = ();
		for my $i(0 .. $#pins){
			if($pins[$i][2] ne "ext" && $pins[$i][3] ne "G" && !exists($h_touchedpin{$pins[$i][0]})){
				my $instType = $inst[$h_inst{$pins[$i][2]}][1];
				my $prefix_type = "";
				if($instType eq "PMOS"){
					$prefix_type = "P";
				}
				else{
					$prefix_type = "N";
				}
				my $numCon_cur = $h_netcnt{"$prefix_type\_$pins[$i][1]"};
				my $numCon_match = $h_netcnt{"$prefix_type\_$pins[$h_pinmatch{$pins[$i][0]}][1]"};

				if($h_pintype{$h_name_nets{$pins[$i][1]}} eq "P"){
					$numCon_cur = 1;
				}
				elsif($h_pintype{$h_name_nets{$pins[$h_pinmatch{$pins[$i][0]}][1]}} eq "P"){
					$numCon_match = 1;
				}

				print "$pins[$i][0] $pins[$i][3] $h_pintype{$pins[$i][1]} $numCon_cur vs $pins[$h_pinmatch{$pins[$i][0]}][0] $pins[$h_pinmatch{$pins[$i][0]}][1] $h_pintype{$pins[$h_pinmatch{$pins[$i][0]}][3]} $numCon_match\n";

				if($pins[$i][3] eq "S" && $numCon_cur < $numCon_match){
					$pins[$i][3] = "D";
					$pins[$h_pinmatch{$pins[$i][0]}][3] = "S";
				}
				elsif($pins[$i][3] eq "D" && $numCon_cur > $numCon_match){
					$pins[$i][3] = "S";
					$pins[$h_pinmatch{$pins[$i][0]}][3] = "D";
				}
				elsif($numCon_cur == $numCon_match){
					if($h_pintype{$h_name_nets{$pins[$i][1]}} eq "P"){
						$pins[$i][3] = "S";
						$pins[$h_pinmatch{$pins[$i][0]}][3] = "D";
					}
					elsif($h_pintype{$h_name_nets{$pins[$h_pinmatch{$pins[$i][0]}][1]}} eq "P"){
						$pins[$i][3] = "D";
						$pins[$h_pinmatch{$pins[$i][0]}][3] = "S";
					}
				}
				$h_touchedpin{$pins[$i][0]} = 1;
				$h_touchedpin{$h_pinmatch{$pins[$i][0]}} = 1;
			}
			if($pins[$i][2] ne "ext"){
				print "a     Pin Info : ID => $pins[$i][0], NetID => $pins[$i][1]($nets[$pins[$i][1]][1]PinNet), InstID => $pins[$i][2], PinName => $pins[$i][3], Direction => $pins[$i][4]\n";
			}
			else{
				print "a     Pin Info : ID => $pins[$i][0], NetID => $pins[$i][1]($nets[$pins[$i][1]][1]PinNet), InstID => $pins[$i][2], PinName => $pins[$i][3], Direction => $pins[$i][4], Type => $h_pintype{$pins[$i][3]}\n";
			}
		}
		for my $i(0 .. $#nets){
			print "a     Net Info : ID => $nets[$i][0], #Pin => $nets[$i][1], PinList => $nets[$i][2]\n";
		}
		if($sizeNMOS %2 == 0){
			$sizeNMOS++;
		}
		if($sizePMOS %2 == 0){
			$sizePMOS++;
		}
		### Write PinLayout
		print "a   Write PinLayout\n";
		print "a     Width of Routing Clip    = ".($sizeNMOS>$sizePMOS?$sizeNMOS:$sizePMOS)."\n";
		print "a     Height of Routing Clip   = $numClip\n";
		print "a     Tracks per Placement Row = $numTrackH\n";
		print "a     Width of Placement Clip  = ".($sizeNMOS>$sizePMOS?$sizeNMOS:$sizePMOS)."\n";
		print "a     Tracks per Placement Clip = $numPTrackH\n";
		open (my $out, '>', $outfile);
		print $out "a   PNR Testcase Generation::  DesignName = $designName\n";
		print $out "a   Output File:\n";
		print $out "a   $outfile\n";
		print $out "a   Width of Routing Clip    = ".($sizeNMOS>$sizePMOS?$sizeNMOS:$sizePMOS)."\n";
		print $out "a   Height of Routing Clip   = $numClip\n";
		print $out "a   Tracks per Placement Row = $numTrackH\n";
		print $out "a   Width of Placement Clip  = ".($sizeNMOS>$sizePMOS?$sizeNMOS:$sizePMOS)."\n";
		print $out "a   Tracks per Placement Clip = $numPTrackH\n";
		print $out "i   ===InstanceInfo===\n";
		print $out "i   InstID Type Width\n";
		for my $i(0 .. $#inst){
			if($inst[$i][1] eq "PMOS"){
				print $out "i   ins$inst[$i][0] $inst[$i][1] $inst[$i][2]\n";
			}
		}
		for my $i(0 .. $#inst){
			if($inst[$i][1] eq "NMOS"){
				print $out "i   ins$inst[$i][0] $inst[$i][1] $inst[$i][2]\n";
			}
		}
		print $out "i   ===PinInfo===\n";
		print $out "i   PinID NetID InstID PinName PinDirection PinLength\n";
		for my $i(0 .. $#pins){
			if($pins[$i][2] ne "ext"){
				print $out "i   pin$pins[$i][0] net$pins[$i][1] ".($pins[$i][2] eq "ext"?"ext":"ins".$pins[$i][2])." $pins[$i][3] $pins[$i][4] $pins[$i][5]\n";
			}
			else{
				print $out "i   pin$pins[$i][0] net$pins[$i][1] ".($pins[$i][2] eq "ext"?"ext":"ins".$pins[$i][2])." $pins[$i][3] $pins[$i][4] $pins[$i][5] $h_pintype{$pins[$i][3]}\n";
			}
		}
		print $out "i   ===NetInfo===\n";
		print $out "i   NetID N-PinNet PinList\n";
		for my $i(0 .. $#nets){
			print $out "i   net$nets[$i][0] $nets[$i][1]PinNet $nets[$i][2]\n";
		}
		close ($out);
		print "a   Test Case Generation Complete!!\n";
		print "a   PinLayout FILE: $outfile\n\n";
	}
}
