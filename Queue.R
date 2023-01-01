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
                       private$tail$nxt <- tmp
                       private$tail <- tmp
                     }
                     private$length <- private$length + 1
                     invisible(self)
                   },
                   addQueue = function(Q) {
                     if(is.null(private$head)){
                       private$head <- Q$getHead()
                       private$tail <- Q$getTail()
                     } else {
                       if(!Q$isEmpty()){
                         temp <- Q$getHead()
                         private$tail$nxt <- temp
                         private$tail <- Q$getTail()
                         }
                     }
                     private$length <- private$length + Q$getLength()
                     invisible(self)
                   },
                   remove = function() {
                     if (private$length == 0) return(NULL)
                     # Can use private$headfor explicit access
                     value <- private$head$val
                     if(identical(private$head,private$tail)){
                       private$head <- NULL
                       private$tail<- NULL
                     }else{
                       private$head<- private$head$nxt
                     }
                     private$length <- private$length - 1
                     value
                   },
                   peek = function() {
                     if (private$length == 0) return(NULL)
                     # Can use private$headfor explicit access
                     value <- private$head$val
                     value
                   },
                   print = function() {
                     toPrint <- "<head>"
                     if(!is.null(private$head)){
                       current.node <- private$head
                       while(!is.null(current.node)){
                         toPrint <- paste(toPrint, current.node$val)
                         current.node <- current.node$nxt
                       }
                     }
                     return(paste(toPrint, "<tail>"))
                   },
                   isEmpty = function() {
                     return(private$length == 0)
                   },
                   getTail= function() {
                     return(private$tail)
                   },
                   getHead = function() {
                     return(private$head)
                   },
                   getLength = function() {
                     return(private$length)
                   }),
                 
                 private = list(
                   head = NULL,
                   tail = NULL,
                   length = 0
                 )
)