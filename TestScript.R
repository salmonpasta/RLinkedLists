source("global.R", encoding = "utf-8")

q <- Queue$new(5)
q$add(88)
q$add(1)
print(q$remove())
print(q$isEmpty())

q2 <- Queue$new(3)
q2$add(6)

q$addQueue(q2)

q3 <- q2

while(!is.null(q3$peek())){
  print(q3$remove())
}
