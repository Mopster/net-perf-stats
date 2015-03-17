BEGIN { printf("%10s ;%10s ;%10s ;%10s \n","time", "cpu", "mem", "mempct") } 
( NF == 19 && !/procs/ && !/swpd/ ) { 
	COUNT++ 
	TOT_CPU+=$15+$16
	CPU = $15+$16
	MEM = $5 + $7 + $8
	MEMPCT = (MEM / (MEM + $6)) * 100
	date = gensub( /[^0-9]/, " ", "g", $1 )
        time = gensub( /[^0-9]/, " ", "g", $2 )
        ts = mktime(date " " time)
	printf("%10s; %10s ;%10s ;%10s \n", ts, CPU, MEM, MEMPCT) 
}  

END { printf("\n\nAverage CPU = %5.2f\n", TOT_CPU/COUNT) }
