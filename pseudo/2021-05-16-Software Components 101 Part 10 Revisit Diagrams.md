---
layout: post
title:  "Software Components 101 - Part 10 - Revisit Diagrams"
---
We go back to the top and iterate the design.

 We chopped the diagrams down during development testing.
 
The diagrams, currently, show only the [fill in empty runnable] layer. 

The [fill in empty runnable] is called "z".

We need to add 2 more layers to the diagram - "v" and "v/y".

We prefix _all_ existing references with "v/y/z/" in the current set of diagrams (`diagrams.opml` and the `.cod` file).

[In a non-bootstrap version we would not allow diagrams nested inside of diagrams (they would be drawn in separate diagrams), hence, the name-nesting, v/y/z/..., would not be needed]


<script src="https://utteranc.es/client.js" 
        repo="guitarvydas/guitarvydas.github.io" 
        issue-term="pathname" 
        theme="github-light" 
        crossorigin="anonymous" 
        async> 
</script> 
