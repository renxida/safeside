outdir=$HOME/safeside-out/
for interval in 1 4 16 64 256 1024 4096 16384
do
	echo $interval
	thisout=$outdir/interval_$interval/
	mkdir -p  $thisout
	./run00_all_demos.sh $interval $thisout
done
