roundsOfNo <- 4
whoSaysYes <- "None"
numberOfPossibleNumbers <- 11

pete <- (1:numberOfPossibleNumbers)%*%t(1:numberOfPossibleNumbers)
susan <- sapply(1:numberOfPossibleNumbers, function(i){i+1:numberOfPossibleNumbers})
possibleResults <- upper.tri(susan, diag=T)


saysNo <- function(personalNumbers){
    counts <- table(personalNumbers[possibleResults])
    possibleResults[personalNumbers%in%as.numeric(names(counts[counts==1]))] <<- F
}

for (i in 1:roundsOfNo){
    saysNo(pete)
    saysNo(susan)
}
if (whoSaysYes=="Pete"){
    counts <- table(pete[possibleResults])
    possibleResults[!pete%in%as.numeric(names(counts[counts==1]))] <- F
} else if (whoSaysYes=="Susan"){
    saysNo(pete)
    counts <- table(susan[possibleResults])
    possibleResults[!susan%in%as.numeric(names(counts[counts==1]))] <- F
}
print(which(possibleResults, arr.ind=T))
