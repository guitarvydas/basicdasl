# a
## b
### c
## d
# e

(a (b (c)) (d) e)

# a
## b
## c
## d
### e
# f

(a 
 (b) 
 (c) 
 (d 
  (e)) 
 f)

# a
## b
### b2
## c
## d
### e
# f

(
 (a 
  (b
   (b2))
  (c) 
  (d 
   (e)))
 (f)
 )

# a -> open 1 ; emit "(a"
## b -> open 1 ; emit "(b"
### b2 -> open 1 ; emit "(b2"
## c -> close 2, emit "))" ; open 1 ; emit "(c"
## d -> close 1, emit ")" ; open 1; emit "(d"
### e -> open 1 ; emit "(e"
# f -> close 2, emit "))" ; open 1; emit "(f"
end -> close 2, emit "))"

block = 0

# a
open "("
block := 1
emit "a"

## b
open "("
block := 2
emit "b"

### b2
open "("
block := 3
emit "b2"

## c
close 3-2 ")"
close 2-2 ")"
emit "c"

## d
open "("
block := 2
emit "d"

### e
open 



"(a"  in block 1
"(b"  in block 2
"(b2" in block 3
close block 3,2 ")"



# a
## b
### b2
## c
## d
### e
# f

depth := 0
depth := 1
depth := 2
depth := 3
depth := 2
depth := 2
depth := 3
depth := 1
depth := 0

depth := 0
(
 a
depth := 1
 (
  b
depth := 2
  (
   b2
depth := 3
   )
  c
depth := 2
  d
depth := 2
  (
   e
depth := 3
   )
  )
 f
depth := 1
)
depth := 0

(a (b (b2) c d (e)) f)
