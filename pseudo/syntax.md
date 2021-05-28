# general component defined by:
## name
## ./i/... input namespace
## ./o/... output namespace

# each composite component is a general component with 4 namespaces
## ./ relative referece to _this_ component
## ./i/N relative reference to input namespace of _this_ component
## ./o/N relative reference to output namespace of _this_ component
## ./c/N relative reference to composition (component ; child) namespace of _this_ component
## ./x/N relative reference to connection space
## (N is a number 1 .. )

# each link component is a general component

# ? 
## means undefined in this file, loader fixes this up later

# { ... }
## means _bag_
