# A queue ---------------------------------------------------------
Queue <- R6Class("Queue",
                 public = list(
                   initialize = function(...) {
                     for (item in list(...)) {
                       self$add(item)
                     }
                   },
                   add = function(x) {
                     if(is.null(private$head)){
                       private$head <- node$new(x)
                       private$tail <- private$head
                     } else {
                       tmp <- node$new(x)
                       private$head$nxt <- tmp
                       private$head <- tmp
                     }
                     private$length <- private$length + 1
                     invisible(self)
                   },
                   addQueue = function(Q) {
                     if(is.null(private$head)){
                       self <- Q
                     } else {
                       private$head$nxt <- Q$getTail()
                       private$tail <- private$head
                       tmp <- node$new(x)
                       private$head$nxt <- tmp
                       private$head <- tmp
                     }
                     private$length <- private$length + 1
                     invisible(self)
                   }
                   remove = function() {
                     if (private$length == 0) return(NULL)
                     # Can use private$tail for explicit access
                     value <- private$tail$val
                     if(identical(private$head,private$tail)){
                       private$head <- NULL
                       private$tail <- NULL
                     }else{
                       private$tail <- private$tail$nxt
                     }
                     private$length <- private$length - 1
                     value
                   },
                   peek = function() {
                     if (private$length == 0) return(NULL)
                     # Can use private$tail for explicit access
                     value <- private$tail$val
                     value
                   },
                   isEmpty = function() {
                     return(private$length == 0)
                   }
                 ),
                 getTail = function() {
                   return(private$tail)
                 },
                 getHead = function() {
                   return(private$head)
                 },
                 private = list(
                   head = NULL,
                   tail = NULL,
                   length = 0
                 )
)