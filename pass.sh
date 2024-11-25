#!/bin/bash

echo -e "\e[35m
╭━━━┳━━━┳━━━┳━━━╮
┃╭━╮┃╭━╮┃╭━╮┃╭━╮┃
┃╰━╯┃┃╱┃┃╰━━┫╰━━╮
┃╭━━┫╰━╯┣━━╮┣━━╮┃
┃┃╱╱┃╭━╮┃╰━╯┃╰━╯┃
╰╯╱╱╰╯╱╰┻━━━┻━━━╯
╭━━━┳━━━┳━╮╱╭╮
┃╭━╮┃╭━━┫┃╰╮┃┃
┃┃╱╰┫╰━━┫╭╮╰╯┃
┃┃╭━┫╭━━┫┃╰╮┃┃
┃╰┻━┃╰━━┫┃╱┃┃┃
╰━━━┻━━━┻╯╱╰━╯\e[0m"

echo -e "\e[31mGENERADOR DE PASSWORD LYZETH\e[0m"

# Función para generar una contraseña segura
generate_password() {
    local length=$1
    local characters="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+~"
    echo $(tr -dc "$characters" < /dev/urandom | head -c $length)
}

# Función para generar nombres latinos
generate_name() {
    local names=("Alejandro" "Sofía" "Emilio" "Valentina" "Mateo" "Lucía" "Ángel" "Camila" "Diego" "Isabela" "Julián" "Martina" "Andrés" "Gabriela" "Sebastián" "Valeria" "Nicolás" "Mariana" "Santiago" "Daniela")
    echo ${names[$RANDOM % ${#names[@]}]}
}

# Pide al usuario el número de contraseñas a generar
read -p "¿Cuántas contraseñas desea generar? " num_passwords

# Pide al usuario si quiere incluir símbolos en las contraseñas
read -p "¿Desea incluir símbolos en las contraseñas? (s/n) " include_symbols
if [ "$include_symbols" == "s" ]; then
    password_length=20
else
    password_length=16
fi

# Crea el directorio de salida en la tarjeta SD
output_dir="/sdcard/contraseñas_seguras"
mkdir -p "$output_dir"

# Genera las contraseñas y las guarda en el directorio de salida
for i in $(seq 1 $num_passwords); do
    name=$(generate_name)
    password=$(generate_password $password_length)
    echo "$name: $password" >> "$output_dir/resultados.txt"
done

echo "Las contraseñas se han guardado en $output_dir/resultados.txt"