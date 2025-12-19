#!/bin/bash

# --- CONFIGURATION DES COULEURS ---
VERT='\033[0;32m'
VERT_CLAIR='\033[1;32m'
ROUGE='\033[1;31m'
NC='\033[0m'
GRIS='\033[0;90m'
FOND_ROUGE='\033[41m'

TRACE_LEVEL=0

# --- FONCTION DÉTAILS MATRIX ---
matrix_scroll_decode() {
    local mot="$1"
    local is_secret="$2"
    local flash_speed="$3"
    local result=""
    local timestamp=$(date +%S:%N | cut -c1-8)
    local coord="0x$(printf '%X' $((RANDOM % 255)))"

    echo -ne "${GRIS}[$timestamp] $coord : ${NC}"
    
    for (( i=0; i<${#mot}; i++ )); do
        for (( j=0; j<2; j++ )); do
            char=$(printf "\\$(printf '%03o' $((RANDOM % 26 + 65)))")
            if [ "$is_secret" = "true" ] && [ $j -eq 0 ]; then
                echo -ne "\r\033[K${GRIS}[$timestamp] $coord : ${VERT}...... ${ROUGE}${char}${NC}"
                sleep "$flash_speed"
            else
                echo -ne "\r\033[K${GRIS}[$timestamp] $coord : ${VERT}...... ${VERT_CLAIR}${char}${NC}"
                sleep 0.005
            fi
        done
        result="${result}${VERT}${mot:$i:1}${NC}"
    done
    echo -e "\r\033[K${GRIS}[$timestamp] $coord : ${VERT}DECODED > ${result}" 
}

show_status() {
    echo -e "${VERT_CLAIR}SÉCURITÉ: KERNEL_ZION_v10.0 | FLUX_ID: $((RANDOM % 899 + 100))${NC}"
    echo -ne "${ROUGE}ALERTE TRACE : ["
    for ((i=0; i<20; i++)); do
        if [ $((i*5)) -lt $TRACE_LEVEL ]; then echo -ne "${FOND_ROUGE} ${NC}"; else echo -ne "${GRIS}.${NC}"; fi
    done
    echo -e "] ${TRACE_LEVEL}%${NC}"
    echo -e "${GRIS}------------------------------------------------------------${NC}"
}

# --- BOUCLE DE JEU (10 NIVEAUX) ---
for LEVEL in {1..10}; do
    clear
    show_status
    echo -e "${VERT}>>> COUCHE RÉSEAU : $LEVEL / 10 <<<${NC}\n"

    # Difficulté croissante et mots aléatoires
    case $LEVEL in
        1) MOTS=("NEO" "ZION" "TANK" "LINK"); TIME=12; FLASH=0.15; PEN=25 ;;
        2) MOTS=("APOC" "MOUSE" "SWITCH" "DOZER"); TIME=10; FLASH=0.12; PEN=30 ;;
        3) MOTS=("SMITH" "BROWN" "JONES" "GHOST"); TIME=9; FLASH=0.10; PEN=35 ;;
        4) MOTS=("NIOBE" "GHOST" "TWINS" "KEY"); TIME=8; FLASH=0.08; PEN=40 ;;
        5) MOTS=("ORACLE" "SOURCE" "SYSTEM" "UPGRADE"); TIME=7; FLASH=0.06; PEN=45 ;;
        6) MOTS=("MORPHEUS" "TRINITY" "CYPHER" "RELOAD"); TIME=6; FLASH=0.05; PEN=55 ;;
        7) MOTS=("SENTINEL" "PROGRAM" "REVOLT" "VECTOR"); TIME=5; FLASH=0.04; PEN=70 ;;
        8) MOTS=("ARCHITECT" "SERAPH" "KALI" "MALACHI"); TIME=4; FLASH=0.03; PEN=85 ;;
        9) MOTS=("MEROVINGIAN" "PERSEPHONE" "METACORTEX"); TIME=3; FLASH=0.02; PEN=100 ;;
        10) MOTS=("DEUS-EX-MACHINA" "RHINEHEART" "MULTIVAC"); TIME=3; FLASH=0.01; PEN=100 ;;
    esac

    # Mélange des mots pour que la position du secret change tout le temps
    MOTS=( $(printf "%s\n" "${MOTS[@]}" | shuf) )
    SECRET=${MOTS[$((RANDOM % ${#MOTS[@]}))]}

    # Défilement
    for m in "${MOTS[@]}"; do
        is_s="false"; [[ "$m" == "$SECRET" ]] && is_s="true"
        matrix_scroll_decode "$m" "$is_s" "$FLASH"
        sleep 0.05
    done

    echo -ne "\n${VERT_CLAIR}SAISIR SÉQUENCE FLASH ($TIME s) > ${NC}"
    read -t "$TIME" TEST
    
    CHOIX=$(echo "$TEST" | tr '[:lower:]' '[:upper:]' 2>/dev/null)

    if [[ "$CHOIX" == "$SECRET" ]]; then
        echo -e "\n${VERT}[✔] ACCÈS VALIDE. TRACE BROUILLÉE.${NC}"
        TRACE_LEVEL=$((TRACE_LEVEL - 30))
        [[ $TRACE_LEVEL -lt 0 ]] && TRACE_LEVEL=0
        sleep 1
    else
        TRACE_LEVEL=$((TRACE_LEVEL + PEN))
        echo -e "\n${ROUGE}[✘] ERREUR CRC ! TRACE À $TRACE_LEVEL%${NC}"
        sleep 1.2
    fi

    if [ $TRACE_LEVEL -ge 100 ]; then
        clear
        echo -e "${ROUGE}###########################################"
        echo -e "      FLUX INTERROMPU : VOUS ÊTES PRIS     "
        echo -e "###########################################${NC}"
        exit 1
    fi
done

# --- VICTOIRE ---
clear
echo -e "${VERT_CLAIR}###########################################"
echo -e "       CONTRÔLE TOTAL DU MAINFRAME         "
echo -e "      VOUS ÊTES L'ÉLU DU SYSTÈME.          "
echo -e "###########################################${NC}"
