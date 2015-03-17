BEGIN { printf("%10s ;%10s ;%10s ;%10s ;%10s ;%10s; %10s; %10s; %10s \n","time", "swpd", "free", "buff", "cache", "user","system","iowait", "idle") } 
( NF == 19 && !/procs/ && !/swpd/ ) { 
	COUNT++ 
	CPU+=$15+$16
	date = gensub( /[^0-9]/, " ", "g", $1 )
        time = gensub( /[^0-9]/, " ", "g", $2 )
        ts = mktime(date " " time)
	printf("%10s; %10s ;%10s ;%10s ;%10s ;%10s ;%10s ;%10s; %10s \n", ts, $5, $6, $7, $8, $15, $16, $18, $17) 
}  

END { printf("\n\nAverage CPU = %5.2f\n", CPU/COUNT) }
