# Sysdomotic
* Docker
* Project building
* Timezone UTC (PHP, MySql, HTTPD, ... and OS)

## Documentation to create a development environment or production projects
 
To run the docker for this project, you need to follow the steps:
 
+ Install docker and docker-compose:
     * [For Mac](https://www.docker.com/docker-mac)
     * [For Windows](https://www.docker.com/docker-windows)
     * For Ubuntu `$ sudo apt-get install -y docker.io docker-compose`

***

- Rename <project-name>-<version> to using name your especific project
- Create the structure of the project, taking care that each item is a different project:

        $ mkdir <project-name>-<version>
        $ cd <project-name>-<version>
        $ git clone https://<gituser>@bitbucket.org/<company-name>/<project-name>-<version>.git crm
        $ git clone https://<gituser>@bitbucket.org/<company-name>/<project-name>-docker.git docker
        
Expected result:

        <version>
          |-- <project-name>
          |   |-- <project-name> Structure
          |-- bundle-services
          |   |-- Other Services Structure
          |-- docker

***

* After downloading everything the structure of the project should be:

        <version>
          |-- <project-name>
          |   |-- <project-name> Structure
          |-- bundle-services
          |   |-- Other Services Structure
          |-- docker
          |   |-- build
          |   |   |-- centos6.9
          |   |   |   |-- packages
          |   |   |   |   |-- Structure Packages
          |   |   |   |-- repos.d
          |   |   |   |   |-- Structure Repositories
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- httpd
          |   |   |   |-- configs
          |   |   |   |   |-- httpd.conf
          |   |   |   |-- scripts
          |   |   |   |   |-- info.php
          |   |   |   └-- Dockerfile
          |   |   |-- mysql
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- nginx
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- nodejs
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- redis
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   └-- docker-compose.yml
          |   └-- exec.sh

***

* To start the servers:

        $ cd docker
        $ docker-compose up -d --build
        $ docker-compose ps
        $ docker exec -it <mycontainer> bash
        $ docker docker exec -it <mycontainer> /bin/sh /tmp/init.sh

***

+ Access:
     * CRM: http://localhost:10080/
     + MySql:
          * host: 127.0.0.1
          * user: <myproject>
          * pass: secret
          * base: <myproject>
          * port: 13306

***

# Tradução
 
## Documentação para criar ambiente de desenvolvimento e produção dos projetos

Para executar o docker para este projeto, você precisa seguir as etapas:

+ Instalar docker e docker-compose:
     * [Para Mac](https://www.docker.com/docker-mac)
     * [Para Windows](https://www.docker.com/docker-windows)
     * Para Ubuntu $sudo apt-get install -y docker.io docker-compose

***

- Renomeie <nome-projeto>-<versao> para usar o nome do seu projeto específico
- Criar a estrutura do projeto, cuidado para que cada item seja um projeto diferente:

        $ mkdir <nome-projeto>-<versao>
        $ cd <nome-projeto>-<versao>
        $ git clone https://<usuariogit>@bitbucket.org/<nome-empresa>/<nome-projeto>-<versao>.git crm
        $ git clone https://<usuariogit>@bitbucket.org/<nome-empresa>/<nome-projeto>-docker.git docker

Resultado esperado:

        <versao>
          |-- <nome-projeto>
          |   |-- Estrutura do projeto
          |-- bundle-services
          |   |-- Estrutura dos serviços externos
          |-- docker

***

* Depois de baixar tudo a estrutura do projeto deve ficar:

        <versao>
          |-- <nome-projeto>
          |   |-- Estrutura do projeto
          |-- bundle-services
          |   |-- Estrutura dos serviços externos
          |-- docker
          |   |-- build
          |   |   |-- centos6.9
          |   |   |   |-- packages
          |   |   |   |   |-- Estrutura dos pacotes do centos
          |   |   |   |-- repos.d
          |   |   |   |   |-- Estrutura dos repositórios do centos
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- httpd
          |   |   |   |-- configs
          |   |   |   |   |-- httpd.conf
          |   |   |   |-- scripts
          |   |   |   |   |-- info.php
          |   |   |   └-- Dockerfile
          |   |   |-- mysql
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- nginx
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- nodejs
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   |   |-- redis
          |   |   |   |-- scripts
          |   |   |   |   |-- init.sh
          |   |   |   └-- Dockerfile
          |   └-- docker-compose.yml
          |   └-- exec.sh

***

* Para iniciar os servidores:

        $ cd docker
        $ docker-compose up -d --build
        $ docker exec -it <meucontainer> bash

***

+ Acessos:
     * CRM: http://localhost:10080/
     + MySql:
          * host: 127.0.0.1
          * user: <meuprojeto>
          * senha: secret
          * base: <meuprojeto>
          * porta: 13306
