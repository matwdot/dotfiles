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

DOWNLOAD_DIR='/home/pdv/Downloads'

# --------------------
# **** Funções *******
# --------------------

# Verifica se os programas estão instalados e instala caso não
requisitos(){

  echo "Verificando dependencias..."

  # wget
  if ! command -v wget &> /dev/null; then
    echo "Instalando wget"
    sudo apt update && sudo apt install -y wget
    if [ $? -eq 0 ]; then
      echo "O wget foi instalado com sucesso."
    else
      echo "Falha na instalação do wget."
      exit 1
    fi
  else
    echo "O wget -> OK"
  fi

}

# Função para baixar a BUILD
baixar_build() {
  read -p "Informe a BUILD para download: " build
  echo "Baixando..."
  wget -P /home/pdv/Downloads/ https://objectstorage.us-ashburn-1.oraclecloud.com/n/casamagalhaes/b/syspdv/o/b$build/InstaladorSysPDV19_0_0_$build.exe && \
  echo "A BUILD: $build foi baixada em /home/pdv/Downloads" && \
  echo "Iniciando instalação..." && \
  chmod +x /home/pdv/Downloads/InstaladorSysPDV19_0_0_$build.exe && \
  wine /home/pdv/Downloads/InstaladorSysPDV19_0_0_$build.exe
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

# Função para instalar o SysPDV
instalar_syspdv() {
  requisitos
  read -p "Deseja instalar o SysPDV? (S/n): " confirm

  if [[ "$confirm" == "" || "$confirm" == "S" || "$confirm" == "s" ]]; then
    baixar_build
    configurar_perifericos
  else
    echo "Instalação cancelada!"
  fi
}

# Função para atualizar o SysPDV
atualizar_syspdv() {
  read -p "Deseja atualizar o SysPDV? (S/n) " confirm

  if [[ "$confirm" == "" || "$confirm" == "S" || "$confirm" == "s" ]]; then
    echo "Atualização........"
  else
    echo "Atualização cancelada!"
  fi
}

# --------------------
# ****** MENU ********
# --------------------
while true; do
  echo "--------------------------------"
  echo ""
  echo "1. Instalar o SysPDV PDV."
  echo "2. Atualizar o SysPDV PDV."
  echo ""
  echo "Pressione CTRL + C para sair."
  echo "--------------------------------"
  echo ""
  read -p "Escolha uma opção: " opc

  case $opc in
  1)
    clear
    instalar_syspdv
    echo "Instalação concluida ✅"
    exit
    ;;
  2)
    clear
    atualizar_syspdv
    echo "Atualização concluida ✅"
    exit
    ;;
  *)
    clear
    echo "Opção invalida!!"
    exit
    ;;
  esac
done