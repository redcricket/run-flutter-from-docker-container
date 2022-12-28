#docker run -itd --name flutter -w /app \
#-v $(pwd):/app \
#flutter
docker run -it -w /app -v $(pwd):/app flutter flutter $@
