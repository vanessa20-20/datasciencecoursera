makeCacheMatrix<- function (x= matrix()) {
              m<-NULL
              set<-function(y){
                  x<<-y
                  m<<-NULL
              }
        get<-function() x 
        setinverse= function (inverse)  m<<- inverse 
        getinverse = function () m
       list (set=set, get=get, setinverse=setinverse, 
             getinverse=getinverse) 
}

cacheSolve<- function (x) {
        m<-x$getinverse()
        if(!is.null(m)) {
          message ("gettin cached data")
          return(m)
        }
        data<-x$get()
        m<-solve(data)
        x$setinverse(m)
        m
}
#to try functions
my_matrix<-matrix(c(1,2,3,4,2,5,6,7,3,6,8,9,4,7,9,10), nrow=4,ncol=4, byrow =TRUE)
z<-makeCacheMatrix(my_matrix)
cacheSolve(z)
