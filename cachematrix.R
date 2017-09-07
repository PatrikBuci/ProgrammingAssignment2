##these functions will create a special object that stores a numeric matrix and 
##cache's its inverse matrix 

##this is the function that creates a special matrix object that can cache an inverse
##matrix from the input matrix (the input matrix has to be square and not singular of 
##course)
##the output of this function is a list of functions that set the value of a matrix,
##get the value of a matrix, set the inverse matrix and get the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
      slv <- NULL ##setting the inverse matrix to empty object as default
      set <- function(y) {
            x <<- y ##assign a value to an object in parent environment
            slv <<- NULL
      }
      get <- function() x
      setSolve <- function(solve) slv <<- solve
      getSolve <- function() slv
      list(set = set,
           get = get,
           setSolve = setSolve,
           getSolve = getSolve)
}

##the following function use as input the output of makeCacheMatrix (the special matrix
##object). The function first check if the inverse matrix have been already calculated
#(through getSolve() function), if yes it returns the calculated inverse from cache, if
#no it will calculate the inverse (through setSolve() function) by itself and return it 

cacheSolve <- function(x, ...) {
      slv <- x$getSolve()
if (!is.null(slv)) {
      message("getting cached data")
      return(slv)
}
mat <- x$get()
slv <- solve(mat, ...)
x$setSolve(slv)
slv
}
