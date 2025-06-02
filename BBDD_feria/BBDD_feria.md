# BBDD_feria

La carpeta **BBDD_feria** está dedicada a la gestión de la base de datos de suscriptores y participantes de la campaña "2 Ruedas" de la Feria Valencia. Además, la misma base de datos se ha reutilizado para el supuesto 1, correspondiente al **Salón del Cómic**, permitiendo así aprovechar la estructura y los scripts para ambos eventos. Aquí encontrarás todo lo necesario para crear, poblar y documentar la base de datos utilizada en ambas campañas, así como herramientas para automatizar tareas comunes.

---

## Contenido de la carpeta

### 1. `BBDD_2ruedas.sql` y `BBDD_comic.sql`

Estos archivos son **scripts SQL** que contienen todas las instrucciones necesarias para crear la base de datos y las tablas asociadas tanto a la campaña "2 Ruedas" como al **Salón del Cómic**. Además, incluyen sentencias para insertar datos de ejemplo, facilitando así la puesta en marcha y las pruebas.

**¿Qué hacen estos scripts?**
- Crean la base de datos específica para cada campaña.
- Definen la estructura de las tablas (por ejemplo, tabla de suscriptores con campos como nombre, email, edad, etc.).
- Insertan registros de ejemplo para que puedas probar el funcionamiento de la base de datos desde el primer momento.
- Pueden incluir índices y restricciones para asegurar la integridad de los datos.

**¿Cómo se utilizan?**
1. Abre tu gestor de bases de datos (MySQL, MariaDB, etc.).
2. Ejecuta el script correspondiente con el siguiente comando:
   ```sh
   mysql -u tu_usuario -p < BBDD_2ruedas.sql
   # o
   mysql -u tu_usuario -p < BBDD_comic.sql
   ```
3. La base de datos y las tablas quedarán listas para su uso tanto en la campaña "2 Ruedas" como en el Salón del Cómic.

---

### 2. Scripts de importación (`.sh`)

Existen **dos scripts en bash** para automatizar tareas relacionadas con la base de datos de suscriptores:  
- `BBDD_suscr_2ruedas.sh` (para la campaña "2 Ruedas")  
- `BBDD_suscr_comic.sh` (para el Salón del Cómic)  

**Ambos scripts funcionan de la misma manera**, solo cambian los parámetros de conexión y el nombre de la base de datos a la que se conectan.

**¿Qué pueden hacer estos scripts?**
- Importar automáticamente un archivo CSV de suscriptores a la base de datos correspondiente.
- Facilitar la administración sin necesidad de acceder manualmente al gestor de bases de datos.

**¿Cómo se utilizan?**
1. Asegúrate de tener permisos de ejecución:
   ```sh
   chmod +x BBDD_suscr_2ruedas.sh
   chmod +x BBDD_suscr_comic.sh
   ```
2. Ejecuta el script correspondiente:
   ```sh
   ./BBDD_suscr_2ruedas.sh <archivo.csv>
   # o
   ./BBDD_suscr_comic.sh <archivo.csv>
   ```
3. Sigue las instrucciones que aparecerán en pantalla o revisa el propio script para ver las opciones disponibles.

---

### 3. `Capturas_Memoria/`

Esta carpeta contiene **capturas de pantalla** que documentan visualmente el proceso de gestión de la base de datos. Es especialmente útil para la elaboración de la memoria del proyecto o para quienes prefieren una guía visual.

**¿Qué encontrarás aquí?**
- Imágenes del proceso de creación de la base de datos.
- Resultados de la ejecución de los scripts.
- Cualquier otro paso relevante documentado gráficamente.

---

## Requisitos

- **MySQL** o **MariaDB** para la gestión de la base de datos.
- **Bash** para ejecutar los scripts de automatización (presente en la mayoría de sistemas Linux).
- Permisos adecuados para ejecutar scripts y acceder a la base de datos.

---

## Notas finales

Esta carpeta es esencial para la correcta gestión y documentación de la base de datos de la campaña "2 Ruedas" y del **Salón del Cómic** de la Feria Valencia.
