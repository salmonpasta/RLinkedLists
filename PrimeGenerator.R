primeGenerator <- R6Class(
  "primeGenerator",
  public = list(
    initialize = function() {
      private$primes <- Queue$new(2,3,5)
      private$primesDump <- Queue$new()
    },
    addPrime = function(){
      candidate <- private$primes$getTail()
      candidate <- candidate$val + 1
      # print(candidate)
      while(!(private$isPrime(candidate))){
        candidate = candidate + 1
        # print(candidate)
      }
      private$primes$add(candidate)
    },
    selectPrime = function(){
      if(private$primes$getLength()==1){
        # print("flag")
        self$addPrime()
      }
      # print("flag sP")
      temp <- private$primes$remove()
      private$primesDump$add(temp)
      temp
    },
    reset = function(){
      private$primesDump$addQueue(private$primes)
      
      private$primes <- private$primesDump
      private$primesDump <- Queue$new()
    },
    printPrimes = function(){
      #self$reset()
      print("Active Primes: ")
      print(private$primes$print())
      print("Prime Dump: ")
      print(private$primesDump$print())
    }
  ),
  private = list(
    isPrime = function(x){
      for(k in 2:floor(x/2)){
        if(identical(x%%k,0)){
          return(FALSE)
        }
      }
      return(TRUE)
    },
    primes = NULL,
    primesDump = NULL
  )
)
