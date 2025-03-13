
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

#Image
# - `docker container run —name nginx-allumy -it alpine sh` Criou um container
#     - comandos dentro do container:
#         - `ls` listar container
#         - `mkdir allumy` criar pasta, `cd allumy` entrar na pasta
#         - `touch docker` criar arquivo dentro da pasta, `ls` verificar arquivo
#         - `echo “TESTE CONTAINER PARA IMAGE” > docker` criar conteudo texto
#         - `cat docker` verificar conteudo de texto
#         - `exit` fecha o container
# - Gerar uma imagem
#     - `docker container commit nginx-allumy nginx-allumy-img` cria uma image dentro de um container
#     - `docker image ls` verifica a image criada
#     - `docker container run -it —rm nginx-allumy-img sh` verifica o container, e após fechar esse container ele é removido
#         - comandos dentro do container: `cd allumy` , `ls` , `cat docker` , `exit`

#Exportando Image / Consultando o histórico de uma imagem /
# - `docker image save —help` rodando esse comando dentro e uma image, verfica as opçoes de comando para exportar
# - `docker image save -o nginx-allumy.tar nginx-allumy-img`  comando para criar um arquivo **.tar**
# - `docker image load —help` verifica os comandos que podem ser usados com load
# - `docker image load -i nginx-allumy.tar`  importar imagem (load)
# - `docker container run -it —rm —name nginx-novo nginx-allumy-img sh`  cria um container utilizando uma imagem ja criada nginx-allumy-img
# docker image history (nome da image) verifica desde o momento que a imagem base foi construida, como ela vem se comportando.

# - Importando imagens a partir de tar files
#     - Criar container modo interativo `docker container run --name teste-export -it ubuntu sh`
#     - Criar um arquivo diretorio  `mkdir allumy` depois, um ctrl+p+q para sair
#     - Gerar um arquivo `docker container export teste-export -o teste-export.tar` , verificar o arquivo `ls teste-export.tar`
#     - Matar o container `docker container rm -f teste-export`
#     - usar a image `docker image teste-export.tar ubuntu-impoortado`, verificar `docker image ls ubuntu-importado`
#     - Rodar um container com a image `docker container run -it ubuntu-importado sh`
    
# - Demais comandos do objeto image (inspect, prune, pull, tag e push)
#     - *Inspect*:   `docker image inspect ubuntu`  é uma ferramenta para ver todas as informações detalhadas sobre a imagem do Docker chamada "ubuntu".
#     - *Prune*:  `docker image prune`  é como um ajudante que limpa as coisas que você não precisa mais, deixando tudo mais arrumado e com mais espaço.
#     - *Pull*: `docker image pull`  é o comando para baixar uma imagem do Docker da internet para o seu computador. Removendo uma image, ele puxa do docker hub, e trás de volta a image que foi removida.
#     - *Tag*: `docker image tag ubuntu allumy/meu-ubuntu:1`  ele pega uma imagem que já existe (a caixa mágica original) e coloca um novo nome ou etiqueta nela, sem criar uma nova caixa.
#     - *Push*: `docker image push ubuntu allumy/meu-ubuntu:1`  é o que você usa para enviar essa imagem para um lugar especial na internet chamado "registro" 
#         (como o Docker Hub). Lá, outras pessoas podem pegar a imagem e usá-la em seus próprios computadores.

#Volume
# - `docker run -it --name alpine-docker -v /data alpine sh`   , `ls`
# cria um container e um arquivo dentro do container
# - Verificar os comandos disponiveis em volume `docker volume --help`
# - Verificar comandos disponiveis do volume `docker volume —help`
# - `docker volume ls` visualizar lista
# - comando para visualizar o volume (local) `docker volume inspect 26adead80a1def1f40453f866c5067b5dc2059fdeff9d68347da9a95bc2ac5bd`

# Exercicio
# 1. `docker container run --name ubuntu-allumy -it ubuntu /bin/bash` criar , dentro do container: rodar # `apt-get update` atualizar a lista de pacotes, #`apt-get install nginx` instalar nginx, #`/etc/init.d/nginx start` inhttps://intranet-homologacao.policiamilitar.mg.gov.br/saude/app/saude/int/fat/cadContaHospitalar.actioniciar servidor, depois sair do servidor sem fechar Ctrl + P + Q,  `docker container inspect ubuntu-allumy`  verificar a porta
# 2. Após criar um container e criar lista de pacotes `docker container commit ubuntu-allumy ubuntu-allumy` rodar esse comando para criar uma image, 
    
#     ![image.png](attachment:f3d718e9-3f7e-4feb-8b85-4702dbd7616b:image.png)
    
# 3. remover o container e image: `docker container rm -f ubuntu-allumy`  `docker image rm ubuntu-allumy`
# 4. recuperar `docker image load -i ubuntu-allumy.tar`  
# 5. Rodar container: `docker container run -it ubuntu-allumy sh`  `/etc/init.d/nginx start`
# 6. verificar se pegou o IP e se funcionar o acesso: docker container inspect (nome do container)