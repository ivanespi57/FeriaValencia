#!/bin/bash

DB_HOST="localhost"
DB_USER="usuario_app"
DB_PASS="tu_contraseña_fuerte_aqui"
DB_NAME="dos_ruedas_feria"

if [ -z "$1" ]; then
	echo "Uso: $0 <ruta_al_archivo_csv>"
	echo "Ejemplo: $0 suscriptores.csv"
	exit 1
fi

CSV_FILE="$1"

echo "Iniciando importación de suscriptores desde '$CSV_FILE'..."

if [ ! -f "$CSV_FILE" ]; then
	echo "Error: El archivo CSV '$CSV_FILE' no se encontró."
	exit 1
fi

if ! mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT 1;" &> /dev/null; then
	echo "Error: No se pudo conectar a la base de datos MySQL. Revisa las credenciales y la conectividad."
	exit 1
fi
echo "Conexión a la base de datos MySQL exitosa."

LINE_NUM=1
tail -n +2 "$CSV_FILE" | while IFS=',' read -r nombre email edad_str idioma; do
	LINE_NUM=$((LINE_NUM + 1))

	nombre=$(echo "$nombre" | xargs)
	email=$(echo "$email" | xargs)
	edad=$(echo "$edad_str" | xargs)
	idioma=$(echo "$idioma" | xargs)

	if [ -z "$email" ]; then
    	echo "Advertencia: Línea $LINE_NUM: Email vacío encontrado. Saltando línea."
    	continue
	fi

	if ! [[ "$edad" =~ ^[0-9]+$ ]] && [ -n "$edad" ]; then
     	echo "Advertencia: Línea $LINE_NUM: Edad '$edad' no es un número válido. Se intentará insertar como NULL."
     	edad="NULL"
	elif [ -z "$edad" ]; then
     	edad="NULL"
	fi

	SQL_QUERY="INSERT INTO suscriptores (nombre, email, edad, idioma, fecha_registro) VALUES ('$nombre', '$email', ${edad}, '$idioma', NOW()) ON DUPLICATE KEY UPDATE nombre = VALUES(nombre), edad = VALUES(edad), idioma = VALUES(idioma);"

	if mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -s -N -e "$SQL_QUERY"; then
    	echo "Procesado: $email"
	else
    	echo "Error: Línea $LINE_NUM: Fallo al procesar: $email."
	fi
done

echo "Proceso de importación de suscriptores finalizado."
exit 0
