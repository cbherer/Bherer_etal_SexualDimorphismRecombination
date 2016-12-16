# ----------------------------------------------------------------------------------------
# interpolate_maps.R

# ----------------------------------------------------------------------------------------
library(intervals)


# ----------------------------------------------------------------------------------------
getRate <- function(map, intI) {
    # get recombination rate in cM/Mb for a given map and interval
    rr1 <- approx( map$pos, map$cM, xout=intI[,1] )
    rr2 <- approx( map$pos, map$cM, xout=intI[,2] )
    rate <- (rr2$y-rr1$y) / ((rr2$x-rr1$x)/1000000) # cM/Mb
    return(rate)
}


# ----------------------------------------------------------------------------------------
binGenome_per_chr <- function(chr, bsize, rm.gaps=TRUE ) {
    # zero-based indexing, half open intervals
    bpr <- c(1,genomeData$nbases[ genomeData$chrom==chr ] )
    bpr[1] <- bpr[1] - bpr[1]%%bsize
    bpr[2] <- bpr[2] + (bsize - bpr[2]%%bsize)
    x <- seq(bpr[1],bpr[2],by=bsize)
    seqbinI <- Intervals( cbind(x[-length(x)],x[-1]), closed=c(TRUE,FALSE), type="Z" )
    if(rm.gaps) 
    {
        gapI <- with( gap[gap$chrom==chr,], {
    	    Intervals(cbind(chromStart, chromEnd), closed=c(TRUE,FALSE), type="Z" )})
        ol <- unlist(interval_overlap(from=gapI, to=seqbinI))
        if(length(ol)>0) seqbinI <- seqbinI[-ol, ]
    }
    return(seqbinI)
}
# ----------------------------------------------------------------------------------------
