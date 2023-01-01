source("global.R", encoding = "utf-8")


# Set User Parameters
N <- 600851475143


# Initialise the Prime Generator
pG <- primeGenerator$new()
rem <- N
prime.factor.max <- -1


# Run

if(N==1) {
  print("N=1 has not prime factors!")
}

while(rem!=1 && N!=1) {
  current.prime <- pG$selectPrime()
  if(identical(rem%%current.prime,0)){
    pG$reset()
    rem <- rem / current.prime
  }
}

pG$printPrimes()

print(paste("The largest prime factor is: ", current.prime))
