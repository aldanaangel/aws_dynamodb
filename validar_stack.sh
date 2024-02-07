#!/bin/bash

# Nombre del stack de CloudFormation
stack_name="MyDynamoDBStack"

# Verificar si el stack existe
if aws cloudformation describe-stacks --stack-name $stack_name >/dev/null 2>&1; then
    echo "El stack $stack_name ya existe."
else
    echo "El stack $stack_name no existe. Creando..."
    # Crear el stack de CloudFormation
    aws cloudformation create-stack --stack-name $stack_name --template-body ./template.yml --capabilities CAPABILITY_NAMED_IAM
    # Esperar hasta que la creación del stack se complete
    aws cloudformation wait stack-create-complete --stack-name $stack_name
    echo "El stack $stack_name se ha creado correctamente."
fi
