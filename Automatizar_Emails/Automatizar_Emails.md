# Automatizar_Emails

<<<<<<< HEAD
Bienvenido/a a la carpeta de automatización de emails. Aquí encontrarás todo lo necesario para enviar correos personalizados de forma sencilla y rápida a una lista de personas, usando plantillas atractivas hechas con MJML.

## ¿Qué hay en esta carpeta?

- **sendEmails.js**  
  Este script en Node.js se encarga de:
  - Leer la lista de personas a las que quieres escribir (desde un archivo CSV).
  - Personalizar el mensaje para cada persona (por ejemplo, poniendo su nombre en el saludo).
  - Convertir la plantilla MJML en un email bonito y compatible con todos los dispositivos.
  - Enviar el correo a cada destinatario usando Nodemailer.
  - Mostrarte en la terminal cómo ha ido el proceso.

- **suscriptores.csv**  
  Aquí es donde apuntas a quién quieres enviar los correos.  
  Debes poner una fila por persona, con estos datos:
  - `nombre`: El nombre de la persona
  - `email`: Su dirección de correo electrónico
  - `edad`: Edad (opcional, por si quieres personalizar más)
  - `idioma`: Idioma preferido (opcional)

## ¿Cómo lo uso?

1. Asegúrate de tener instalado Node.js y la herramienta MJML (`npm install -g mjml`).
2. Rellena el archivo `suscriptores.csv` con tus destinatarios.
3. Elige la plantilla MJML que quieras usar (puedes modificarla para que quede a tu gusto).
4. Abre la terminal en esta carpeta y ejecuta:
   ```sh
   node sendEmails.js suscriptores.csv ../Supuesto4/2Ruedas.mjml
   ```
   (Recuerda cambiar la ruta de la plantilla si usas otra).

¡Y listo! El sistema enviará un correo personalizado a cada persona y te mostrará un resumen de los envíos.
=======
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
>>>>>>> 2d2db01a4d466d186bc3bf428821335c899f8a02

---