files=build/demos/*
for file in $files
do
    if [ -f "${file}" ] && [ -r "${file}" ] && [ -x "${file}" ]; then
        echo running $file
        benchname=$(basename $file)
        mkdir -p /home/xr5ry/benchtaker/safeside-out/$benchname
        timeout 1800 perf stat -x, -a --append -o /home/xr5ry/benchtaker/safeside-out/$benchname/perf-output.csv --delay 3000 --interval-print 2000  -e cycles,r0248,r0480,r0CA3,r40D1,r8889,r0283,r3824,r010D,r01C5,r8189,rF824 $file
        echo donewith  $file
    else
        echo $file is not a command
    fi
done
