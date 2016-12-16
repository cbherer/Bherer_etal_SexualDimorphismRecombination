Bhérer et al. Genetic Maps

This folder contains the genetic maps described in the manuscript 
Bhérer, Campbell & Auton (under review). 

Refined estimates of recombination rates were obtained by applying a new MCMC method
to pedigree-based recombination data as described in the manuscript. 
The implementation of our method is available here: github.com/auton1/rMCMC. 

- The unrefined and refined maps are derived from 3,3 million crossovers 
from 104,246 meioses. 
- The refined European maps are derived from the 97,723 meioses from 
individuals European origins.
- The refined Icelandic map was generated using the data from Kong et al. 2014 (Nature).
Note that in this Icelandic map, data is lacking for ~5Mb at each chromosome ends.

Each tarball contains the female, male and sex-averaged estimates of recombination rate.
Coordinates are in human genome build 37.

Also included is the R script to interpolate recombination rate estimates in bins of 
arbitrary size.

Claude Bhérer 
claudebherer@gmail.com
20160817
