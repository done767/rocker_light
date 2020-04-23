mkdir tar
docker commit rocker rocker/rstudio:ds
docker save   rocker/rstudio:ds > tar/rocker.tar
