## Put comments here that give an overall description of what your
## functions do

## MakeCacheMatrix function creates a special “matrix” object

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
          set <- function(y) {
            x <<- y
            i <<- NULL
          }
          get <- function() x
          setinverse <- function(inverse) i <<- inverse
          getinverse <- function() i
          list(set = set,
               get = get,
               setinverse = setinverse,
               getinverse = getinverse)
}


## Cachemean function computes the inverse of the special “matrix”. Return a matrix that is the inverse of 'x'

cacheSolve <- function(x, ...) {
        m <- x$getmean()
          if(!is.null(m)) {
            message("getting cached data")
            return(m)
          }
          data <- x$get()
          m <- mean(data, ...)
          x$setmean(m)
          m
}
