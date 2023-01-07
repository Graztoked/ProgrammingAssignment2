#These Functions let you solve an inverted matrix, caches it, to be called up later.
#Drastic change from first version after feedback and sugestions.

#MakeCacheMatrix sets up variables that can be used for saving the solved matrix, as well as the inverse matrix.

makeCacheMatrix <- function(x = matrix()) {
  inv <- matrix()
  set <- function(y) {
    x <<- y
    inv <<- matrix()
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}


## Calculates the inverse of the "matrix" created above 
## and stores it in the cache if not already calculated; 
## if in the cache already, the function gets the inverse

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.na(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
