// This is the main file that relies on template.typ for
// settings; available from https://github.com/ckunte/note
// 2025 C Kunte
#import "template.typ": *
#show: note.with(
  paper: "a4",
  title: [On-bottom stability],
  author: "C Kunte",
)

// content from here-on

/* 
  things to consider adding here:
  - table of contents (inc. figures and tables)
  - abbreviations and acronyms

  // consider setting heading numbers here-on
  #set heading(numbering: "1.1") 

*/
#v(3em)

#outline(
  indent: 1em, 
  depth: 4,
) // toc

#outline(
  title: [List of figures],
  target: figure.where(kind: image), 
) // figures

#outline(
  title: [List of tables],
  target: figure.where(kind: table),
) // tables

// consider setting heading numbers here-on
#set heading(numbering: "1.1")

#v(3em)

= Introduction

#lorem(200)

#lorem(200)

= Criteria for design

#lorem(300)

#lorem(200)

#lorem(200)

#lorem(200)

#lorem(600)

= Design data

#lorem(500)

#lorem(300)

= Analysis method 

#lorem(500)

#lorem(300)

#lorem(500)

#lorem(300)
