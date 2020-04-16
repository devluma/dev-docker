# Sysdomotic
* Docker
* Project building using docker-compose
* Containers (NGINX, PHP, NODEJS, MYSQL, POSTGRES, ... and OS)

Mais detalhes sobre o projeto veja na [Documentação][wiki].

## Introdução

O projeto foi criado para auxiliar na criação de ambientes dos projetos realizados pela [Sysdomotic](https://www.sysdomotic.com.br).

Este projeto visa o auxílio na criação de ambientes para o desenvolvimento de aplicações `WEB` e `API` que ajuda muito na hora de iniciar um novo freela ou até mesmo dar início naquele projeto pessoal :stuck_out_tongue_winking_eye:.

O respositório foi estruturado da seguinte maneira:

```bash
docker/ >> # Diretório principal
└── bin/ >> # Diretório dos scripts em shell
└── htdocs/ >> # Diretório das aplicações web com exemplos de arquitetura usando separação em micro serviços
└── src/ >> # Diretório dos scripts para montar os containers do Docker usando o docker-compose e arquivos Dockerfile
│   ├── builds/ >> # Diretório com os scripts de build dos containers
│   └── bundles/ >> # Diretório com os arquivos de módulos externos
└── stacks/ >> # Diretório com os arquivos de configurações das stacks pré-configuradas do docker-compose
└── storage/ >> # Diretório com para guardar os logs e os dados dos volumes dos containers criados
└── wiki/ >> # Diretório com a documentação do projeto
└── ... >> # Arquivos de configurações e versionamento do projeto
```

Mais detalhes sobre a arquitetura veja em [Arquitetura de Diretórios][wiki-dirs].

## Traduções

1. [Português do Brazil][wiki-tsl-ptBR]
    > A documentação possui três tipos de linguagem 1 -> pt-BR, 2 -> en e 3 -> es.
2. [Inglês Americano][wiki-tsl-en]
    > The documentation has three types of language 1 -> pt-BR, 2 -> en and 3 -> es.
3. [Espanhol][wiki-tsl-es]
    > La documentación tiene tres tipos de lenguaje 1 -> pt-BR, 2 -> en y 3 -> es

## Licença

O projeto é [MIT](https://choosealicense.com/licenses/mit/)

## Status

[![App Version][version-image]][version-url]
[![Build Status][travis-image]][travis-github-url]
[![Downloads Stats][version-download-image]][version-download]

[version-image]: https://img.shields.io/badge/app-1.0.0-brightgreen?style=flat-square
[version-url]: https://github.com/devluma/dev-docker/releases
[version-download-image]: https://img.shields.io/badge/download-1.0.0-blue?style=flat-square
[version-download]: https://github.com/devluma/dev-docker/archive/master.zip
[travis-image]: https://img.shields.io/badge/build-passing-green?style=flat-square
[travis-github-url]: https://travis-ci.org/github/devluma/dev-docker
[travis-bitbucket-url]: https://travis-ci.org/bitbucket/sysdomoticbr/docker
[wiki]: https://github.com/devluma/dev-docker/tree/master/wiki
[wiki-dirs]: https://github.com/devluma/dev-docker/blob/master/wiki/portuguese/README-ptBR.md#arquitetura-de-diret%C3%B3rios
[wiki-tsl-ptBR]: https://github.com/devluma/dev-docker/blob/master/wiki/portuguese/README-ptBR.md
[wiki-tsl-en]: https://github.com/devluma/dev-docker/blob/master/wiki/english/README-en.md
[wiki-tsl-es]: https://github.com/devluma/dev-docker/blob/master/wiki/spanish/README-es.md