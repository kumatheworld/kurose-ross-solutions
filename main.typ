#import "template.typ": *

#show: project.with(
  title: "Exercise Solutions to Computer Networking: A Top-Down Approach, 8th edition by Jim Kurose and Keith Ross",
  authors: (
    "Yoshihiro Kumazawa",
  ),
  date: datetime.today().display(),
)

#set heading(numbering: (..args) => {
  let nums = args.pos()
  if nums.len() == 1 {
    return "Chapter " + numbering("1:", ..nums)
  }
})
= Computer Networks and the Internet
== Review Questions
#show: enumb.with(pref: "R")
+ A host and an end system are the same thing. Phones or laptops connected to the Internet are examples of end systems. A Web server is also an end system.
+ #quote(block: true, attribution: link("https://en.wikipedia.org/wiki/Protocol_(diplomacy)"))[Protocol is commonly described as a set of international courtesy rules. These well-established and time-honored rules have made it easier for nations and people to live and work together. Part of protocol has always been the acknowledgment of the hierarchical standing of all present. Protocol rules are based on the principles of civility.—Dr. P.M. Forni on behalf of the International Association of Protocol Consultants and Officers.]
+ Standards are important so that people can create products and systems that can interoperate.
+ Access technologies can be classified as follows.
  / Home access: digital subscriber line (DSL), cable Internet access, fiber to the home (FTTH), 5G fixed wireless, Ethernet, Wi-Fi.
  / Enterprise access: Ethernet, Wi-Fi.
  / Wide-area wireless access: 3G, LTE 4G, 5G.
+ HFC transmission rate is shared among users. Collisions are not possible as it is a shared broadcast medium.
+ Below are a few examples.
  #table(
    columns: 5,
    table.header[*Name*][*Type of access*][*Downstream rate*][*Upstream rate*][*monthly price*],
    [#link("https://www.catv-yokohama.ne.jp/customer/internet/")[YCV NET 1G]], [DOCSIS], [Up to 1 Gbps], [Up to 100 Mbps], [7,788 JPY/month],
    [#link("https://network.mobile.rakuten.co.jp/hikari/")[Rakuten Hikari]], [FTTH], [Up to 1 Gbps], [Up to 1 Gbps], [5,280 JPY/month],
    [#link("https://www.uqwimax.jp/wimax/")[UQ WiMax]], [BWA], [Up to 4.2 Gbps], [Up to 286 Mbps], [5,346 JPY/month],
  )
+ Users typically have 100 Mbps to tens of Gbps.
+ Some examples are twisted-pair copper wire, coaxial cable, and optical fiber.
+ The table below shows transmission rates according to some standards for HFC and DSL. In the case of FTTH, the transmission rate is potentially several Gbps fast.
  #table(
    columns: 3,
    table.header[*Type of access*][*Downstream transmission*][*Upstream transmission*],
    [HFC], [Dedicated, 1.2 Gbps], [Dedicated, 100 Mbps], [DSL], [Dedicated, 52 Mbps], [Dedicated, 16 Mbps],
    [FTTH], [Dedicated, several Gbps], [Dedicated, several Gbps],
  )
+ Cellular network technologies (3G and LTE 4G and 5G) and Wi-Fi seem the most popular ones today. From the user's perspective, the biggest difference would be the range. With a cellular network, a user need only be within a few tens of kilometers of the base station, whereas with Wi-Fi, they have to be within a few tens of meters of the access point.
+ $L(1/R_1+1/R_2)$.
+ Dircuit-switching is better than packet-switching in that it establishes an end-to-end connection between the hosts, in which the transmission rate is guaranteed constant. In a circuit-switched network, every circuit of TDM has the same transmission rate, which might make TDM a better choice than FDM.
+
  + 2 Mbps / (1 Mbps / user) = 2 users
  + We can see from the above that a queuing delay can occur if and only if more than 2 users transmit simultaneously.
  + 20% = 0.2 as given.
  + The queue grows if and only if all three users are transmitting simultaneously, the probability of which is $(0.2)^3=0.008$.
+ Two ISPs at the same level of the hierarchy will often peer with each other because it is typically settlement-free as opposed to paying the upstream ISPs. IXPs earn money by charging the traffic exchanged by the downstream access ISPs.
+ Google has many data centers all over the world interconnected via their private TCP/IP network, separate from the public Internet. The network is connected with tier-1 ISPs as well as peering with lower-tier ISPs. By creating its own network, a content provider not only reduces its payments to upper-tier ISPs but also has greater control over how its services are ultimately delivered to end users.
+ The nodal delays consist of the processing delay, queuing delay, transmission delay, and propagation delay. The queuing delay is variable as it depends on how many packets are sent to each link. The other three are constant given that the packet length and transmission rates are fixed.
+ Length, Rate and Packet size are shown as configurable parameters on the website. When (Length, Rate, Packet size) = (10 km, 100 Mbps, 100 Bytes), the sender finishes transmitting before the first bit of the packet reaches the receiver. When (Length, Rate, Packet size) = (10 km, 1 Mbps, 100 Bytes), the first bit of the packet reaches the receiver before the sender finishes transmitting.
+ In general, given $L$ [bytes], $d$ [m], $s$ [m/s], and $R$ [bit/s], the transmission delay and propagation delay are $8L\/R$ [s] and $d\/s$ [s] respectively. The transmission delay depends on both the packet length and the transmission rate, but the propagation delay doesn't depend on either of them. When $L=1,000$, $d=2,500times 10^3$, $s=2.5times 10^8$, and $R=2times 10^6$, it takes $8dot 1,000\/(2dot 10^6)+(2,500dot 10^3)\/(2.5times 10^8)=0.004+0.01=0.014$ seconds to propagate.
+
  + $min(R_1,R_2,R_3)=500$ kbps.
  + $8dot 4dot 10^6\/(500dot 10^3)=64$ seconds.
  + The throughput will be $min(R_1,R_2,R_3)=100$ kbps. It will take $64dot 500\/100=320$ seconds to transfer the file.
+ End system A creates packets by dividing the file and attaching to each chunk an IP header including the source and destination IP addresses. The router uses the destination IP address to determine the link onto which the packet is forwarded. Packet switching in the Internet is analogous to driving from one city to another and asking directions along the way because the end-to-end route is determined on the fly rather than ahead of time.
+ The maximum emission rate is 500 packets/s and the minimum transmission rate is 350 packets/s. With those rates, the traffic intensity is the ratio $500\/350=1.43$. It takes about 9.5 mses for packet loss to occur. Repeating the experiment gives you the same amount of time for packet loss to occur because packets arrive periodically.
+ Skipped for now.
+ The five layers are as follows, from the top to the bottom:
  - *Application layer* is where network applications and their application-layer protocols reside.
  - *Transport layer* transports application-layer messages between application endpoints.
  - *Network layer* moves datagrams from one host to another, determining the route between them.
  - *Link layer* moves frames from one node to the next along the route from one host to another.
  - *Physical layer* moves the individual bits within frames from one node to the next.
+ Those are what a packet is called in each layer.
+ A router processes the network layer. A link-layer switch processes the link layer. A host processes all five layers.
+ A self-replicating malware is malicious software that continues to infect hosts through the Internet from an already infected host.
+ A botnet can be created by forming a network of infected hosts. The attacker can then have the compromised hosts blast traffic at the target.
== Problems
#show: enumb.with(pref: "P")
+ Skipped for now.
+ $d#sub[end-to-end]=(N+P-1)L/R$ as it takes $N L/R$ to send one packet and adding another from the rest $P-1$ packets will each take an additional $L/R$ by pipelining.
+
  + A circuit-switched network would be more appropriate for this application as it would have to establish a connection repeatedly with packet switching.
  + No form of congestion control is needed as all the packets will travel across the network without any queuing delay.
+ 
  + There are $4dot 4=16$ links and there can be as many connections when every connection is made between neighboring nodes.
  + $4plus 4$ connections can be made, each by way of either switch $B$ or $D$.
  + Yes we can by establishing 2 connections on each of the following paths: ABC, ADC, BAD, and BCD.
+ Since the assumption in the analogy that tollbooths are located every 100km is not consistent with this problem, we instead assume that the first and third tollbooths are 175km away, having the second one somewhere in between. We also assume that each tollbooth services a car at a rate of one car per 12 seconds as in the former setting of the analogy.
  + The transmission delay is $3dot 10dot 12$ seconds $=6$ minutes. The propagation delay is $175\/100$ hours $=105$ minutes. Therefore, the end-to-end delay is $6+105=111$ minutes long.
  + The transmission delay is now $3dot 8dot 12$ seconds $=4.8$ minutes, whereas the propagation delay remains the same. Thus the total delay is $4.8+105=109.8$ minutes long.
+
  + $d#sub[prop]=m\/s$.
  + $d#sub[trans]=L\/R$.
  + $d#sub[end-to-end]=d#sub[prop]+d#sub[trnas]=m\/s+L\/R$.
  + It is at the A-side end of the link.
  + It is at the B-side end of the link.
  + It is somewhere between the two ends of the link. 
  + $m=s dot L\/R=2.5dot 10^5 "[km/sec]"dot 8dot 1500 "bits"\/(10dot 10^6 "bps")=300$ km.
+ We have 3 kinds of delays to consider:
  - The conversion delay $d#sub[conv]$, which we define as the time needed to convert the rest of the bits including the bit we are interested in. If it is the $n$-th bit in the packet counting from the back where $1<=n<=448$ is an integer, $d#sub[conv]=n\/(64 "kbps")=0.016n$ [msec].
  - The transmission delay $d#sub[trans]=56 "bytes" \/(10 "Mbps")=0.0448$ msec.
  - The propagation delay $d#sub[prop]=10$ msec.
  Therefore, the overall delay is $d#sub[conv]+d#sub[trans]+d#sub[prop]=0.016n+10.448$ msec. The first bit ($n=448$) has a delay of 17.45 msec and the last bit ($n=1$) has a delay of 10.46 msec.
+
  + $10 "[Mbps]"\/(200 "[kbps]/user")=50$ users can be supported.
  + 10 percent as given.
  + $vec(120,n)dot 9^(120-n)\/10^120$.
  + $sum_(n=51)^120 vec(120,n)dot 9^(120-n)\/10^120=2.1dot 10^(-20)$.
+
  + $N=1 "[Gbps]"\/(100 "[kbps]")=10,000$.
  + $sum_(n=N+1)^M vec(M,n)dot p^n (1-p)^(M-n)$ or equivalently, $sum_(n=1)^N vec(M,n)dot p^(M-n) (1-p)^n$.
+ The processing, transmission, and propagation delay are $2d#sub[proc]$, $L sum_(i=1)^3 1\/R_i$, and $sum_(i=1)^3 d_i\/s_i$, respectively. Therefore, the total end-to-end delay $d#sub[end-to-end]$ is the sum $2d#sub[proc]+L sum_(i=1)^3 1\/R_i+sum_(i=1)^3 d_i\/s_i$. For those values given, $d#sub[end-to-end]=2dot 3 "msec"+3dot 1,500 "bytes"\/(2.5 "Mbps")+(5,000+4,000+1,000) "km"\/(2.5dot 10^8 "m/s")=(6+14.4+40) "msec"=60.4$ msec.
+ The processing, transmission, and propagation delay are 0, $L\/R$, and $sum_(i=1)^3 d_i\/s_i$, respectively. Therefore, the total end-to-end delay is the sum $L\/R+sum_(i=1)^3 d_i\/s_i$.
+ The queuing delay $d#sub[queue]$ is given by $d#sub[queue]=(n L-x)\/R$, being equal to the transmission delay of the bits ahead. For those values given, we have $d#sub[queue]=4.5dot 1,500 "bytes"\/(2.5 "Mbps")=21.6$ msec.
+ 
  + The $n$-th packet has the queuing delay $(n-1)L\/R$ as the transmission delay of the $(n-1)$ packets ahead. Therefore, the average queuing delay is $(sum_(n=1)^N (n-1)L\/R)\/N=(N-1)L\/2R$.
  + Since $L N\/R$ is long enough to transmit $N$ packets, the average queuing delay is the same as above $(N-1)L\/2R$.
+
  + The queuing and transmission delay are $I L\/R(1-I)$ and $L\/R$ respectively. Therefore, the total delay $d$ is the sum $d=I L\/R(1-I)+L\/R=L\/R(1-I)$.
  + Let $r=L\/R$. The total delay $d=L\/R(1-I)=r\/(1-a r)$ as a function of $r$ looks like the following. Here we set $a=5$, but the shape of the curve will remain the same with other values as well.
  #image("data/c1p14b.png")
+ $I=a\/mu$ holds. Hence the total delay is $L\/R(1-I)=I\/(1-I)a=1\/(mu-a)$.
+ From Little's formula, it holds that $a=N\/(d#sub[trans]+d#sub[queue])$, where $d#sub[trans]$ and $d#sub[queue]$ are the transmission and queuing delay, respectively. With those values given, we have $d#sub[trans]=1\/(100 "packets/sec")=10$ msec/packet, $d#sub[queue]=20 "msec/packet"$, and $a=100\/((10+20) "msec/packet")=3.33$ packets/msec.
+
  + It holds that $d#sub[end-to-end]=sum_i^N (d_"proc"^i+d_"trans"^i+d_"prop"^i)$, where $d_"proc"^i$, $d_"trans"^i$, and $d_"prop"^i$ are $i$-th router's processing, transmission, and propagation delay, respectively.
  + $d#sub[end-to-end]=(N-1)d_"queue"+sum_i^N (d_"proc"^i+d_"trans"^i+d_"prop"^i)$.
+ See #link("data/c1p18.sh") and #link("data/c1p18.txt") for reference.
  + 15.22 #sym.plus.minus 0.23 ms, 15.30 #sym.plus.minus 0.62 ms, and 14.05 #sym.plus.minus 0.07 ms.
  + The paths and the number of routers did not change.
  + There are at least 3 ISP networks, namely ntlworld.ie, aorta.net, and Google. The largest delay occurred within Google's network.
  + The traceroute program does not show the hops close to the destination, but the farthest routers show values around 110ms, which should be close to the actual end-to-end RTT to the destination. The path changed slightly within the gw.umass.edu network. There are at least 3 ISP networks, namely ntlworld.ie, aorta.net, and gtt.net. The largest delay occurred within gtt.net, which was between ae6.cr0-dub2.ip4.gtt.net and et-0-0-5.cr1-bos1.ip4.gtt.net. Those intra-continental and inter-continental results show that the latter was an order of magnitude slower due to the inter-continental link.
+ $n(n-1)$ messages will be sent. Yes, it does support Metcalfe's law.
+ $min{R_s,R_c,R\/M}$.
+ If the server can only use one path to send data to the client, the maximum throughput is $max_(k=1,dots,M)min_(i=1,dots,n)R_i^k$. If the server can use all $M$ paths to send data, the maximum throughput is $sum_(k=1)^M min_(i=1,dots,n)R_i^k$.
+ The probability that a packet sent by the server is successfully received by the receiver is $(1-p)^N$. On average, the server will re-transmit the packet as many times as $sum_(i=0)^infinity i(1-(1-p)^N)^i (1-p)^N=1\/(1-p)^N-1$. The formula diverges to infinity if $p=1$, showing that retransmissions continue indefinitely.
+
  + It is $L\/R_s$, which is the bigger of the two transmission delays since there will be no queuing at the router.
  + The second packet queues if and only if the transmission delay $L\/R_c$ of the first packet at the router is bigger than $L\/R_s+d#sub[prop]$, which is the time it takes for the second packet to reach the router. If that is the case, the second packet will have to wait for $T=L\/R_c-L\/R_s-d#sub[prop]$ seconds to ensure no queuing.
+ It would take $50 "TB"\/(100 "Mbps")=4dot 10^6 "seconds"approx 46.3$ days via the link, so I would prefer FedEx overnight delivery.
+
  + $d#sub[prop]=20,000 "km"\/(2.5dot 10^8 "m/sec")=0.08$ sec, so that $R dot d#sub[prop]=5 "Mbps"dot 0.08 "sec"=4dot 10^5$ bits.
  + If we denote it as $L$ bits, by the time the first bit arrives at Host B, $L\/R$ bits will have been transmitted. Hence $L\/R=d_#sub[prop]$ holds and we get $L=R dot d#sub[prop]=4dot 10^5$ bits. This is smaller than the file size of $8dot 10^6$ bits.
  + From the above, it can be seen as the maximum number of bits that will be in the link at any given time.
  + A bit is $20,000 "km"\/(4dot 10^5)=50$ meters long. It is shorter than the football field length of 360 feet.
  + It is $s\/(R dot d#sub[prop])=m\/(R dot m\/s)=s\/R$.
+ $m=s\/R$ holds, so that $R=s\/m=(2.5dot 10^8 "m/s")\/(20,000 "km")=12.5$ bps.
+
  + $R dot d#sub[prop]=500 "Mbps"dot 0.08 "sec"=4dot 10^7$ bits.
  + Now that the file size is smaller, all of the $800,000$ bits will be in the link when the last bit is transmitted.
  + $s\/R=(2.5dot 10^8 "m/s")\/(500 "Mbps")=0.5$ meters/bit.
+
  + The transmission delay $d#sub[trans]$ is $800,000 "bits"\/(5 "Mbps")=0.160$ seconds, so that the total delay is $d#sub[trans]+d#sub[prop]=0.160+0.08 "sec"=240$ msec.
  + The transmission delay of one packet is $40,000 "bits"\/(5 "Mbps")=0.008$ seconds, so it takes $0.008+0.08 "sec"=0.088$ sec to send it and get it acknowledged. Since the packets cannot be pipelined, it takes $20dot 0.088 "sec"=1.76$ sec to send the file.
  + The latter takes more than 7 times as much time.
+
  + The altitude of a geostationary satellite is 35,786 km high, so the propagation delay is $35,786 "km"\/(2.4dot 10^8 "m/s")=149$ msec.
  + $R dot d#sub[prop]=10 "Mbps"dot 149 "msec"=1.49dot 10^6$ bits.
  + $x\/R=d#sub[prop]$ holds, so that $x_min=R dot d#sub[prop]=1.49dot 10^6$ bits.
+ Baggage tags are equivalent to header information.
+
  + It takes as much as the transmission delay of $10^6 "bits"\/(5 "Mbps")=200$ msec to move the message from the source host to the first packet switch. Since there are 3 links and each switch uses store-and-forward packet switching, it takes 3 times as much time, which is 600 msec, to move the message to the destination host.
  + It takes $10^4 "bits"\/(5 "Mbps")=2$ msec to move the first packet from the source host to the first packet switch. The second packet to arrive at the first router at time $2 "msec"+2 "msec"=4$ msec.
  + At time $100dot 2 "msec"=200$ msec, the last packet will be at the first router. It takes another $2dot 2 "msec"=4$ msec to deliver it to the destination, so it takes $200 "msec"+4 "msec"=204$ msec in total to move all of the packets to the destination. It is nearly 3 times as fast as sending the whole message at once, showing that the speedup rate you could get from message segmentation is up to as much as the number of links.
  + Message integrity check and encryption will be easier. Moreover, other packets will queue less since they can interleave the segmented messages.
  + Additional header information will be required, which increases the number of bits to be sent. Message reassembly might not be trivial when a packet is lost halfway through.
+ The delays in the interactive animation indeed correspond to the delays in the previous problem. Message switching with message size 16 took nearly 3 times as much as message segmentation with package size 1 kbit. Link propagation delays equally increase the overall end-to-end delay regardless of the package size, making the ratio a little smaller.
+ It takes $(F\/S+2)L\/R=(2S+80F\/S+F+160)\/R$ to move the file from Host A to Host B. By the AM-GM inequality, this value is at minimum when $2S=80F\/S$, which is $S=4sqrt(10F)$.
+ It is conceivable that Skype manages routers that both understand IP and a telephone network protocol, through which a PC and an ordinary phone can be connected.
== Wireshark Lab: Getting Started
#set enum(numbering: "1.")
My experimental result is saved as #link("data/c1w.pcapng").
+ TLSv1, ARP and SSDP were found.
+ It took 106 msec.
+ The address of gaia.cs.umass.edu is 128.119.245.12. The address of my computer is 10.15.14.11.
+ See #link("data/c1w.pcapng").

= Application Layer
== Review Questions
#show: enumb.with(pref: "R")
+ Below are a few examples.
  #table(
    columns: 2,
    table.header[*Application*][*Protocol*],
    [Web], [HTTP],
    [Email], [SMTP],
    [Remote terminal access], [Telnet],
    [File transfer], [FTP],
    [IP address resolution], [DNS]
  )
+ The network architecture determines how network devices communicate with each other. It is the five-layer architecture in today's Internet. On the other hand, the application architecture dictates how the application is structured over the various end systems. Common application architectural paradigms include the client-server architecture and the peer-to-peer (P2P) architecture.
+ The client is the host that initiates the connection. The server is the other, waiting for the connection to begin.
+ I do not agree because each session is governed by two hosts just as in the client-server architecture, the one downloading the file being the client and the one uploading it being the server.
+ An IP address and a port number.
+ I would use UDP to circumvent the congestion control and flow control of TCP.
+ Collaborative document editing would be an example.
+ Below are the four classes of services and whether each is supported by TCP or UDP.
  #table(
    columns: 2,
    table.header[*Service*][*Supported by*],
    [Reliable data transfer], [TCP],
    [Throughput], [Neither],
    [Timing], [Neither],
    [Security], [Neither],
  )
+ TLS operates at the application layer. If the application developer wants TCP to be enhanced with TLS, the developer has to pass the cleartext data through the TLS socket.
+ To establish a connection between the two hosts before exchanging actual messages.
+ Those protocols require no data loss to occur. TCP guarantees reliable data transfer but UDP does not.
+ When the customer's browser visits the website for the first time, the server generates a cookie, stores it in its database and includes it in the HTTP response message. The browser then stores the cookie and includes it in the subsequent HTTP request messages. The server stores customer's information such as a purchase record by using the cookie as the key, which the browser can retrieve by the stored cookie.
+ A web cache sits between the client and the server and delivers objects requested by the client on the server's behalf, avoiding potentially slow links on the way from the server. Web caching reduces the delay for requested objects that have not been modified.
+ ```sh
  $ telnet gaia.cs.umass.edu 80
  Trying 128.119.245.12...
  Connected to gaia.cs.umass.edu.
  Escape character is '^]'.
  HEAD /index.html HTTP/1.1
  Host: gaia.cs.umass.edu
  If-Modified-Since: Fri, 24 May 2024 12:34:56 GMT

  HTTP/1.1 304 Not Modified
  Date: Sat, 25 May 2024 19:20:25 GMT
  Server: Apache/2.4.6 (CentOS) OpenSSL/1.0.2k-fips PHP/7.4.33 mod_perl/2.0.11 Perl/v5.16.3
  ETag: "a5b-52d015789ee9e"
  ```
+ WhatsApp, WeChat and LINE are some popular messaging apps. WhatsApp uses a variation of XMPP @xmpp, WeChat uses MMTLS @8711267, and LINE uses ECDH @ecdh, all running on the TCP/IP protocol suite of the Internet. On the other hand, while SMS messages can be transmitted over XMPP, SMS usually uses different sets of protocols, which might or might not incorporate TCP/IP.
+ The message is transmitted as follows: Alice's host $limits(arrow.r)^"HTTP"$ Alice's mail server $limits(arrow.r)^"SMTP"$ Bob's mail server $limits(arrow.r)^"IMAP"$ Bob's host.
+ There were 4 `Received:` header lines in the latest email in my inbox. @email_headers explains some of the following headers in the email: `Arc-Seal`, `X-Sg-Eid`, `X-Sg-Id`, `X-Received`, `Return-Path`, `Arc-Authentication-Results`, `X-Google-Smtp-Source`, `Mime-Version`, `Authentication-Results`, `X-Entity-Id`, `Arc-Message-Signature`, `Dkim-Signature`, `Dkim-Signature`, `X-Feedback-Id`, `Content-Type`, `Received-Spf`, `Delivered-To`, `Received`. For example, `Delivered-To` shows the recipient, which in the email coincided with my email address.
+ HOL blocking is a phenomenon where a large object in transmission prevents the subsequent elements from being transmitted. HTTP/2 attempts to solve it by sending objects in a round-robin manner, transmitting small chunks of objects alternatingly.
+ Yes, an organization’s Web server and mail server can have the exact same alias for a hostname because the host can open ports for both HTTP/HTTPS and SMTP at the same time. The type for the RR that contains the hostname of the mail server would be MX.
+ In my received email from `harvard.edu`, several headers including `Received` had a common IP address associated with `amazonses.com`, which is supposedly used by harvard.edu. I did not find an IP address in the header of another email from `gmail.com`.
+ Bob will not necessarily return the favor and provide chunks to Alice in this same interval as she might not want any chunks during that time. However, he'll be a more likely peer to give chunks to Alice if she needs them during and within 10 seconds after the interval.
+ She will be randomly selected as an optimistically unchoked peer and get her first chunks.
+ An overlay network is a graph on top of another network, where the vertices are hosts and the edges are connections. Routers are abstracted away as part of an edge. 
+ The two philosophies are Enter Deep and Bring Home. The former deploys server clusters in access ISPs all over the world while the latter builds large clusters at a smaller number of sites, typically placing those in Internet Exchange Points (IXPs). The former offers lower delay and higher throughput to end users while the latter has lower maintenance and management overhead.
+ UDP needs one socket on the server side because it is a connectionless protocol. On the other hand, TCP is a connection-oriented protocol, having a welcoming socket separately from the connection socket. If the TCP server were to support $n$ simultaneous connections, each from a different client host, the TCP server would need at least $n+1$ sockets, one welcoming socket for all the clients and one connection socket for each client.
+ Load balancing and ISP delivery cost are some important factors.
+ Precisely speaking, both the UDP program pair and the TCP program pair need the server to be ready first. However, there is a difference between the two in how late the server can be ready. In the UDP case, `clientSocket.sendto()` will succeed even if the server is not running, as long as it is ready before `clientSocket.recvfrom()` is executed. On the other hand, in the TCP case, you'll get `ConnectionRefusedError: [Errno 61] Connection refused` as soon as the line `clientSocket.connect((serverName, serverPort))` of the client code is executed if the server is not running. This is because TCP needs an interactive handshake before actual data is sent while UDP allows the client to send data without a connection. 
== Problems
#show: enumb.with(pref: "P")
+
  + False. There will be four requests and four responses since there are four objects, each of which needs one request and one response.
  + True as long as the two web pages reside on the same host.
  + False. With nonpersistent connections, a connection is closed after sending a message.
  + False. It shows the time the HTTP message was created.
  + False. For example, a `304 Not Modified` response will not include a message body.
+ Below is a table of applications and the protocols they use. iMessage and WeChat use proprietary protocols. In terms of security, PQ3 is more secure than XMPP, which is more secure than MMTLS, according to @pq3.
  #table(
    columns: 2,
    table.header[*Application*][*Protocol(s)*],
    [SMS], [Standardized protocols such as SMPP @smpp],
    [iMessage], [It is based on Apple Push Notification service (APNs) @apns and leverages PQ3 @pq3 for security],
    [WeChat], [MMTLS @8711267],
    [WhatsApp], [XMPP @xmpp],
  )
+ DNS is needed to resolve the hostname, which needs UDP. In the case of HTTP/3, QUIC is used, which also needs UDP. TCP is needed otherwise.
+
  + `GET /cs453/index.html HTTP/1.1` and  `gaia.cs.umass.edu` show that the requested URL is `http://gaia.cs.umass.edu/cs453/index.html`.
  + `HTTP/1.1` shows that HTTP version 1.1 is used.
  + Both `Keep-Alive: 300` and `Connection:keep-alive` show that a persistent connection is used.
  + It is not shown in the request.
  + A Netscape browser initiates the message @netscape. The browser type is needed in an HTTP request message because the server may use the information to process the request. For example, the server can reject the request from a specific type of browser.
= Transport Layer
= The Network Layer: Data Plane
= The Network Layer: Control Plane
= The Link Layer and LANs
= Wireless and Mobile Networks
= Security in Computer Networks

#bibliography("main.bib")