

# Sysdomotic
* Docker
* Project building using docker-compose
* Containers (NGINX, PHP, NODEJS, MYSQL, POSTGRES, ... and OS)

## [intro]: Introdução {#intro}

Documentação criada para facilitar a infraestrutura de projetos DevOps da Sysdomotic. O repositório contém uma estrutura padrão para a criação de containers utilizando o [Docker](https://www.docker.com/get-started) e [Docker Compose](https://docs.docker.com/compose/)

| Menu                           | Descrição                                                       |
| ------------------------------ | --------------------------------------------------------------- |
| [Introdução](#intro)           | Introdução do projeto.                                          |
| [Instalação](#install)         | Como instalar os pacotes nescessários para o projeto funcionar. |
| [Lista de Pacotes](#packages)  | Pacotes de containers que já estão funcionando no Docker.       |
| [Como usar](#usage)            | Como usar os comandos no terminal.                              |
| [Contribuições](#contributing) | Como contribuir com o projeto.                                  |
| [Licença](#license)            | Termos e licenças do projeto.                                   |

## [install]: Instalação {#install}

Para executar o docker para este projeto, você precisa seguir as etapas:

+ Instalar `docker` e `docker-compose`: ✔
     * [Para Mac](https://www.docker.com/docker-mac)
     * [Para Windows](https://www.docker.com/docker-windows)
     * Para Ubuntu ```sudo apt-get install -y docker.io docker-compose```
     * Adicione os hosts e configurações no Virtualbox

         **`WINDOWS`:**
         ![Screenshot](storage/images/docker-virtualbox-conf-windows.png)

+ Configurações do `GIT`: ✔
     * [git submodule add](https://github.com/deviantony/docker-elk.git)
     * ```git config submodule.docker-elk.ignore all```
     * ```git config submodule.src/bundles/docker-elk.ignore all```

+ Pacotes do `Elastic-ELK` no `Docker`: ✘ ☂
     * [deviantony/docker-elk](https://github.com/deviantony/docker-elk)
     * ~~Use single node discovery in order to disable production mode and avoid bootstrap checks~~
     * ~~Use o modo `SINGLE` para desativar o modo de produção e evitar verificações de inicialização~~
     * [Mais detalhes](https://www.elastic.co/guide/en/elasticsearch/reference/current/bootstrap-checks.html)

+ Scripts `SHELL` para facilitar: ✔
     * **docker-compose-run:** ```docker-compose-run <option> <container or stack>```
     * **bin/start:** ```sh bin/start.sh```
     * **bin/exec:** ```sh bin/exec.sh```
     * **bin/build:** ```sh bin/build.sh```

## [packages]: Lista de Pacotes Finalizados {#packages}

#### *Stacks com os principais banco de dados e otimizadores de consultas:*
- [x] **Stack Database** com `postgres`, `mysql`, ou `mongodb`
- [x] **Stack Search Engine** com `elastic-elk`, ou `redis`

#### *Stacks com PHP/LARAVEL:*
- [ ] **Stack Laravel** com `nginx`, `php-fpm`, `postgres` e `stack-database`
- [ ] **Stack Laravel/ReactJS** com `nginx`, `php-fpm`, `reactjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack Laravel/AngularJS** com `nginx`, `php-fpm`, `angularjs`, `posstack-databasetgres` e/ou `stack-search-engine`
- [ ] **Stack Laravel/VueJS** com `nginx`, `php-fpm`, `vuejs`, `stack-database` e/ou `stack-search-engine`

#### *Stacks com NODEJS como API e LIBS/FRAMEWORKS JAVASCRIPT no FRONTEND:*
- [ ] **Stack NodeJS/ReactJS** com `nginx`, `nodejs`, `reactjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack NodeJS/AngularJS** com `nginx`, `nodejs`, `angularjs`, `stack-database` e/ou `stack-search-engine`
- [ ] **Stack NodeJS/VueJS** com `nginx`, `nodejs`, `vuejs`, `stack-database` e/ou `stack-search-engine`

## [usage]: Modo de Uso {#usage}

```bash

docker-compose-run create nodejs reactjs mongodb

docker-compose-run down all

```

## [contributing]: Contribuições {#contributing}

Pull requests são bem vindos 😁✌. Para grandes mudanças, abra uma **`ISSUE`** primeiro para discutir o que você gostaria de mudar 😉.

Atualize os testes conforme apropriado e utilize o projeto conforme desejar.

Espero ter contribuído em algum momento no seu aprendizado. ¯\_( ͡• ͜ʖ ͡•)_/¯

## [license]: Licença #license

O projeto é [MIT](https://choosealicense.com/licenses/mit/)
