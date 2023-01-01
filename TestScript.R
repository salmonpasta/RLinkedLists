source("global.R", encoding = "utf-8")

q <- Queue$new()
q$add(88)
q$add(1)
print(q$remove())
print(q$isEmpty())

q2 <- Queue$new(3)
q2$add(6)

q$addQueue(q2)

qEmpty <- Queue$new()
qEmpty2 <- Queue$new()
qEmpty2$addQueue(qEmpty)
qEmpty2$getLength()
qEmpty$getLength()
q2$addQueue(qEmpty)
q2$print()
qEmpty$print()
qEmpty$addQueue(q2)
qEmpty$getLength()
qEmpty$print()


q3 <- q2

while(!is.null(q3$peek())){
  print(q3$remove())
}

#Test prime Queue
qK <- primeGenerator$new()
qK$addPrime()
qK$selectPrime()
qK$reset()
qK$selectPrime()
qK$printPrimes()
debug(qK$selectPrime())
