files=build/demos/*
interval_print=$1
outdir=$2
for file in $files:
do
    if [ -f "${file}" ] && [ -r "${file}" ] && [ -x "${file}" ]; then
        echo running $file
        benchname=$(basename $file)
        mkdir -p $outddir/$benchname
        timeout 7200 perf stat -x, -a --append -o $outdir/$benchname/perf-output.csv --delay 3000 --interval-print $interval_print  -e cycles,r0248,r0480,r0CA3,r40D1,r8889,r0283,r3824,r010D,r01C5,r8189,rF824 $file
        echo donewith  $file
    else
        echo $file is not a command
    fi
done
