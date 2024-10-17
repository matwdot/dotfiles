# Cores
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'

# Fundos
BG_BLACK='\033[40;1;37m'
BG_RED='\033[41;1;37m'
BG_GREEN='\033[42;1;37m'
BG_BROWN='\033[43;1;37m'
BG_BLUE='\033[44;1;37m'
BG_PURPLE='\033[45;1;37m'
BG_CYAN='\033[46;1;37m'
BG_LIGHT_GRAY='\033[47;1;37m'

# Estilos
UNDERLINE='\033[4;30m'
BLINK='\033[5;30m'
INVERT='\033[7;30m'
CONCEALED='\033[8;30m'

# Exemplo de uso
echo -e "${BLACK}Preto${NC}             --> 0;30"
echo -e "${RED}Vermelho${NC}          --> 0;31"
echo -e "${GREEN}Verde${NC}             --> 0;32"
echo -e "${BROWN}Marrom${NC}            --> 0;33"
echo -e "${BLUE}Azul${NC}              --> 0;34"
echo -e "${PURPLE}Purple${NC}            --> 0;35"
echo -e "${CYAN}Cyan${NC}              --> 0;36"
echo -e "${LIGHT_GRAY}Cinza Claro${NC}       --> 0;37"
echo -e "${DARK_GRAY}Preto Acinzentado${NC}  --> 1;30"
echo -e "${LIGHT_RED}Vermelho Claro${NC}    --> 1;31"
echo -e "${LIGHT_GREEN}Verde Claro${NC}       --> 1;32"
echo -e "${YELLOW}Amarelo${NC}            --> 1;33"
echo -e "${LIGHT_BLUE}Azul Claro${NC}        --> 1;34"
echo -e "${LIGHT_PURPLE}Purple Claro${NC}      --> 1;35"
echo -e "${LIGHT_CYAN}Cyan Claro${NC}        --> 1;36"
echo -e "${WHITE}Branco${NC}            --> 1;37"

echo -e "${BG_BLACK}Fundo Preto${NC}    --> 40;?;?"
echo -e "${BG_RED}Fundo Vermelho${NC} --> 41;?;?"
echo -e "${BG_GREEN}Fundo Verde${NC}    --> 42;?;?"
echo -e "${BG_BROWN}Fundo Marrom${NC}   --> 43;?;?"
echo -e "${BG_BLUE}Fundo Azul${NC}     --> 44;?;?"
echo -e "${BG_PURPLE}Fundo Purple${NC}   --> 45;?;?"
echo -e "${BG_CYAN}Fundo Cyan${NC}     --> 46;?;?"
echo -e "${BG_LIGHT_GRAY}Fundo Cinza${NC}   --> 47;?;?"

echo -e "${UNDERLINE}Sublinhado${NC}        --> 4;?"
echo -e "${BLINK}Piscando${NC}          --> 5;?"
echo -e "${INVERT}Invertido${NC}        --> 7;?"
echo -e "${CONCEALED}Concealed${NC}        --> 8;?"
