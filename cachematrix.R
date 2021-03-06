## Put comments here that give an overall description of what your
## functions do

## The functions are using lexicall scoping
## for caching data for future use

## Write a short comment describing this function

## Function creates list of functions to operate on matrix x and matrix m
## which is an inverted matrix x. m is stored using operator <<-
## in function makeCacheMatrix environment, it is in enclosing environment
## of functions created by makeCacheMatrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() {x}
  setinverse <- function(inverted) {m <<- inverted}
  getinverse <- function() {m}
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}


## Write a short comment describing this function

## cacheSolve uses "matrix" created in makeCacheMatrix.
## Actually it uses functions stored in object created by makeCacheMatrix
## on data stored in makeCacheMatrix environment.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  im <- x$getinverse()
  if(!is.null(im)) {
    message("Getting cached data")
    return(im)
  }
  data <- x$get()
  im <- solve(data, ...)
  x$setinverse(im)
  im
}
