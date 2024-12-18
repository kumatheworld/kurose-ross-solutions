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
  #image("extra/c1p14b.png")
+ $I=a\/mu$ holds. Hence the total delay is $L\/R(1-I)=I\/(1-I)a=1\/(mu-a)$.
+ From Little's formula, it holds that $a=N\/(d#sub[trans]+d#sub[queue])$, where $d#sub[trans]$ and $d#sub[queue]$ are the transmission and queuing delay, respectively. With those values given, we have $d#sub[trans]=1\/(100 "packets/sec")=10$ msec/packet, $d#sub[queue]=20 "msec/packet"$, and $a=100\/((10+20) "msec/packet")=3.33$ packets/msec.
+
  + It holds that $d#sub[end-to-end]=sum_i^N (d_"proc"^i+d_"trans"^i+d_"prop"^i)$, where $d_"proc"^i$, $d_"trans"^i$, and $d_"prop"^i$ are $i$-th router's processing, transmission, and propagation delay, respectively.
  + $d#sub[end-to-end]=(N-1)d_"queue"+sum_i^N (d_"proc"^i+d_"trans"^i+d_"prop"^i)$.
+ See #link("extra/c1p18.sh") and #link("extra/c1p18.txt") for reference.
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
My experimental result is saved as #link("extra/c1w.pcapng").
+ TLSv1, ARP and SSDP were found.
+ It took 106 msec.
+ The address of gaia.cs.umass.edu is 128.119.245.12. The address of my computer is 10.15.14.11.
+ See #link("extra/c1w.pcapng").

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
+ Precisely speaking, both the UDP program pair and the TCP program pair need the server to be ready first. However, there is a difference between the two in how late the server can be ready and in how the client fails if the server is not running. In the UDP case, the server has to be ready by the time the client executes `clientSocket.sendto()`. If the server is not ready, `clientSocket.sendto()` will not err and `clientSocket.recvfrom()` will hang up. On the other hand, in the TCP case, the server has to be ready by the time the client executes `clientSocket.connect()`, where an exception `ConnectionRefusedError` will be raised if the server is not ready. This is because TCP needs an interactive handshake before actual data is sent while UDP allows the client to send data without a connection. 
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
+
  + `HTTP/1.1 200 OK` and `Date: Tue, 07 Mar 2008 12:39:45GMT` show that the document was found and the reply was provided at that time.
  + `Last-Modified: Sat, 10 Dec2005 18:27:46 GMT` shows that the document was modified at that time.
  + `Accept-Ranges: bytes` and `Content-Length: 3874` show that the returned document had 3,874 bytes.
  + `Content-Type: text/html; charset= ISO-8859-1<cr><lf><cr><lf><!doc` shows that the first 5 bytes being returned are "`<!doc`". `Connection: Keep-Alive` shows that the server agreed to a persistent connection.
+
  + The following part from RFC2616 section 14.10 shows that both the client and server can close a persistent connection by including `Connection: close` in the message.
    ```
    HTTP/1.1 defines the "close" connection option for the sender to signal that the connection will be closed after completion of the response. For example,

      Connection: close

    in either the request or the response header fields indicates that the connection SHOULD NOT be considered `persistent' (section 8.1) after the current request/response is complete.
    ```
  + HTTP does not provide encryption services on its own.
  + A client can open as many connections as possible, but the following part from RFC2616 section 8.1.4 suggests at most two simultaneous connections.
    ```
    Clients that use persistent connections SHOULD limit the number of simultaneous connections that they maintain to a given server. A single-user client SHOULD NOT maintain more than 2 connections with any server or proxy.
    ```
  + The following part from RFC2616 section 8.1.4 shows that it is possible for one side to start closing a connection while the other side is transmitting data via an idle connection.
    ```
    A client, server, or proxy MAY close the transport connection at any time. For example, a client might have started to send a new request at the same time that the server has decided to close the "idle" connection. From the server's point of view, the connection is being closed while it was idle, but from the client's point of view, a request is in progress.
    ```
+ It takes $"RTT"_1+"RTT"_2+dots+"RTT"_n+2"RTT"_0$ because each DNS lookup needs 1 RTT and the HTTP request and response need 2 RTTs.
+ Below is the answer to each question. Note that it takes $"RTT"_1+"RTT"_2+dots+"RTT"_n+2"RTT"_0$ in each case to get the HTML file as shown in the previous solution.
  + It takes $"RTT"_1+"RTT"_2+dots+"RTT"_n+18"RTT"_0$ because it takes another 16 RTTs as each object requires two RTTs.
  + It takes $"RTT"_1+"RTT"_2+dots+"RTT"_n+6"RTT"_0$ because it takes another $2*ceil(8/6)=4$ RTTs.
  + It takes $"RTT"_1+"RTT"_2+dots+"RTT"_n+3"RTT"_0$ because it takes another RTT with pipelining.
+
  + The average time required to send an object over the access link is $Delta=(1,000,000 "bits"\/"request")\/(15 "Mbps")=0.067 "sec/request"$ the arrival rate of objects to the access link is $beta=16$ requests/sec. Since the traffic intensity $Delta beta=1.07$ exceeds 1, the queuing delay will grow without bound, in which case the total average response time cannot be computed.
  + Let $r=0.4$. Since the arrival rate $beta$ is now $r$ times as much, the average access delay is given by $Delta\/(1-r Delta beta)=1\/(1\/Delta-r beta)=(15-0.4dot 16)^(-1) "sec/request"=0.12$ sec/request. Thus the average total response time via the Internet is $t_"WAN"=3.12$ sec/request, adding the Internet delay. On the other hand, the response time through the LAN is $t_"LAN"=(1,000,000 "bits"\/"request")\/(100 "Mbps")=0.01 "sec/request"$. Therefore, the average total response time is $(1-r)dot t_"LAN"+r dot t_"WAN"=(0.6dot 0.01+0.4dot 3.12) "sec/request"=1.25 "sec/request"$.
+ We ignore the propagation delay because the link is short. Parallel downloads via parallel instances of non-persistent HTTP would not be any better than non-persistent serial HTTP as long as we consider one shared link that evenly splits the bandwidth. Persistent HTTP would reduce $2dot 9=18$ RTTs for packets containing only control, which is $18dot 200=3,600$ bits long as opposed to $10dot 100 "Kbits"=1$ Mbits of objects that have to be sent over the link in any case.
+
  + They do because each connection is given an even bandwidth, in which case the transmission is $(10+4)\/(1+4)=2.8$ times as quick.
  + They still would because the transmission would be $(10+5dot 4)\/(1+5dot 4)=1.4$ times as quick.
+ The following log from #link("extra/c2p12.py") shows that the browser indeed generated a conditional GET message.
  ```
  GET http://example.com/ HTTP/1.1
  Host: example.com
  Proxy-Connection: keep-alive
  Cache-Control: max-age=0
  Upgrade-Insecure-Requests: 1
  User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36
  Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
  Accept-Encoding: gzip, deflate
  Accept-Language: en
  If-None-Match: "3147526947+gzip"
  If-Modified-Since: Thu, 17 Oct 2019 07:18:26 GMT
  ```
+
  + $2,000+5dot 3=2,015$ frame times are needed.
  + $3dot (1+5)=18$ frame times are needed.
+ $2dot 3=6$ frame times are needed because the frames of the first two images will be sent first.
+ `MAIL FROM:` is not part of the message and is an address that mail servers use to determine where to return undeliverable emails.
+ According to #link("https://www.rfc-editor.org/rfc/rfc5321#section-3.3")[RFC5321 Section 3.3], SMTP indicates the end of the mail data by sending a line containing only a ".". On the other hand, according to #link("https://www.rfc-editor.org/rfc/rfc9110#name-content-length")[RF9110 Section 8.6], HTTP uses the `Content-Length` header field to indicate the size of the message. HTTP cannot use the same method as SMTP to mark the end of a message body as the content might be binary.
+ According to #link("https://www.rfc-editor.org/rfc/rfc5321#section-2.3.3")[RFC5321 Section 2.3.3], MTA stands for "Mail Transfer Agents". The following table shows the intermediate senders and recipients of the spam email:
  #table(
    columns: 2,
    table.header[*Received from*][*Received by*],
    [barmail.cs.umass.edu [128.119.240.3]], [cs.umass.edu (8.13.1/8.12.6)],
    [asusus-4b96 (localhost [127.0.0.1])], [barmail.cs.umass.edu (Spam Firewall)],
    [asusus-4b96 ([58.88.21.177])], [barmail.cs.umass.edu],
    [[58.88.21.177]], [inbnd55.exchangeddd.com]
  )
  Here, the host `asusus-4b96 ([58.88.21.177])` is considered malicious because it does not report where it received the email from.
+
  + A _whois_ database is a public database that stores information about domain names including the owners and IP addresses.
  + The following DNS servers are listed in #link("https://public-dns.info/")[Public DNS Server List]. The names and databases were found by the `whois` command.
    #table(
      columns: 3,
      table.header[*IP address*][*Name*][*Whois database*],
      [204.106.240.53], [DMCI Broadband, LLC.], [#link("https://whois.arin.net")[ARIN]],
      [203.126.118.38], [SingNet Pte Ltd], [#link("https://whois.apnic.net")[APNIK]]
    ) 
  + In my Wi-Fi network, Google's DNS servers 8.8.8.8 and 8.8.4.4 are used according to the output of `scutil --dns | grep nameserver`. I tried `nslookup` for the three different DNS servers 8.8.8.8, 204.106.240.53 and 203.126.118.38, with three different options `-type=A`, `-type=NS` and `-type=MX`. There were no differences between the outputs of the different record types. `nslookup 8.8.8.8` showed a non-authoritative answer `name = dns.google`, `nslookup 204.106.240.53` showed a non-authoritative answer `name = dns3.dmcibb.net`, and `nslookup 203.126.118.38` said that the server could not find 38.118.126.203.in-addr.arpa: NXDOMAIN.
  + My organization has multiple IP addresses as the following command output shows:
    ```sh
    $ nslookup amazon.com
    Server:		8.8.8.8
    Address:	8.8.8.8#53

    Non-authoritative answer:
    Name:	amazon.com
    Address: 54.239.28.85
    Name:	amazon.com
    Address: 52.94.236.248
    Name:	amazon.com
    Address: 205.251.242.103
    ```
  + The following shows the IP address range:
    ```sh
    $ nslookup www.u-tokyo.ac.jp | tail -2 | head -1 | cut -d' ' -f2 | xargs whois -a | grep CIDR:
    CIDR:           210.0.0.0/8
    ```
  + As described above, anyone could get the IP address range used by an organization by using `nslookup` to get an IP address and then using `whois` to get the range of addresses.
  + Whois databases should be publicly available to make sure that all hosts are transparent and accountable for their activities.
+
  + The output of `dig +trace @a.root-servers.net www.is.s.u-tokyo.ac.jp` showed the following chain of name servers in order.
    #table(
      columns: 3,
      table.header[*DNS server type*][*Domain name*][*IP address*],
      [Root], [a.root-servers.net], [198.41.0.4],
      [Root], [h.root-servers.net], [198.97.190.53],
      [TLD], [g.dns.jp], [203.119.40.1],
      [Authoritative], [dns-x.sinet.ad.jp], [150.100.18.10],
      [Authoritative], [dns3.nc.u-tokyo.ac.jp], [157.82.0.1],
      [Authoritative], [ns2.s.u-tokyo.ac.jp], [3.114.219.198],
    )
    Finally, the last authoritative server had `CNAME	ut-is.github.io`, for which `nslookup` returned four IP addresses.
  + `dig +trace @a.root-servers.net google.com` showed the following and 6 IP addresses:
    #table(
      columns: 3,
      table.header[*DNS server type*][*Domain name*][*IP address*],
      [Root], [a.root-servers.net], [198.41.0.4],
      [Root], [j.root-servers.net], [192.58.128.30],
      [TLD], [h.gtld-servers.net], [192.54.112.30],
      [Authoritative], [ns3.google.com], [216.239.36.10]
    )
    `dig +trace @a.root-servers.net yahoo.com` showed the following and 6 IP addresses:
    #table(
      columns: 3,
      table.header[*DNS server type*][*Domain name*][*IP address*],
      [Root], [a.root-servers.net], [198.41.0.4],
      [Root], [g.root-servers.net], [192.112.36.4],
      [TLD], [g.gtld-servers.net], [192.42.93.30],
      [Authoritative], [ns3.yahoo.com], [27.123.42.42]
    )
    `dig +trace @a.root-servers.net amazon.com` showed the following and 3 IP addresses:
    #table(
      columns: 3,
      table.header[*DNS server type*][*Domain name*][*IP address*],
      [Root], [a.root-servers.net], [198.41.0.4],
      [Root], [c.root-servers.net], [192.33.4.12],
      [TLD], [b.gtld-servers.net], [192.33.14.30],
      [Authoritative], [ns2.amzndns.net], [156.154.69.10]
    )
+ If the caching strategy is Least-Frequently Used (LFU), the most frequently used caches are the most popular websites. If it is Least-Recently Used (LRU), the most recently used caches are likely the most popular websites. Otherwise, by taking snapshots of the caches, one can regard the most frequent caches as the most popular websites.
+ I am not sure. One can run `dig` commands on the web server host and another host that is unlikely in the cache. If the query times are not so different, one can assume that the web server was unlikely accessed a couple of seconds ago. If the query time for the web server is much shorter, that probably means it was in the cache, but I am not certain how long ago it was accessed last time.
+ Below is a 3D plot generated with #link("extra/c2p22.py").
  #image("extra/c2p22.png")
+
  + Consider a distribution scheme in which the server sends data in parallel to each client at the rate of $u_s\/N$. Since the download rate of each client is higher by assumption, the upload rate $u_s\/N$ is the bottleneck. Thus, it takes $F\/(u_s\/N)=N F\/u_s$ to send the file to each client.
  + Consider the above distribution again. The overall distribution time is that of the slowest client because the data is distributed in parallel. Since the slowest download rate $d_"min"$ is lower than the upload rate by assumption, it takes $F\/d_"min"$ to send the file. 
  + It is shown in the textbook that $max\{N F\/u_s,F\/d_"min"\}$ is a lower bound to the distribution time. Since the above shows that the lower bound is achievable, we have the value as the minimum distribution time.
+
  + Skipped for now.
  + Skipped for now.
  + It is shown in the textbook that $max\{F\/u_s,F\/d_"min",N F\/(u_s+u_1+dots+u_N)\}$ is a lower bound to the distribution time. It can be written as $max\{F\/u_s,N F\/(u_s+u_1+dots+u_N)\}$ since $F\/d_"min"$ is much smaller than the other two expressions by the assumption that $d_"min"$ is very large. Since the above shows that the lower bound is achievable, we have the value as the minimum distribution time.
+ There are $N$ nodes and $N(N-1)\/2$ edges since the graph is the complete graph on $N$ vertices. Note that the number of routers does not matter since the routers are abstracted away.
+
  + Bob's claim is possible because he can be optimistically unchoked repeatedly until he receives the complete copy.
  + He can do so by sharing the chunks among his hosts.
+
  + $N^2$ files will be stored since each video and each audio will have to be mixed ahead of time.
  + $2N$ files will be stored since each video and each audio will be mixed on the client side.
+
  + TCPClient raises `ConnectionRefusedError` when the client socket tries to connect to the server that has not started to run. This is because TCP is connection-oriented.
  + UDPClient hangs up when it tries to receive data from the server but does not stop when it sends data. This is because UDP is not connection-oriented.
  + With either TCP or UDP, the client fails even if the server is running.
+ It will not become necessary to change the server code. The client uses port 5432 while the server uses port 12000 as specified in the code. Before making the change, the client used a randomly assigned port number such as 54572, which can be checked by calling the `getsockname()` method of the client socket after it has sent data. The server used port 12000.
+ Google Chrome does not seem to offer a way to configure multiple TCP connections, but it is enabled by default. Having a large number of simultaneous TCP connections allows the client to have a virtually faster connection while imposing more burden on the server and potentially doing harm to the well-being of the Internet.
+ One advantage is that the packet payload can be always maximized, which leads to faster delivery of the entire message. One disadvantage is that the receiver will have more trouble constructing the message when packets have not been delivered properly.
+ The Apache HTTP Server @apache_webserver is a free and open-source cross-platform web server software. Features include authentication, server-side programming language support, TLS support, proxy support, URL rewriting, custom log files, and filtering support.
== Socket Programming Assignments
=== Assignment 1: Web Server
#link("extra/c2a1_server.py") is a multithreaded web server and #link("extra/c2a1_client.py") is a web client. Note that the server continues to use the same port after accepting a connection.
=== Assignment 2: UDP Pinger
#link("extra/c2a2_server.py") and #link("extra/c2a2_client.py") implement UDP Ping including the optional exercises.
=== Assignment 3: Mail Client
#link("extra/c2a3.py") is a program that sends an email from a Gmail account to itself. Note that the address and password have to be set as environment variables.
=== Assignment 4: Web Proxy
#link("extra/c2a4.py") implements an HTTP proxy server.
== Wireshark Lab: HTTP
#set enum(numbering: "1.")
+ Both of the client and server used HTTP 1.1. The request included `GET /wireshark-labs/HTTP-wireshark-file1.html HTTP/1.1\r\n` while the response included `HTTP/1.1 304 Not Modified\r\n`.
+ English as in `Accept-Language: en\r\n` from the request.
+ The IP address of my computer and the server are 10.15.14.27 and 128.119.245.12 respectively as Wireshark shows `Internet Protocol Version 4, Src: 10.15.14.27, Dst: 128.119.245.12` in the request.
+ 304 as in `HTTP/1.1 304 Not Modified\r\n` from the response.
+ It is not shown as the response status code was 304. It is before Tue, 17 Sep 2024 05:59:01 GMT because the request included `If-Modified-Since: Tue, 17 Sep 2024 05:59:01 GMT\r\n`.
+ Wireshark shows 293 bytes.
+ All the headers within the data were displayed in the packet-listing window.
+ No, `If-Modified-Since` was not included in the request.
+ Yes, the server explicitly return the contents of the file because the text data was included in the response.
+ Yes, the request had the following line: `If-Modified-Since: Wed, 18 Sep 2024 05:59:02 GMT\r\n`. The request was made around Wed, 18 Sep 2024 21:00 GMT.
+ The status code was 304. The server did not explicitly return the content of the file because the text data was not included in the response.
+ The browser just sent 1 HTTP GET request message. Packet number 245 contained the GET message for the Bill or Rights.
+ Packet number 247 contained the status code and phrase associated with the response to the HTTP GET request.
+ HTTP/1.1 200 OK.
+ Four segments were needed to carry the single HTTP response and the text of the Bill of Rights.
+ Three HTTP GET request messages were sent by the browser. Two GET requests `GET /wireshark-labs/HTTP-wireshark-file4.html HTTP/1.1` and `GET /pearson.png HTTP/1.1` were sent to `128.119.245.12`. The other GET request `GET /8E_cover_small.jpg HTTP/1.1` was sent to `178.79.137.164`.
+ The browser downloaded the two images in parallel because it got the response from `https://kurose.cslash.net` first whereas the first request was sent to `http://gaia.cs.umass.edu`.
+ HTTP/1.1 401 Unauthorized  (text/html).
+ `Cache-Control: max-age=0` and `Authorization: Basic d2lyZXNoYXJrLXN0dWRlbnRzOm5ldHdvcms=` were added. The latter was decoded to `Credentials: wireshark-students:network`.
== Wireshark Lab: DNS
+ It is 103.21.124.133, shown by running `nslookup www.iitb.ac.in`.
+ It is 103.21.125.129, shown by first running `nslookup -type=NS www.iitb.ac.in` and then running `nslookup dns3.iitb.ac.in`. The first command output showed the DNS server name dns1.iitb.ac.in.
+ It came from a non-authoritative server.
+ dns3.iitb.ac.in was the name of the first authoritative server returned by `nslookup iitb.ac.in`. I would run `nslookup dns3.iitb.ac.in` to find the IP address.
+ The packet number in the trace for the first DNS query message was 213. It was sent over UDP.
+ The packet number of the corresponding DNS response was 223. It was sent over UDP.
+ The destination port for the DNS query message and the source port of the DNS response message were both 53.
+ The DNS query message sent to 8.8.8.8.
+ The DNS query message contained one query and no question.
+ The DNS response message contained one query and one question.
+ The packet numbers are as follows. Only one DNS query of type A was sent to gaia.cs.umass.edu because of DNS caching.
  #table(
    columns: 2,
    table.header[*Message*][*Packet Number*],
    [Initial HTTP GET request for the base file http://gaia.cs.umass.edu/kurose_ross/], [236],
    [DNS query made to resolve gaia.cs.umass.edu], [213],
    [Received DNS response], [223],
    [HTTP GET request for the image object http://gaia.cs.umass.edu/kurose_ross/header_graphic_book_8E2.jpg], [486],
    [DNS query made to resolve gaia.cs.umass.edu so that this second HTTP request can be sent to the gaia.cs.umass.edu IP address], [213],
  )
+ The destination port for the DNS query message and the source port of the DNS response message were both 53.
+ The DNS query message sent to 8.8.8.8. It is the IP address of my default local DNS server as another command `scutil --dns` shows.
+ The type of DNS query is A. The query message does not contain any answers.
+ The DNS response message contained one query and one question.
+ The DNS query message sent to 128.119.8.148. It is not the IP address of my default local DNS server.
+ The DNS query message contained one query and no question.
+ The DNS response message was not found. The nslookup command showed the following error: `connection timed out; no servers could be reached`.

= Transport Layer
== Review Questions
#show: enumb.with(pref: "R")
+
  + The simplest possible transport layer protocol would be similar to UDP with the header format of a 4-byte destination port field and a 2-byte length field. Note that the checksum field would not be necessary as the underlying network is assumed reliable.
  + A 4-byte source port field would be included in the header.
  + No, just as UDP does not.
+
  + The sending delegates would make sure that each letter has the sender name and the reciever name in it. The receiving delegates would deliver letters to the family members based on the receiver names. Since it is assumed that each family has six members, assigning an integer from 0 to 5 to each family member ahead of time would also work. 
  + No, just as TCP and UCP do not.
+ The source and destination port numbers for the segments traveling from Host B to Host A are y and x respectively.
+ An application developer might choose to run an application over UDP rather than TCP because they might not want everything that TCP offers. For example, if the application protocol needs a few packets to exchange, they might want to implement a simple reliable transport scheme on top of UDP to get around potentially heavy TCP workloads like congestion control.
+ It is because voice or video applications need real-time communication and can accept some packet losses that their traffic is often sent over TCP rather than UDP in today's Internet.
+ The application can implement reliable dara transer on its own on top of UDP.
+ The process at Host C will know that these two segments originated from two different hosts by looking at the source IP address field of the datagrams.
+ The requests from Host A are being sent to a different socket from those from Host B since a new socket is assinged after creating a connection based on the source IP address. Both of the sockets on Host C have port 80.
+ We needed to introduce sequence numbers because the ACK or NAK packet could be corrupted.
+ We needed to introduce timers for the sender to retransmit packets whose ACKs have not arrived in time.
+ Yes, a timer would still be necessary in protocol rdt 3.0 because the sender would have to wait for an RTT to retransmit a packet.
+
  + All five packets got retransmitted.
  + All five packets got delivered without any retransmission.
  + The sixth packets could not be sent as the sending window was limited to 5.
+ When a packet is lost before reaching the destination, Go-Back-N retransmits all of the packets in the sending window whereas Selective Repeat only retransmits the lost packet. When an ACK packet is lost, Go-Back-N does not retransmit any packet whereas Selective Repeat retransmits all of the packets in the sending window. The corresponding simulation results were as follows:
  + Only the first packet got retransmitted.
  + All five packets got retransmitted.
  + The sixth packets could not be sent as the sending window was limited to 5.
+
  + False. Piggyback is only for efficiency.
  + False. However, the size of the receiver's buffer never changes.
  + True. The number of unacknowleged bytes that A sends cannot exceed the size of the receiver's window size, which is smaller than the receive buffer.
  + False. The sequence number of the subsequent segment will be $m$ plus the number of bytes in the current segment.
  + True. The 16-bit receive window field is it.
  + True, if the parameter $beta$ in the formula is the recommended value $1\/4$. Given the sample RTT $S "[sec]"$, previous estimated RTT $E "[sec]"$, and previous estimated deviation $D "[sec]"$ of RTT, the newly estimated RTT $E' "[sec]"$ and deviation $D "[sec]"$ are given by the following:
    $ E'=(1-alpha)E+alpha S $
    $ D'=(1-beta)D+beta|S-E| $
    When $S=1$, $beta=1\/4$ and $E<1$, the timeout interval $T' "[sec]"$ is proved greater than or equal to 1:
    $ T'=E'+4D'=(1-alpha)E+alpha+3D+|1-E|>=(1-alpha)E+alpha+(1-E)=1+alpha(1-E)>=1 $
    It is clear that $T'>=E'>=1$ when $E>=1$.
  + True. The acknowledgment number is the sequence number of the segment sent to Host B plus the number of data bytes.
+
  + $110-90=20$ bytes.
  + The acknowledgement number will be 90, which Host B will know during the 3-way handshake.
+ The following three segments are sent.
  + Client to server, Seq=43, ACK=80, data='R'
  + Server to client, Seq=80, ACK=44, data='R'
  + Client to server, Seq=44, ACK=81
+ TCP would like to give the transmission rate of $R\2$ to each of the connections as it would aim for full bandwidth utilization while keeping equal bandwidth share.
+ False. The value of `ssthresh` is set to one half of the congestion window value.
+ The client first establishes a TCP connection to the front-end server and sends data through the connection, which takes 4RTT#sub[FE]. The front-end server then sends the data through the persistent connection to the back-end server, which takes RTT#sub[BE] since the connection is already established and the congestion window is large enough to hold all of the data. By adding the processing time to the above, we get the response time formula.
== Problems
#show: enumb.with(pref: "P")
+
  + Possible source port number: 54321, destination port number: 23
  + Possible source port number: 54321, destination port number: 23
  + Source port number: 23, destination port number: 54321
  + Source port number: 23, destination port number: 54321
  + Yes, it is possible because the connections would still be distinguishable since the client hosts are different.
  + No, it is not possible because the connections would be indistinguishable.
+ For each packet, the ports and IP addresses are flipped on the way back to from the server to the clients.
+ The 1s complement of the sum of 01010011, 01100110, 01110100 is 11010010 as the 8-bit sum of those three bytes is 00101101. The 1s complement of the sum instead of the sum itself is used because it is easier that way to detect an error. With the 1s complement of the sum, the error can be detected by adding all data and the checksum and, where an error has happened if and only if one or more bits are 0. A 1-bit error will always be detected as the corresponding bit of the sum of data and checksum will be 0. A 2-bit error might be undetected since the two bits could be of the same place from different bytes.
+
  + 00111110.
  + 11000000.
  + The 1s complement does not change if the first bit of each of the two bytes changes.
+ No, the receiver cannot be absolutely certain that no bit errors have occurred because a 2-bit error could go undetected as shown above.
+ A deadlock can occur when the sender at the top left state sends a packet, the receiver at the left state receives it and finds no corruption, and the sender at the top right state finds it corrupted. In such a case, the sender at the top right state will keep sending the packet with sequence number 0, to which the receiver at the right state will react with a NAK whether it is corrupted or not. The sender and receiver will never transition to the next states.
+ The ACK packets do not require sequence numbers because `rdt3.0` is a stop-and-wait protocol, in which the sender knows which of ACK 0 or ACK 1 it needs to receive.
+ It is not drawn here as it is the same as the `rdt 2.2` receiver in the textbook.
+ The trace would look like that of Figure 3.16 (a), where the sender would keep sending the same packet and the receiver would send the opposite ACK if sender's packet is garbled and send the correct ACK if sender's packet is not garbled. 
+ The new protocol would be exactly like `rdt3.0`. It works just as `rdt3.0` does.
+ The protocol would still work correctly if the `sndpkt=make_pkt(ACK,0,checksum)` action were removed from the self-transition in the Wait-for-1-from-below because the receiver would reuse the packet previously created before the transition to the state. However, the protocol would not work correctly if the `sndpkt=make_pkt(ACK,1,checksum)` action were removed from the self-transition in the Wait-for-0-from-below. If the first sender-to-receiver packet were corrupted, the receiver would have nothing to send back and crash while the sender would be waiting for ACK 0 indefinitely.
+ The protocol would work in an inefficent way that the number of packets between the sender and receiver would increase every time a timeout occurs after a corrupted packet receipt. Those packets wlll never move the senders and receivers forward.
+ The diagram here shows a failure pattern the protocol could face, in which the receiver would acknowledge the resent `pkt0` as the third packet to recieve. #image("extra/c3p13.drawio.svg")
+ With a NAK-only protocol, the loss of a packet would be detected only when a subsequent packet has been recieved correctly. When the sender sends data only infrequently, a NAK-only protocol would not be preferable as a lost packet would not be detected and resent immediately. On the other hand, when the sender has a lot of data to send and the end-to-end connection experiences few losses, a NAK-only protocol would be preferable as it would recover from a loss quickly and save a lot of ACK packets that an ACK-only protocol would exchange.
+ Assuming that ACK packets are extremely small, the sender utilization $U_"sender"$ is given by $d_"trans"/(italic("RTT")+d_"trans")$, where $d_"trans"=S N\/R$ is the transmission delay. Here, $S$ is the packet size and $N$ is the window size. Solving this for $N$, we get $N=U_"sender"/(1-U_"sender")R/S italic("RTT")$. When $U_"sender">=0.98$, we would need $N>=0.98/(1-0.98)(10^9 "[bits/sec]")/(8dot 1500 ["bits/packet"])dot 30"[msec]"=122,500$ packets.
+ The application design would increase the channel utilization if the rate at which the receiver sends ACKs is similar to the sender's and there are no corrupted packets or losses because the sender would never have to wait for ACKs. However, the protocol has the fatal problem that the sender would not know whether the data packets arrived successfully.
+ The figure here shows the FSMs, where the the above FSM is A and the below FSM is B. #image("extra/c3p17.svg") 
= The Network Layer: Data Plane
= The Network Layer: Control Plane
= The Link Layer and LANs
= Wireless and Mobile Networks
= Security in Computer Networks

#bibliography("main.bib")