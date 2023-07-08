#!/bin/bash

echo "Actualizando el sistema"
sudo dnf update

echo -e "\n verificando NodeJs"
if ! which node >/dev/null 2>&1; then
    echo "instalando NodeJs"
    sudo dnf install nodejs
    echo -e "\n Versión de node: "
    node --version
else
    echo -e "\n NodeJs ya está instalado, no fue necesario instalarlo."
    echo "Versión de node: "
    node --version
fi


echo -e "\n Verificando si Docker"
if ! command -v docker >/dev/null 2>&1; then
    echo -e "\n Docker no está instalado. Configurando repositorio \n"
    sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    echo -e "\n Instalando Docker \n"
    sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo "Docker instalado"
    docker --version
else
    echo -e "\nDocker ya está instalado"
    docker --version
fi

echo -e "\nInstalando NeoVim"
if ! which nvim >/dev/null 2>&1; then
	echo "Instalando NeoVim"
  sudo dnf install neovim
else
	echo "NeoVim ya esta nstalado"
  nvim --version | head -n 1
fi

echo "actualizacion del sistema"
sudo dnf update