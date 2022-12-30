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