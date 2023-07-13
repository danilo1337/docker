#!/bin/bash

NOME_IMAGEM=$1

NOME_CONTAINER=$2

NUM_INSTANCIAS=$3

for ((i=1; i <= $NUM_INSTANCIAS; i++))
  do
    CONTAINER="$NOME_CONTAINER-$i"
    docker run -d --name $CONTAINER $NOME_IMAGEM
  done