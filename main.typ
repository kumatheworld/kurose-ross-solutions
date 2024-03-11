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
#set enum(numbering: (it => [R#it. ]))
+ A host and an end system are the same thing. Phones or laptops connected to the Internet are examples of end systems. A Web server is also an end system.
+ #quote(block: true, attribution: link("https://en.wikipedia.org/wiki/Protocol_(diplomacy)"))[Protocol is commonly described as a set of international courtesy rules. These well-established and time-honored rules have made it easier for nations and people to live and work together. Part of protocol has always been the acknowledgment of the hierarchical standing of all present. Protocol rules are based on the principles of civility.—Dr. P.M. Forni on behalf of the International Association of Protocol Consultants and Officers.]
== Problems
#set enum(numbering: (it => [P#it. ]))
== Wireshark Lab

= Application Layer
= Transport Layer
= The Network Layer: Data Plane
= The Network Layer: Control Plane
= The Link Layer and LANs
= Wireless and Mobile Networks
= Security in Computer Networks
