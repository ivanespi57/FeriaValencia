const nodemailer = require('nodemailer');
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');
const csv = require('csv-parser');

// --- 1. Configuración de Nodemailer ---
const transporter = nodemailer.createTransport({
	host: 'smtp.gmail.com', // O el SMTP de O365 (ej: 'smtp.office365.com')
	port: 587,
	secure: false,
	auth: {
    	user: 'ivanespiasins75.com',
    	pass: ' xinb cgkn srlk kyit'
	}
});

// --- 2. Leer suscriptores desde CSV (por argumento) ---
function leerSuscriptoresDesdeCSV(rutaCSV) {
	return new Promise((resolve, reject) => {
    	const suscriptores = [];
    	fs.createReadStream(rutaCSV)
        	.pipe(csv())
        	.on('data', (row) => suscriptores.push(row))
        	.on('end', () => resolve(suscriptores))
        	.on('error', reject);
	});
}

// --- 3. Ruta a tu plantilla MJML (por argumento) ---
const rutaCSV = process.argv[2];
const mjmlTemplateArg = process.argv[3];

if (!rutaCSV || !mjmlTemplateArg) {
	console.error('Uso: node sendEmails.js <archivo.csv> <archivo.mjml>');
	process.exit(1);
}

const rutaCompletaCSV = path.isAbsolute(rutaCSV) ? rutaCSV : path.join(__dirname, rutaCSV);
const mjmlTemplatePath = path.isAbsolute(mjmlTemplateArg) ? mjmlTemplateArg : path.join(__dirname, mjmlTemplateArg);
const mjmlTemplateContent = fs.readFileSync(mjmlTemplatePath, 'utf8');

// --- Función para personalizar y compilar MJML ---
function compileMjmlToHtml(template, data) {
	let personalizedMjml = template;
	for (const key in data) {
    	personalizedMjml = personalizedMjml.replace(new RegExp(`\\{\\{${key}\\}\\}`, 'g'), data[key]);
	}

	// Guarda el MJML personalizado temporalmente en un archivo
	const tempMjmlFilePath = path.join(__dirname, 'temp_personalized_template.mjml');
	fs.writeFileSync(tempMjmlFilePath, personalizedMjml);

	// Ejecuta el comando MJML CLI para compilarlo a HTML
	try {
    	const htmlOutput = execSync(`mjml "${tempMjmlFilePath}"`).toString();
    	fs.unlinkSync(tempMjmlFilePath); // Elimina el archivo temporal
    	return htmlOutput;
	} catch (error) {
    	console.error('Error al compilar MJML:', error.stderr ? error.stderr.toString() : error.message);
    	fs.unlinkSync(tempMjmlFilePath);
    	throw new Error('Fallo la compilación de MJML.');
	}
}

// --- Función para enviar un correo ---
async function sendEmail(subscriberData, htmlContent) {
	try {
    	const info = await transporter.sendMail({
        	from: '"Feria Valencia" <ivanespiasins75@gmail.com>',
        	to: subscriberData.email,
        	subject: `¡Tenemos novedades para ti, ${subscriberData.nombre}!`,
        	html: htmlContent,
    	});
    	console.log(`Correo enviado a ${subscriberData.email}: %s`, info.messageId);
    	return { success: true, subscriber: subscriberData.email, messageId: info.messageId };
	} catch (error) {
    	console.error(`Error al enviar correo a ${subscriberData.email}:`, error);
    	return { success: false, subscriber: subscriberData.email, error: error.message };
	}
}

// --- Bucle principal para enviar a todos los suscriptores ---
async function sendCampaign() {
	console.log('Iniciando envío de campaña con:', rutaCompletaCSV);
	const results = [];
	const subscribers = await leerSuscriptoresDesdeCSV(rutaCompletaCSV);

	for (const subscriber of subscribers) {
    	try {
        	const htmlEmail = compileMjmlToHtml(mjmlTemplateContent, subscriber);
        	const result = await sendEmail(subscriber, htmlEmail);
        	results.push(result);
    	} catch (error) {
        	console.error(`No se pudo procesar el correo para ${subscriber.email}:`, error.message);
        	results.push({ success: false, subscriber: subscriber.email, error: error.message });
    	}
	}
	console.log('\nResultados del envío:');
	console.table(results);
}

// --- Ejecutar la campaña ---
sendCampaign();

