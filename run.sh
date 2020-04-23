#sudo chmod 777 /private/tmp

docker stop rocker 
docker rm   rocker

open http://localhost:8787
docker run -d --restart always -v $(pwd)/share:/home/rstudio/kitematic --name rocker -p 8787:8787 -e DISABLE_AUTH=true rocker/rstudio

docker cp library/install.R rocker:/home/
docker exec -it rocker Rscript /home/install.R

docker cp library/install.sh rocker:/home/
docker exec -it rocker chmod 777 /home/install.sh
docker exec -it rocker /bin/bash /home/install.sh
