for tag in #latest 2022.04 #2021.12 # 1.5.7
do
   docker build -t rnakato/juicer:$tag .
   docker push rnakato/juicer:$tag
done

for tag in 1.6
do
    docker build -f Dockerfile.$tag -t rnakato/juicer:$tag .
    docker push rnakato/juicer:$tag
done
