#!/bin/bash

# Para a execução do script e exibe uma mensagem
die () {

	echo
    echo >&2 "[\033[1;32mSYC-CRM\033[0m:\033[1;34mstart\033[0m]: \033[0;31m $@ \033[0m"
    echo
    exit 1
}

# Valida o diretório do projeto
if [ "$1" = "" ]; then
    die "<dir-project> argument required, is empty provided"
fi

# Valida repositório do GIT
if [ "$2" = "" ]; then
    die "<git-project-name> argument required, is empty provided"
fi

# Valida nome do diretório do projeto
if [ "$3" = "" ]; then
    die "<dir-project-name> argument required, is empty provided"
fi

# Valida versão do projeto
if [ "$4" = "" ]; then
    die "<project-version> argument required, is empty provided"
fi

# Valida tipo de ambiente
if [ "$5" = "" ]; then
    appenv="local"
else
	appenv="${5}"
fi

# Variáveis de controle
dirlocal=$(pwd)
dirproject="${1}"
gituser="${2}"
projectname="${3}"
version="${4}"
companyname="sysdomoticbr"
dirlocalprj="${dirproject}/projectname-${version}"
gitrepos="https://${gituser}@bitbucket.org/${companyname}/${projectname}-${version}.git"

# Verifica o Tipo do Ambiente
if [ "${appenv}" = "local" ]; then # Ambiente Local

	echo
	echo "[\033[1;32mSYC-CRM\033[0m:\033[1;34mstart\033[0m]: \033[1;33m Criando Ambiente de Desenvolvimento \033[0m - \033[0;31m FAIL \033[0m"
	echo
else # Ambiente de Produção

	echo
	echo "[\033[1;32mSYC-CRM\033[0m:\033[1;34mstart\033[0m]: \033[1;33m Criando Ambiente de Produção \033[0m - \033[0;31m FAIL \033[0m"
	echo
fi

echo
echo "[\033[1;32mSYC-CRM\033[0m:\033[1;34mstart\033[0m]: \033[1;33m Diretório do projeto: \033[0m - \033[0;32m 'cd ${dirlocalprj}/${projectname}/' \033[0m"
echo