/*
  Template for technical note (or paper)
  https://github.com/ckunte/note
  2025 C Kunte
*/
#let note(
  // title of note (or paper)
  title: none,

  // author of the note (or paper)
  author: none,

  // paper size:
  paper: none,

  // content of the note (or paper)
  body,
) = {
  // metadata for the note (or paper)
  set document(title: title, author: author)

  // page properties
  set page(
    paper: paper,

    // page numbering style
    numbering: "1", // alternately "1 of 1"

    // set margins based on paper size
    margin: if paper == "a5" {
      (x: 0.75in, y: 0.75in, top: 0.9in)
    } else {
      (x: 1.0in, y: 1.0in, top: 1.25in)
    },

    header: context {
      // set custom header: make title appear on even pages
      if calc.even(counter(page).get().first()) { 
        emph(title) 
      } else { none }

      //// set custom header: make title appear on odd pages other than the first
      //  if counter(page).get().first() > 1 and calc.odd(counter(page).get().first()) {
      //   emph(title) 
      //  } else { none }

      // make section appear on odd pages other than the first
      let page-num = counter(page).get().first()
      if page-num > 1 and calc.odd(page-num) {
        let headings = query(heading)
        let curr-heading = none
        let found = false

        for heading-elem in headings {
          if heading-elem.location() != none and heading-elem.location().page() == page-num {
            curr-heading = heading-elem.body
            found = true
          } else if heading-elem.location() != none and heading-elem.location().page() < page-num {
            curr-heading = heading-elem.body // keep track of the last heading on a prev page
          } else if found { break } // stop once we have moved past the curr page
        }
        align(right, emph(curr-heading))
      } else { none }    
    }, // context ends
  )

  // font properties
  set text(
    font: "Segoe UI", // e.g. "STIX Two Text" or "erewhon",
    top-edge: "cap-height", 
    bottom-edge: "baseline",
    number-type: "old-style",
    size: if paper == "a5" { 11pt } else { 12pt },
  )

  // small caps
  let sc(content) = text(features: ("c2sc",))[#content]
  show regex("[A-Z]{2,}"): match => {
    sc(match)
  }

  // paragraph properties
  set par(
    spacing: 0.65em, 
    leading: 0.65em, 
    first-line-indent: 12pt, 
    justify: true
  )

  // raw text (or code)
  show raw: set text(size: 7.5pt)

  // table properties
  show figure.where(
    kind: table
  ): set figure.caption(position: top)

  // table stroke and row height
  set table(
    stroke: none,
    row-gutter: -0.5em
  )

  // emphasise caption
  show figure.caption: emph

  // equation numbers
  // // set math.equation(numbering: "(1)")
  // show math.equation: set block(spacing: 0.65em)
  // // Configure appearance of equation references
  // show ref: it => {
  //   if it.element != none and it.element.func() == math.equation {
  //     // Override equation references.
  //     link(it.element.location(), numbering(
  //       it.element.numbering,
  //       ..counter(math.equation).at(it.element.location())
  //     ))
  //   } else {
  //     // Other references as usual.
  //     it
  //   }
  // }

   // link properties
  show cite: set text(fill: maroon) // set cite colour
  show ref: set text(fill: rgb(0, 0, 128)) // set reference colour
  show link: set text(fill: rgb(0, 0, 255)) // set link colour
  show link: underline

  // colour terms
  show regex("tb[a,c,d,u]"): set text(fill: red, style: "italic") // for to-be-[added/advised, confirmed, determined, updated]

  // block quote properties
  set quote(block: true)
  show quote: set text(style: "italic")

  // print title block (includes title, author, and date)
  align(center)[
    #text(1.8em)[*#title*]
    #v(2em, weak: true)
    #text(1em, author)
    #v(1em, weak: true)
    #datetime.today().display("[month repr:long] [day], [year]")
    #v(5em, weak: true)
  ]

  // // numbering headings
  // set heading(numbering: "1.1") // set heading numbers here-on

  //
  body
}
/*

// import this template into, say, main.typ like so, and edit
// details (e.g. paper, title, and author): as required:

#import "template.typ": *
#show: note.with(
  paper: "a5",
  title: [A technical note],
  author: "C Kunte",
)
// content from here-on

*/