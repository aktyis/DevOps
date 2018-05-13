How To Scan Ports with Nmap

Nmap can reveal a lot of information about a host. It can also make system administrators of the target system think that someone has malicious intent. For this reason, only test it on servers that you own or in situations where you've notified the owners.

The nmap creators actually provide a test server located at:

scanme.nmap.org
This, or your own VPS instances are good targets for practicing nmap.

Here are some common operations that can be performed with nmap. We will run them all with sudo privileges to avoid returning partial results for some queries. Some commands may take a long while to complete:

Scan for the host operating system:

```sh
sudo nmap -O remote_host
```
Skip network discovery portion and assume the host is online. This is useful if you get a reply that says "Note: Host seems down" in your other tests. Add this to the other options:

```sh
sudo nmap -PN remote_host
```
Specify a range with "-" or "/24" to scan a number of hosts at once:
```sh
sudo nmap -PN xxx.xxx.xxx.xxx-yyy
```
Scan a network range for available services:
```sh
sudo nmap -sP network_address_range
```
Scan without preforming a reverse DNS lookup on the IP address specified. This should speed up your results in most cases:
```sh
sudo nmap -n remote_host
```
Scan a specific port instead of all common ports:
```sh
sudo nmap -p port_number remote_host
```
To scan for TCP connections, nmap can perform a 3-way handshake (explained below), with the targeted port. Execute it like this:
```sh
sudo nmap -sT remote_host
```
To scan for UDP connections, type:
```sh
sudo nmap -sU remote_host
```
Scan for every TCP and UDP open port:
```sh
sudo nmap -n -PN -sT -sU -p- remote_host
```
A TCP "SYN" scan exploits the way that TCP establishes a connection.

To start a TCP connection, the requesting end sends a "synchronize request" packet to the server. The server then sends a "synchronize acknowledgment" packet back. The original sender then sends back an "acknowledgment" packet back to the server, and a connection is established.
A "SYN" scan, however, drops the connection when the first packet is returned from the server. This is called a "half-open" scan and used to be promoted as a way to surreptitiously scan for ports, since the application associated with that port would not receive the traffic, because the connection is never completed.

This is no longer considered stealthy with the adoption of more advanced firewalls and the flagging of incomplete SYN request in many configurations.

To perform a SYN scan, execute:
```sh
sudo nmap -sS remote_host
```
A more stealthy approach is sending invalid TCP headers, which, if the host conforms to the TCP specifications, should send a packet back if that port is closed. This will work on non-Windows based servers.

You can use the "-sF", "-sX", or "-sN" flags. They all will produce the response we are looking for:
```sh
sudo nmap -PN -p port_number -sN remote_host
```
To see what version of a service is running on the host, you can try this command. It tries to determine the service and version by testing different responses from the server:
```sh
sudo nmap -PN -p port_number -sV remote_host
```
There are many other command combinations that you can use, but this should get you started on exploring your networking vulnerabilities.

[Ref  link : Digitalocean ](https://www.digitalocean.com/community/tutorials/how-to-use-nmap-to-scan-for-open-ports-on-your-vps)
