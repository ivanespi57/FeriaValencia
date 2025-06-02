# Automatizar_Emails

Bienvenido/a a la carpeta de automatización de emails. Aquí encontrarás todo lo necesario para enviar correos personalizados de forma sencilla y rápida a una lista de personas.

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
   node sendEmails.js suscriptores.csv ../Supuesto4/Supuesto.mjml
   ```
   (Recuerda cambiar la ruta de la plantilla si usas otra).

¡Y listo! El sistema enviará un correo personalizado a cada persona y te mostrará un resumen de los envíos.

---
