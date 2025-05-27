# Automatizar_Emails

Esta carpeta contiene el sistema de automatización para el envío de correos electrónicos personalizados a una lista de suscriptores, utilizando plantillas MJML para el diseño de los emails.

## Archivos

- **[sendEmails.js](Automatizar_Emails/sendEmails.js)**  
  Script principal en Node.js que realiza lo siguiente:
  - Lee los datos de los suscriptores desde un archivo CSV.
  - Personaliza una plantilla MJML para cada suscriptor, sustituyendo variables como `{{nombre}}`.
  - Compila la plantilla MJML a HTML usando la herramienta de línea de comandos de MJML.
  - Envía el email personalizado a cada suscriptor usando Nodemailer.
  - Muestra en consola el resultado de cada envío.

- **[suscriptores.csv](Automatizar_Emails/suscriptores.csv)**  
  Archivo CSV que contiene la lista de suscriptores a los que se enviarán los emails.  
  Columnas:  
  - `nombre`: Nombre del suscriptor  
  - `email`: Dirección de correo electrónico  
  - `edad`: Edad del suscriptor  
  - `idioma`: Idioma preferido

## ¿Cómo usarlo?

1. Asegúrate de tener Node.js instalado y la CLI de MJML (`npm install -g mjml`).
2. Prepara el archivo `suscriptores.csv` con los datos de los destinatarios.
3. Ejecuta el script desde la terminal indicando el CSV y la plantilla MJML a usar:
   ```sh
   node sendEmails.js suscriptores.csv ../Supuesto4/2Ruedas.mjml
   ```
   (Ajusta la ruta de la plantilla MJML según corresponda).

El script enviará un correo personalizado a cada suscriptor y mostrará un resumen de los envíos realizados.

---