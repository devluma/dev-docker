## Introdução

> Tradução para Português do Brasil.

Documentação criada para facilitar a infraestrutura de projetos DevOps da Sysdomotic trabalhando com base nos mais váriados projetos. 
O repositório contém uma estrutura padrão para a criação de projetos utilizando containers do [Docker](https://www.docker.com/get-started) e [Docker Compose](https://docs.docker.com/compose/) para criação de ambientes de desenvolvimento, o projeto não foi testado em ambiente de produção utilizando totalmente o Docker em produção.

> Se quiser contribuir faça um `FORK` do projeto ou crie uma `FEATURE` e nos ajude a implementar :blush:

| Menu                                                    | Descrição                                                       |
| :------------------------------------------------------ | :-------------------------------------------------------------- |
| [Introdução](#introdução)                               | Introdução do projeto.                                          |
| [Arquitetura de Diretórios](#arquitetura-de-diretórios) | Arquitetura de Diretórios.                                      |
| [Instalação](#instalação)                               | Como instalar os pacotes nescessários para o projeto funcionar. |
| [Lista de Pacotes](#lista-de-pacotes-finalizados)       | Pacotes de containers que já estão funcionando no Docker.       |
| [Como usar](#modo-de-usar)                              | Como usar os comandos no terminal.                              |
| [Contribuições](#contribuições)                         | Como contribuir com o projeto.                                  |
| [Licença](#licença)                                     | Termos e licenças do projeto.                                   |

| Legenda | Descrição                                |
| :-----: | :--------------------------------------- |
|    💥   | São configurações da máquina local.     |
|    🚀   | São configurações do servidor de cloud. |
|    ⛔   | Será nescessário dar permissão.         |
|    ✔    | È nescessário instalar.                 |
|    ✘    | Não é nescessário instalar.             |
|    ☂    | Pode ser instalado independente.        |
|    📌   | È um Submódulo do GIT.                  |

## Arquitetura de Diretórios

O respositório foi estruturado da seguinte maneira:

```bash
docker/ >> # Diretório principal
└── bin/ >> # Diretório dos scripts em shell
│   ├── build.sh >> # Ajuda por linha de comando para dar deploy na aplicação
│   ├── exec.sh >> # Ajuda por linha de comando para executar comandos no container
│   └── start.sh >> # Ajuda por linha de comando para criar um novo projeto dentro do ambiente do Docker
└── htdocs/ >> # Diretório das aplicações web com exemplos de arquitetura usando separação em micro serviços
│   ├── app.local/ >> # Diretório de espelhamento dos fontes de uma aplicação web
│   └── api.local/ >> # Diretório de espelhamento dos fontes de uma aplicação api
└── src/ >> # Diretório dos scripts para montar os containers do Docker usando o docker-compose e arquivos Dockerfile
│   ├── builds/ >> # Diretório com os scripts de build dos containers
│   │   ├── mariadb/ >> # Diretório com o script para subir um banco de dados mariadb
│   │   │   ├── configs/ >> # Diretório com as configurações do mysql
│   │   │   ├── init.d/ >> # Diretório com os scripts de inicialização do mariadb
│   │   │   └── Dockerfile >> # Script utilizado pelo docker-composer para subir uma máquina com o mariadb
│   │   ├── mongodb/ >> # Diretório com o script para subir um banco de dados mongodb
│   │   │   ├── init.d/ >> # Diretório com os scripts de inicialização do mongodb
│   │   │   └── Dockerfile >> # Script utilizado pelo docker-composer para subir uma máquina com o mongodb
│   │   ├── nginx/ >> # Diretório com o script para subir um load balance com o nginx
│   │   │   ├── sites/ >> # Diretório com as configurações de vhosts utilizados pelo nginx para fazer os roteamentos das aplicações
│   │   │   └── Dockerfile >> # Script utilizado pelo docker-composer para subir uma máquina com o nginx
│   │   ├── php-fpm/ >> # Diretório com o script para subir uma aplicação usando o php
│   │   │   ├── configs/ >> # Diretório com as configurações das libs utilizadas no php
│   │   │   ├── docker-entrypoint.sh >> # Script para executar na inicialização do container php
│   │   │   └── Dockerfile >> # Script utilizado pelo docker-composer para subir uma máquina com o php-fpm
│   │   ├── postgresql/ >> # Diretório com o script para subir um banco de dados postgresql
│   │   │   ├── init.d/ >> # Diretório com os scripts de inicialização do postgresql
│   │   │   └── Dockerfile >> # Script utilizado pelo docker-composer para subir uma máquina com o postgresql
│   │   └── redis/ >> # Diretório com o script para subir uma aplicação de consulta avançada com o redis
│   │   │   ├── configs/ >> # Diretório com as configurações do redis
│   │   │   ├── init.d/ >> # Diretório com os scripts de inicialização do redis
│   │   │   └── Dockerfile >> # Script utilizado pelo docker-composer para subir uma máquina com o regis
│   └── bundles/ >> # Diretório com os arquivos de módulos externos
│       └── docker-elk/ >> # Submodulo elastic-elk do https://github.com/deviantony/docker-elk
└── stacks/ >> # Diretório com os arquivos de configurações das stacks pré-configuradas do docker-compose
│   ├── stack-iot-vuejs-postgresql.yml >> # Stack iot com vuejs utilizado pelo docker-compose para montar os containers
│   ├── stack-laravel-angularjs-elk-mariadb.yml >> # Stack laravel-php com angularjs e elasticsearch usado pelo docker-compose
│   ├── stack-laravel-angularjs-postgresql.yml >> # Stack laravel-php com angularjs utilizado pelo docker-compose para montar os containers
│   └── stack-nodejs-reactjs-mongodb.yml >> # Stack nodejs com reactjs utilizado pelo docker-compose para montar os containers
└── storage/ >> # Diretório com para guardar os logs e os dados dos volumes dos containers criados
│   ├── data/ >> # Diretório com os registros de cada volume do container montado
│   └── logs/ >> # Diretório com os logs de cada container montado
└── wiki/ >> # Diretório com a documentação do projeto
├── .env >> # Variáveis de ambiente para usar na montagem dos containers
├── .gitignore >> # Lista de ignore utilizado pelo GIT
├── .gitmodules >> # Lista de submodules utilizados pelo GIT
├── docker-compose-run >> # Comandos para ajudar no desenvolvimento
├── docker-compose.yml >> # Stack padrão com todos os serviços ativos utilizado pelo docker-compose para montar os containers
├── env-example >> # Exemplo com as variáveis de ambiente para usar no .env do projeto
├── LICENSE >> # Arquivo com a descrição da licença do projeto
└── README.md >> # Arquivo com as markdowns da documentação principal do projeto
```

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
     * Use o modo `SINGLE` para desativar o modo de produção e evitar verificações de inicialização.
     * [Mais detalhes](https://www.elastic.co/guide/en/elasticsearch/reference/current/bootstrap-checks.html)

+ Comandos em `SHELL` para facilitar o uso na criação e execução dos ambientes de desenvolvimento e deploy: ✘ 💥 🚀 ⛔
     * Uma lista de comandos para facilitar o uso na criação de seus projetos no dia-dia do desenvolvimento de suas soluções devops.
     * Crie rápidamente um ambiente totalmente focado em micro serviços e devops.
     * [Mais detalhes](#modo-de-usar)

## Modo de Usar

Lista de comandos em shell script para ajudar o desenvolvedor com os projetos utilizando o docker-compose.

```bash
# Script Run Docker Compose: 
docker-compose-run create nodejs reactjs mongodb
docker-compose-run down --all

# Script Run Start Project:
sh bin/start.sh create --project-name=sys-home --stack=mqtt-nodejs-postgresql
sh bin/start.sh clone https://github.com/devluma/dev-docker.git --name=docker-local
sh bin/start.sh submodule --package-url=https://github.com/deviantony/docker-elk --name=docker-elk

# Script Run Exec Command with Project:
sh bin/exec.sh bash docker_php php -V
sh bin/exec.sh bash docker_php composer install
sh bin/exec.sh bash docker_reactjs yarn install

# Script Run Exec Build Project with Product:
sh bin/build.sh build --dir=dist
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

#### Docker CLI e HELP DEV:
- [ ] **Docker Compose Run CLI** ```docker-compose-run <option> <container or stack>```
- [ ] **Start Command CLI** ```sh bin/start.sh <option> <repository>```
- [ ] **Exec Command CLI** ```sh bin/exec.sh <option> <container> <command>```
- [x] **Docker and Docker Compose CLI** ```docker-compose up -d --build nginx php redis postgresql```

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