#!/bin/bash
# ****************************************************************
#
# Script de Instalação/Atualização do SysPDV PDV nos Caixas Linux
# Versão: 1.0
# Desenvolvido por: Matheus Wesley
# Contatos: https://matheuswesley.github.io/devlinks
#
# ****************************************************************

# --------------------
# **** Variaveis *****
# --------------------

# Cores
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
BG_PURPLE='\033[45;1;37m'
NC='\033[0m' # Sem cor

# --------------------
# **** Funções *******
# --------------------

# Verifica se os programas estão instalados e instala caso não
requisitos(){

  echo "Verificando dependencias..."

  # curl
  if ! command -v curl &> /dev/null; then
    echo "Instalando curl"
    sudo apt update && sudo apt install -y curl
    if [ $? -eq 0 ]; then
      echo "O curl foi instalado com sucesso."
    else
      echo "Falha na instalação do curl."
      exit 1
    fi
  else
    echo -e "${GREEN}dep: curl -> OK${NC}"
  fi

}

# Função para baixar a BUILD
baixar_build() {
  echo -e "${BLUE}Informe a BUILD para download: ${NC}"
  read -p ": " build
  echo -e "${YELLOW}Baixando a BUILD${NC} ${RED}$build${NC}${YELLOW}. Aguarde!!${NC}"

  URL="https://objectstorage.us-ashburn-1.oraclecloud.com/n/casamagalhaes/b/syspdv/o/b$build/InstaladorSysPDV19_0_0_$build.exe"
  DESTINO="/home/pdv/Downloads/InstaladorSysPDV19_0_0_$build.exe"

  curl --progress-bar -o "$DESTINO" "$URL"

  if [ $? -eq 0 ]; then
    echo -e "\n${GREEN}A BUILD: $build foi baixada em /home/pdv/Downloads${NC}"
    echo -e "${YELLOW}Iniciando instalação...${NC}"
    chmod +x "$DESTINO"
    wine "$DESTINO"
  else
    echo -e "${RED}Falha no download.${NC}"
  fi
}


# Função que abre arquivos de configuração dos perifericos
configurar_perifericos() {
  read -p "Deseja configurar os perifericos?(S/n): " confirm
  if [[ "$confirm" == "" || "$confirm" == "S" || "$confirm" == "s" ]]; then
    echo "Abrindo os arquivos (setty e 90-dispositivos-rules)"
    # Abrindo os arquivos setty e 90-dispositivos-usb.rules
    subl /usr/local/bin/setty && subl /etc/udev/rules.d/90-dispositivos-usb.rules
  else
    echo "Configuração de perifericos cancelado."
  fi
}

instalar_vpn() {
	read -p "Deseja instalar a VPN?(S/n)"
	if [[ "$confirm" == "" || "$confirm" == "S" || "$confirm" == "s" ]]; then
    ./dep/wnbinstall.sh -i
  else
    echo "Configuração de perifericos cancelado."
  fi
}

# Função para instalar o SysPDV
instalar_syspdv() {
  requisitos
  read -p "Deseja instalar o SysPDV? (S/n): " confirm

  if [[ "$confirm" == "" || "$confirm" == "S" || "$confirm" == "s" ]]; then
    baixar_build
    configurar_perifericos
    instalar_vpn
  else
    echo "Instalação cancelada!"
  fi
}

# Função para atualizar o SysPDV
atualizar_syspdv() {
  read -p "Deseja atualizar o SysPDV? (S/n) " confirm

  if [[ "$confirm" == "" || "$confirm" == "S" || "$confirm" == "s" ]]; then
    baixar_build
  else
    echo "Atualização cancelada!"
  fi
}

# --------------------
# ****** MENU ********
# --------------------
while true; do
  echo -e "--------------------------------"
  echo ""
  echo -e "1. Instalar o SysPDV PDV."
  echo -e "2. Atualizar o SysPDV PDV."
  echo -e "3. Instalar VPN."
  echo ""
  echo -e "Pressione CTRL + C para sair."
  echo -e "--------------------------------"
  echo ""
  read -p "Escolha uma opção: " opc

  case $opc in
  1)
    clear
    instalar_syspdv
    echo -e "${GREEN}Instalação concluída!${DONE_ICON}${NC}"
    exit
    ;;
  2)
    clear
    atualizar_syspdv
    echo -e "${GREEN}Atualização concluída!${DONE_ICON}${NC}"
    exit
    ;;
  3)
    clear
    instalar_vpn
    echo -e "${GREEN}VPN Instalada!${DONE_ICON}${NC}"
    exit
    ;;
  *)
    clear
    echo -e "${RED}Opção inválida!! ${INVALID_ICON}${NC}"
    exit
    ;;
  esac
done