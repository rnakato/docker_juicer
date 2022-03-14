for tag in 2021.12 #latest # 1.5.7
do
   docker build -t rnakato/juicer:$tag .
   docker push rnakato/juicer:$tag
done
