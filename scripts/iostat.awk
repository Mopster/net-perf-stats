BEGIN { printf("%10s ;%10s ;%10s ;%10s ;%10s ;%10s; %10s \n","time","user","nice","system","iowait","steal","idle") } 
( NF == 8 ) { 
	COUNT++ 
	CPU+=$3+$5
	date = gensub( /[^0-9]/, " ", "g", $1 )
        time = gensub( /[^0-9]/, " ", "g", $2 )
        ts = mktime(date " " time)
	printf("%10s; %10s ;%10s ;%10s ;%10s ;%10s ;%10s \n", ts, $3, $4, $5, $6, $7, $7) 
}  

END { printf("\n\nAverage CPU = %5.2f\n", CPU/COUNT) }
