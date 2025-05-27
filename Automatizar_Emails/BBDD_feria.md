# Automatizar_Emails

Esta carpeta contiene un sistema completo para el envío automatizado de correos electrónicos personalizados a una lista de suscriptores, ideal para campañas de marketing, newsletters o comunicaciones masivas. El sistema está pensado para ser sencillo de usar y fácilmente adaptable a tus necesidades.

## ¿Qué incluye esta carpeta?

- **sendEmails.js**  
  Script principal en Node.js que:
  - Lee una lista de suscriptores desde un archivo CSV.
  - Personaliza una plantilla de correo (MJML) para cada destinatario (por ejemplo, usando su nombre).
  - Convierte la plantilla MJML a HTML usando la herramienta MJML.
  - Envía el correo a cada suscriptor mediante Nodemailer.
  - Muestra un resumen del proceso en la terminal.

- **suscriptores.csv**  
  Archivo donde se almacena la lista de destinatarios. Cada fila representa un suscriptor con los siguientes campos:
  - `nombre`: Nombre del destinatario.
  - `email`: Correo electrónico.
  - `edad`: Edad (opcional, útil para personalizaciones).
  - `idioma`: Idioma preferido (opcional).

- **Automatizar_Emails.md**  
  Guía rápida de uso y explicación de los archivos principales.

## ¿Cómo funciona el sistema?

1. **Preparación**  
   - Asegúrate de tener Node.js instalado.
   - Instala la herramienta MJML globalmente:  
     `npm install -g mjml`
   - Rellena el archivo `suscriptores.csv` con tus destinatarios.
   - Elige o edita una plantilla MJML (por ejemplo, [../Supuesto4/2Ruedas.mjml](../Supuesto4/2Ruedas.mjml)).

2. **Ejecución**  
   Desde la terminal, ejecuta el siguiente comando dentro de esta carpeta:
   ```sh
   node sendEmails.js suscriptores.csv ../Supuesto4/2Ruedas.mjml