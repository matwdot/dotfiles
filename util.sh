#!/bin/bash


# Função para baixar a versão do SysPDV na BUILD desejada
baixar_sysPDV() {
    read -p "Digite a BUILD do SysPDV: " build
    url="https://objectstorage.us-ashburn-1.oraclecloud.com/n/casamagalhaes/b/syspdv/o/b${build}/InstaladorSysPDV19_0_0_${build}.exe"
    wget $url -O /home/pdv
    if [[ $? -ne 0 ]]; then
        echo "Erro ao baixar o SysPDV."
        exit 1
    fi
    echo "Download do SysPDV (BUILD: $build) concluído."
}

# Função para instalação
instalacao() {
    read -p "Configurar Periféricos? (S/n): " configurar_perifericos
    if [[ "$configurar_perifericos" == "S" ]]; then
        # Abrir arquivos de configuração
        subl /usr/local/bin/setty
        subl /etc/udev/rules.d/90-dispositivos-usb.rules
    else
        # Executar comando setty
        setty
    fi

    read -p "Instala VPN? (S/n): " instala_vpn
    if [[ "$instala_vpn" == "S" ]]; then
        # Baixar e executar o instalador da VPN
        echo "Função em processo de implementação"
    fi

    # Rodar o instalador do SysPDV
    cd /home/pdv
    wine InstaladorSysPDV19_0_0_$build.exe
    echo "Instalação do SysPDV concluída."
}

# Função para atualização
atualizacao() {
    # Rodar o instalador do SysPDV
    cd /home/pdv
    wine InstaladorSysPDV19_0_0_$build.exe
    echo "Atualização do SysPDV concluída."
}

# Menu principal
baixar_sysPDV

read -p "Deseja fazer uma instalação/reinstalação ou apenas atualização? (Instalação/Atualização): " acao

if [[ "$acao" == "Instalação" ]]; then
    instalacao
elif [[ "$acao" == "Atualização" ]]; then
    atualizacao
else
    echo "Ação inválida. Saindo."
    exit 1
fi
