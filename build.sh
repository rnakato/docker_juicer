tag=1.5.7
docker build -f Dockerfile.$tag -t rnakato/juicer:$tag .
docker push rnakato/juicer:$tag

tag=1.6.1
#docker build -f Dockerfile.1.6 -t rnakato/juicer:$tag .
#docker push rnakato/juicer:$tag

docker tag rnakato/juicer:1.6.1 rnakato/juicer:latest
docker push rnakato/juicer:latest

exit

for tag in #latest 2022.04 #2021.12 # 1.5.7
do
   docker build -t rnakato/juicer:$tag .
   docker push rnakato/juicer:$tag
done

for tag in 1.6.1
do
    docker build -f Dockerfile.1.6 -t rnakato/juicer:$tag .
    docker push rnakato/juicer:$tag
done
