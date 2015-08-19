squeue --states=R --sort=N --format="%.7i %.9P %.8u %.5Q %.3C%.12m" \
	| perl -e '$n = 0; $n1 = 0; while (<>) { @flds = split(" ",$_); next  if $flds[5] eq "MIN_MEMORY"; $flds[5] =~ s/(\d)K/${1}000/; $n += $flds[5]; $n1 += $flds[4] * $flds[5];} print "$n\n$n1\n";'
