#/usr/bin/env bash
function runone {
	local files=$(ls build/demos/*)
	local interval_print=$1
	local outdir=$2
	for file in $files:
	do
	    if [ -f "${file}" ] && [ -r "${file}" ] && [ -x "${file}" ]; then
		echo running $file
		local benchname=$(basename $file)
		mkdir -p $outdir/$benchname
		timeout 7200 perf stat -x, -a --append -o $outdir/$benchname/perf-output.csv --delay 3000 --interval-print $interval_print  -e r0CA3,r0283,r0480,r01C5 $file
		echo donewith  $file
	    else
		echo $file is not a command
	    fi
	done
}


outdir=$HOME/safeside-out-4pfc/
for interval in 1 4 16 64 256 1024 4096 16384
do
	echo $interval
	thisout=$outdir/interval_$interval/
	mkdir -p  $thisout
	runone $interval $thisout
done
