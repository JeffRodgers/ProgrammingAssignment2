## Below are two functions that create an object that stores
## a matrix and cache's the inverse of the matrix 

## The function below creates an object 'matrix' that is a list 
## containing functions set the value of the matrix, get the value
## of the matrix, set the value of the inverse and get the value of 
## the inverse

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsol <- function(solve) s <<- solve
  getsol <- function() s
  list(set = set, get = get,
       setsol = setsol,
       getsol = getsol)
}


## The following function caluculates the inverse of the object 'matrix'
## if a cached value does not exist, otherwise it returns the cached value

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  s <- x$getsol()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsol(s)
  s
}
