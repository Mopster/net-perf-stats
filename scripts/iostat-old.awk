function cvttime(t,     cmd,secs) {
    cmd = "date -d \"" t "\" '+%s'"
    cmd | getline secs
    close(cmd)
    return secs
}

BEGIN { printf("%10s ;%10s ;%10s ;%10s ;%10s ;%10s; %10s \n","time","user","nice","system","iowait","steal","idle") } 
( /201/ && !/Linux/ ){
	date = gensub( /[^0-9]/, " ", "g", $1 ) 
	time = gensub( /[^0-9]/, " ", "g", $2 )
	printf mktime(date time) " ;"
} 

( NF==6 && !/201/ ) { 
	CPU+=$1+$3 
	COUNT++ 
	printf("%10s ;%10s ;%10s ;%10s ;%10s ;%10s \n", $1, $2, $3, $4, $5, $6) 
}  

END { printf("\n\nAverage CPU = %5.2f\n", CPU/COUNT) }
