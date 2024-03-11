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
