# BBDD_feria

La carpeta **BBDD_feria** está dedicada a la gestión de la base de datos de suscriptores y participantes de la campaña "2 Ruedas" de la Feria Valencia. Aquí encontrarás todo lo necesario para crear, poblar, consultar y documentar la base de datos utilizada en la campaña, así como herramientas para automatizar tareas comunes.

---

## Contenido de la carpeta

### 1. `BBDD_2ruedas.sql`

Este archivo es un **script SQL** que contiene todas las instrucciones necesarias para crear la base de datos y las tablas asociadas a la campaña "2 Ruedas". Además, incluye sentencias para insertar datos de ejemplo, facilitando así la puesta en marcha y las pruebas.

**¿Qué hace este script?**
- Crea la base de datos específica para la campaña.
- Define la estructura de las tablas (por ejemplo, tabla de suscriptores con campos como nombre, email, edad, etc.).
- Inserta registros de ejemplo para que puedas probar el funcionamiento de la base de datos desde el primer momento.
- Puede incluir índices y restricciones para asegurar la integridad de los datos.

**¿Cómo se utiliza?**
1. Abre tu gestor de bases de datos (MySQL, MariaDB, etc.).
2. Ejecuta el script con el siguiente comando:
   ```sh
   mysql -u tu_usuario -p < BBDD_2ruedas.sql
   ```
3. La base de datos y las tablas quedarán listas para su uso.

---

### 2. `BBDD_suscriptores.sh`

Este archivo es un **script en bash** diseñado para automatizar tareas relacionadas con la base de datos de suscriptores.

**¿Qué puede hacer este script?**
- Importar automáticamente el archivo SQL para crear la base de datos.
- Realizar consultas frecuentes (por ejemplo, listar todos los suscriptores, buscar por nombre o email, contar el número de registros, etc.).
- Exportar datos a otros formatos si es necesario.
- Facilitar la administración sin necesidad de acceder manualmente al gestor de bases de datos.

**¿Cómo se utiliza?**
1. Asegúrate de tener permisos de ejecución:
   ```sh
   chmod +x BBDD_suscriptores.sh
   ```
2. Ejecuta el script:
   ```sh
   ./BBDD_suscriptores.sh <archivo.csv>
   ```
3. Sigue las instrucciones que aparecerán en pantalla o revisa el propio script para ver las opciones disponibles.

---

### 3. `Capturas_Memoria/`

Esta carpeta contiene **capturas de pantalla** que documentan visualmente el proceso de gestión de la base de datos. Es especialmente útil para la elaboración de la memoria del proyecto o para quienes prefieren una guía visual.

**¿Qué encontrarás aquí?**
- Imágenes del proceso de creación de la base de datos.
- Ejemplos de inserción y consulta de datos.
- Resultados de la ejecución de los scripts.
- Cualquier otro paso relevante documentado gráficamente.

---

## Requisitos

- **MySQL** o **MariaDB** para la gestión de la base de datos.
- **Bash** para ejecutar los scripts de automatización (presente en la mayoría de sistemas Linux).
- Permisos adecuados para ejecutar scripts y acceder a la base de datos.

---

## Notas finales

Esta carpeta es esencial para la correcta gestión y documentación de la base de datos de la campaña "2 Ruedas" de la Feria Valencia. 