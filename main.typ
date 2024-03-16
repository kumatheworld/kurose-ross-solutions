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
#set enum(numbering: (it => [R#it.]))
+ A host and an end system are the same thing. Phones or laptops connected to the Internet are examples of end systems. A Web server is also an end system.
+ #quote(block: true, attribution: link("https://en.wikipedia.org/wiki/Protocol_(diplomacy)"))[Protocol is commonly described as a set of international courtesy rules. These well-established and time-honored rules have made it easier for nations and people to live and work together. Part of protocol has always been the acknowledgment of the hierarchical standing of all present. Protocol rules are based on the principles of civility.—Dr. P.M. Forni on behalf of the International Association of Protocol Consultants and Officers.]
+ Standards are important so that people can create products and systems that can interoperate.
+ Access technologies can be classified as follows.
  / Home access: digital subscriber line (DSL), cable Internet access, fiber to the home (FTTH), 5G fixed wireless, Ethernet, Wi-Fi.
  / Enterprise access: Ethernet, Wi-Fi.
  / Wide-area wireless access: 3G, LTE 4G, 5G.
+ HFC transmission rate is shared among users. Collisions are not possible as it is a shared broad- cast medium.
+ Below are a few examples.
  #table(
    columns: (auto, auto, auto, auto, auto),
    [Name], [Type of access], [Downstream rate], [Upstream rate], [monthly price],
    [#link("https://www.catv-yokohama.ne.jp/customer/internet/")[YCV NET 1G]],
    [DOCSIS],
    [Up to 1 Gbps],
    [Up to 100 Mbps],
    [7,788 JPY/month],
    [#link("https://network.mobile.rakuten.co.jp/hikari/")[Rakuten Hikari]],
    [FFTH],
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
== Problems
#set enum(numbering: (it => [P#it.]))
== Wireshark Lab

= Application Layer
= Transport Layer
= The Network Layer: Data Plane
= The Network Layer: Control Plane
= The Link Layer and LANs
= Wireless and Mobile Networks
= Security in Computer Networks
