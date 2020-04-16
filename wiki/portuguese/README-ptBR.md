> Tradução para Português do Brasil.

## Introdução

Documentação criada para facilitar a infraestrutura de projetos DevOps da Sysdomotic trabalhando com base nos mais váriados projetos. 
O repositório contém uma estrutura padrão para a criação de projetos utilizando containers do [Docker](https://www.docker.com/get-started) e [Docker Compose](https://docs.docker.com/compose/) para criação de ambientes de desenvolvimento, o projeto não foi testado em ambiente de produção utilizando totalmente o Docker em produção.

> Se quiser contribuir faça um `FORK` do projeto ou crie uma `FEATURE` e nos ajude a implementar :blush:

| Menu                                               | Descrição                                                       |
| :------------------------------------------------- | :-------------------------------------------------------------- |
| [Introdução](#introdução)                          | Introdução do projeto.                                          |
| [Instalação](#instalação)                          | Como instalar os pacotes nescessários para o projeto funcionar. |
| [Lista de Pacotes](#lista-de-pacotes-finalizados)  | Pacotes de containers que já estão funcionando no Docker.       |
| [Como usar](#modo-de-usar)                         | Como usar os comandos no terminal.                              |
| [Contribuições](#contribuições)                    | Como contribuir com o projeto.                                  |
| [Licença](#licença)                                | Termos e licenças do projeto.                                   |

| Legenda | Descrição                                |
| :-----: | :--------------------------------------- |
|    💥   | São configurações da máquina local.     |
|    🚀   | São configurações do servidor de cloud. |
|    ⛔   | Será nescessário dar permissão.         |
|    ✔    | È nescessário instalar.                 |
|    ✘    | Não é nescessário instalar.             |
|    ☂    | Pode ser instalado independente.        |
|    📌   | È um Submódulo do GIT.                  |

## Instalação

Para executar o docker para este projeto, você precisa seguir as seguintes etapas:

+ Instalar `docker` e `docker-compose`: ✔ 💥 ⛔
     * [Para Mac](https://www.docker.com/docker-mac)
     * [Para Windows](https://www.docker.com/docker-windows)
     * Para Ubuntu ```sudo apt-get install -y docker.io docker-compose```

+ Configurações do **`VHOSTS`** no **`WINDOWS`**: ✔ 💥 ⛔
     * Adicione os hosts e configurações no **`Virtualbox`** instalado:
     
         ![Screenshot](https://github.com/devluma/dev-docker/blob/master/wiki/images/docker-virtualbox-conf-windows.png)

     * Adicionar os domínios no arquivo de **`HOSTS`** localizado no diretório: **`C:\Windows\System32\drivers\etc`**
     
         ![Screenshot](https://github.com/devluma/dev-docker/blob/master/wiki/images/docker-hosts-windows.png)
         
+ Configurações do **`VHOSTS`** no **`LINUX`**: ✔ 💥 ⛔
      * `TODO` ~~Precisa configurar o arquivo de **`HOSTS`**~~

+ Configurações do **`VHOSTS`** no **`MAC`**: ✔ 💥 ⛔
      * `TODO` ~~Precisa configurar o arquivo de **`HOSTS`**~~

+ Configurações do `GIT`: ✔ 💥 🚀 ⛔
     * Adicione o `SUBMODULE` no diretório `src/bundles/`
     * ```cd src/bundles/ && git submodule add https://github.com/deviantony/docker-elk.git```
     * ```git config submodule.docker-elk.ignore all```
     * ```git config submodule.src/bundles/docker-elk.ignore all```
     * Adicione configurações de atalho no `.gitconfig` da máquina para facilidar no desenvolvimento das aplicações: ✘ 💥
     * [Mais detalhes](https://github.com/devluma/dev-configs)

+ Pacotes do `Elastic-ELK` no `Docker`: ✘ ☂ 📌 💥 ⛔
     * [deviantony/docker-elk](https://github.com/deviantony/docker-elk)
     * Use single node discovery in order to disable production mode and avoid bootstrap checks.
     * Use o modo `SINGLE` para desativar o modo de produção e evitar verificações de inicialização.
     * [Mais detalhes](https://www.elastic.co/guide/en/elasticsearch/reference/current/bootstrap-checks.html)

+ Comandos em `SHELL` para facilitar o uso na criação e execução dos ambientes de desenvolvimento e deploy: ✘ 💥 🚀 ⛔
     * **docker-compose-run:** ```docker-compose-run <option> <container or stack>```
     * **bin/start:** ```sh bin/start.sh <option> <repository>```
     * **bin/exec:** ```sh bin/exec.sh <option> <container> <command>```
     * **bin/build:** ```sh bin/build.sh <option> <cloud server>```

## Modo de Usar

Lista de comandos em shell script para ajudar o desenvolvedor com os projetos utilizando o docker-compose.

```bash
# Script Run Docker Compose: 
docker-compose-run create nodejs reactjs mongodb
docker-compose-run down all

# Script Run Start Project:
sh bin/start.sh clone https://github.com/devluma/dev-docker.git --name=docker-local

# Script Run Exec Command with Project:
sh bin/exec.sh bash docker_php php -V

# Script Run Exec Build Project with Product:
sh bin/build.sh send aws --user=teste --password=teste

# Docker Containers:  
docker container rm -f $(docker container ls -a -q)
 
# Docker Imagens :      
docker image rm -f $(docker image ls -a -q)
 
# Docker Volumes :      
docker volume rm -f $(docker volume ls -q)
 
# Docker Networks :    
docker network rm $(docker network ls -q)

# Docker Compose Up Containers
docker-compose up -d --build nginx php redis postgresql mariadb mongodb
```

## Lista de Pacotes Finalizados

#### Stacks com os principais banco de dados e otimizadores de consultas:
- [x] **Stack Database** com `postgres`, `mysql`, ou `mongodb`
- [x] **Stack Search Engine** com `elastic-elk`, ou `redis`
- [ ] **Stack IoT** com `graphql`, `mqtt`, `johnny-five`, ou `nodered`

#### Stacks com PHP/LARAVEL:
- [x] **Stack Laravel** com `nginx`, `php-fpm`, e `stack-database`
- [ ] **Stack Laravel/ReactJS** com `nginx`, `php-fpm`, `reactjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack Laravel/AngularJS** com `nginx`, `php-fpm`, `angularjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack Laravel/VueJS** com `nginx`, `php-fpm`, `vuejs`, `stack-database` e/ou `stack-search-engine`

#### Stacks com NODEJS:
- [ ] **Stack NodeJS/ReactJS** com `nginx`, `nodejs`, `reactjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack NodeJS/AngularJS** com `nginx`, `nodejs`, `angularjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack NodeJS/VueJS** com `nginx`, `nodejs`, `vuejs`, `stack-database` e/ou `stack-search-engine`

#### Stacks com PYTHON:
- [ ] **Stack Python/ReactJS** com `nginx`, `django`, `reactjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack Python/AngularJS** com `nginx`, `django`, `angularjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack Python/VueJS** com `nginx`, `django`, `vuejs`, `stack-database` e/ou `stack-search-engine`

#### Stacks com GOLANG:
- [ ] **Stack Go/ReactJS** com `nginx`, `gin-gonic`, `reactjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack Go/AngularJS** com `nginx`, `gin-gonic`, `angularjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack Go/VueJS** com `nginx`, `gin-gonic`, `vuejs`, `stack-database` e/ou `stack-search-engine`

#### Stacks IoT com MQTT:
- [ ] **Stack IoT/ReactJS** com `nginx`, `nodejs`, `reactjs`, `stack-database` e/ou `stack-iot`
- [ ] **Stack IoT/AngularJS** com `nginx`, `nodejs`, `angularjs`, `stack-database` e/ou `stack-iot`
- [ ] **Stack IoT/VueJS** com `nginx`, `nodejs`, `vuejs`, `stack-database` e/ou `stack-iot`

## Contribuições

Pull requests são bem vindos 😁✌. Para grandes mudanças, abra uma **`ISSUE`** primeiro para discutir o que você gostaria de mudar 😉.

1. Fork do Projeto (<https://github.com/devluma/dev-docker/fork>)
2. Criar nova feature branch (`git checkout -b feature/meuPacote`)
3. Comitar suas modificações (`git commit -am 'Adicionado novo pacote de atualizações meuPacote'`)
4. Push na nova branch (`git push origin feature/meuPacote`)
5. Criar um novo Pull Request

> Atualize os testes conforme apropriado e utilize o projeto conforme desejar.
> Utilize o projeto em seu ambiente de desenvolvimento.
> Deixe um :thumbsup: se gostou ou :-1: mas não esqueça de dar um comentário sobre oque você achou do projeto :wink:
> Espero ter contribuído em algum momento no seu aprendizado. ¯\_( ͡• ͜ʖ ͡•)_/¯.

## Licença

O projeto é [MIT](https://choosealicense.com/licenses/mit/)

###### <div align="right">[Voltar](#introdução) ↺</div>