
# Informações sobre comandos docker

# docker container —help  lista todos os comandos para usar no docker
# docker container ls —help` lista de containers
# docker ps -a` containers que estão parados
# Criar e excluir container e image:
# docker container create —name teste alpine` criando container teste
# docker container rm teste`  Remover container (teste é o nome da container)
# docker image ls alpine` listar image
# docker rmi alpine`  remover image
#docker container start (nome do container)  para startar um container (deixar up) 
#docker container attach (nome do container)  
#docker container start -ia (nome container)` um atalho para startar e conectar ao container
#`docker container run -it —name teste alpine sh` MAIS RÁPIDO para criar container e startar e conectar em um comando só