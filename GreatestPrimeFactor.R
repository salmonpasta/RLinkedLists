source("global.R", encoding = "utf-8")


# Set User Parameters
N <- 600851475143


# Initialise the Prime Generator
pG <- primeGenerator$new()

# Initialise
rem <- N
prime.factors <- Queue$new()
prime.factor.max <- -1


# Run

if(N==1) {
  print("N=1 has not prime factors!")
}

while(rem!=1 && N!=1) {
  current.prime <- pG$selectPrime()
  if(identical(rem%%current.prime,0)){
    pG$reset()
    prime.factors$add(current.prime)
    rem <- rem / current.prime
  }
}

pG$printPrimes()
prime.factors$print()

print(paste("The largest prime factor is: ", current.prime))
