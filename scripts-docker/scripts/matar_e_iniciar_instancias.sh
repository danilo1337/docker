#!/bin/bash

NOME_IMAGEM=$1

NOME_CONTAINER=$2

NUM_INSTANCIAS=$3

####################################################################################################
echo "### MATANDO TODOS OS CONTAINERS DA IMAGEM $NOME_IMAGEM ###"


readarray -t container_id <<< "$(docker ps -q -f "ancestor=$NOME_IMAGEM")"

if [ ${#container_id[@]} -gt 0 ]; then
    # Mata cada container com base no ID
    for id in "${container_id[@]}"
        do
            docker kill "$id"
            docker rm  -f -v "$id"
        done
    echo "Os containers com a imagem $NOME_IMAGEM foram encerrados."
else
    echo "Não foi encontrado nenhum container com a imagem $NOME_IMAGEM."
fi


####################################################################################################

echo "### INICIANDO $3 INSTÂNCIAS ###"

for ((i=1; i <= $NUM_INSTANCIAS; i++))
    do
        CONTAINER="$NOME_CONTAINER-$i"
        docker run -d --name $CONTAINER $NOME_IMAGEM
    done