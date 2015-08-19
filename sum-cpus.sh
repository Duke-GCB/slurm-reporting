squeue --states=R --sort=N --format="%.7i %.9P %.8u %.5Q %.3C%.12m" \
	| perl -e '$n = 0; while (<>) { @flds = split(" ",$_); $n+=$flds[4] if $flds[4] ne "CPU"; } print "$n\n";'
