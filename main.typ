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
#set enum(full: true, numbering: (..args) => {
  let nums = args.pos()
  if nums.len() == 1 {
    return numbering("R1.", ..nums)
  } else {
    let (i, num) = nums.enumerate().last()
    return numbering("a.", num)
  }
})
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
    [#link("https://www.catv-yokohama.ne.jp/customer/internet/")[YCV NET 1G]],
    [DOCSIS],
    [Up to 1 Gbps],
    [Up to 100 Mbps],
    [7,788 JPY/month],
    [#link("https://network.mobile.rakuten.co.jp/hikari/")[Rakuten Hikari]],
    [FTTH],
    [Up to 1 Gbps],
    [Up to 1 Gbps],
    [5,280 JPY/month],
    [#link("https://www.uqwimax.jp/wimax/")[UQ WiMax]],
    [BWA],
    [Up to 4.2 Gbps],
    [Up to 286 Mbps],
    [5,346 JPY/month],
  )
+ Users typically have 100 Mbps to tens of Gbps.
+ Some examples are twisted-pair copper wire, coaxial cable, and optical fiber.
+ The table below shows transmission rates according to some standards for HFC and DSL. In the case of FTTH, the transmission rate is potentially several Gbps fast.
  #table(
    columns: 3,
    table.header[*Type of access*][*Downstream transmission*][*Upstream transmission*],
    [HFC],
    [Dedicated, 1.2 Gbps],
    [Dedicated, 100 Mbps],
    [DSL],
    [Dedicated, 52 Mbps],
    [Dedicated, 16 Mbps],
    [FTTH],
    [Dedicated, several Gbps],
    [Dedicated, several Gbps],
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
#set enum(numbering: "P1.")
+ Skipped for now.
+ $d#sub[end-to-end]=N (P L)/R$ as it is equivalent to sending a packet of length $P L$.
== Wireshark Lab

= Application Layer
= Transport Layer
= The Network Layer: Data Plane
= The Network Layer: Control Plane
= The Link Layer and LANs
= Wireless and Mobile Networks
= Security in Computer Networks

// #bibliography("main.bib")
