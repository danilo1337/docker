#!/bin/bash

NOME_IMAGEM=$1

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

echo "${container_id[@]}"
