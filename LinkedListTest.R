library(R6)

# Node Constructor
node <- R6Class(
  "Node",
  list(
    val = NULL,
    nxt = NULL,
    initialize = function(val = NULL, 
                          nxt = NULL){
      self$val <- val
      self$nxt <- nxt
    }
  )
)

# Make our Nodes
a <- node$new(val = "a")
b <- node$new(val = "b")
c <- node$new(val = "c")
d <- node$new(val = "d")

# Link them together
a$nxt <-  b
b$nxt <-  c
c$nxt <-  d
