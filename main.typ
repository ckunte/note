// This is the main file that relies on template.typ for
// settings; available from https://github.com/ckunte/note
// 2025 C Kunte
#import "template.typ": *
#show: note.with(
  logo: "yes",
  title: [On-bottom stability],
  subtitle: [Analysis philosophy],
  author: "C Kunte",
  paper: "a4",
)

// content from here-on

/* 
  things to consider adding here:
  - table of contents (inc. figures and tables)
  - abbreviations and acronyms

  // consider setting heading numbers here-on
  #set heading(numbering: "1.1") 

*/
#pagebreak(weak: true)

#outline(
  indent: 1em, 
  depth: 4,
) // toc

// figures and tables
#context {
  // Count the number of figures of kind "image"
  let fig-count = query(figure.where(kind: image)).len()
  let tbl-count = query(figure.where(kind: table)).len()

  // Only render the outline if there are figures
  if fig-count > 0 {
    outline(
      title: [List of Figures],
      target: figure.where(kind: image),
    )
  }
  // Only render the outline if there are tables
  if tbl-count > 0 {
    outline(
      title: [List of Figures],
      target: figure.where(kind: table),
    )
  }
}

#pagebreak(weak: true)

= Summary

#lorem(100)

#pagebreak(weak: true)

// consider setting heading numbers here-on
#set heading(numbering: "1.1")

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
