Examples made with 2 KVM's, each containing 2 LXC's. Replace IP's and parameters according to your setup and preferences

Log in on the VM designated as the host and start the iperf3 server

```
iperf3 -s -i 5 
```

Open 2 terminals on the VM designated as the client

On one terminal start the vmstat (report every 5 second for 310 seconds) :

```
./start-vmstat.sh 5 310
```

On the other terminal, start the iperf3 client (5 parallel streams, report every 5 seconds, for 300 seconds, omit the first 5 seconds)

```
iperf3 -c 10.0.0.200 -P 5 -i 5 -f m -t 300 -w 120k -O 5 -J > iperf3.json
```

Wait while the tools are running.

On your host, run the following script :

```
./process-vm.sh 10.0.1.11 1 300
```

First parameter the hostname or IP address of the KVM host containing the LXC which was designated at the client in the test. Second parameter is which lxc was used and the 3rd parameter is an extra suffix that will be used in the filenames.

After running above script, you can edit the index.html and update the following parameter to the last parameter you used in the command.

```
var VERSION = "300";
```

After that, open index.html in your browser


