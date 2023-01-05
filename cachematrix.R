#Makes 2 functions that when the first function is used it makes a cache.Rdat file on your computer of the variables cache_save and
#cache_solved to be referenced elsewhere in the functions

#Makes cache_save and cache_solved variables of x for later use, then saves it to a cache.Rdat file on the computer

makeCacheMatrix <- function(x = matrix()){
  cache_save<-x #save a variable named cache_save for future use with cache_Solve function
  cache_solved<-solve(x)
  save(c(cache_save,cache_solved),file = "cache.Rdata") #saves the cache_save function to a local file called "cache.Rdat"
}
#loads the cache.Rdata file on the computer created by the makeCacheMatrix function. it first checks to see if what your comparing is the same
#as the one saved, if it is, returns x solved without needing to solve it. if its not solved then it solves x, saves the new variables to the 
#same cache folder. then prints X

cacheSolve <- function(x){ #function to inverse x
  load("cache.Rdata") #load the cache.Rdat file where cache_save and cache_solved variable are saved
  if(cache_save == x){ #compairs if cache_saved is the same as x, if true then returns the cache_solved variable
    cache_solved
  }
  else{ #if x is not a saved variable, then solves x, and saves the pre solved, and post solved variable to there own variables
    cache_save<-x
    cache_solved<-solve(x)
    save(c(cache_save,cache_solved),file = "cache.Rdata")
    cache_solved
  }
}