##these functions will create a special object that stores a numeric matrix and 

## Write a short comment describing this function
##this is the function that creates a special matrix object that can cache an inverse

makeCacheMatrix <- function(x = matrix()) {
}

## Write a short comment describing this function
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