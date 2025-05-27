CREATE DATABASE dos_ruedas_feria;
USE dos_ruedas_feria;

CREATE TABLE suscriptores (
	id_suscriptor INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	edad INT,
	idioma VARCHAR(50) NOT NULL DEFAULT 'es'
);

-- Crea la tabla newsletters
CREATE TABLE newsletters (
	id_newsletter INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	descripcion TEXT
);


CREATE TABLE IF NOT EXISTS envios (
	id_envio INT AUTO_INCREMENT PRIMARY KEY,
	id_suscriptor INT NOT NULL, 
	id_newsletter INT NOT NULL, 
	fecha_envio DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	asunto VARCHAR(255) NOT NULL,
	estado_envio VARCHAR(50) NOT NULL, 

	FOREIGN KEY (id_suscriptor) REFERENCES suscriptores(id_suscriptor) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (id_newsletter) REFERENCES newsletters(id_newsletter) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tablas ficticias para la BBDD

INSERT INTO suscriptores (nombre, email, edad, idioma) VALUES
('Pedro García', 'pedro.garcia@gmail.com', 28, 'es'),
('Ana Martínez', 'ana.martinez@outlook.com', 35, 'en'),
('Luis Fernández', 'luis.fernandez@yahoo.es', 42, 'es'),
('Sophie Dubois', 'sophie.dubois@mail.com', 29, 'fr'),
('David Smith', 'david.smith@business.com', 50, 'en');


INSERT INTO newsletters (nombre, descripcion) VALUES
('Boletín Semanal', 'Resumen de noticias y artículos de la semana.'),
('Ofertas Exclusivas', 'Promociones y descuentos especiales para suscriptores.'),
('Tips de Marketing', 'Consejos y trucos para mejorar tus estrategias de marketing digital.'),
('Actualizaciones de Producto', 'Novedades y mejoras en nuestros productos y servicios.');

INSERT INTO envios (id_suscriptor, id_newsletter, fecha_envio, asunto, estado_envio) VALUES
(1, 1, '2024-05-27 09:00:00', 'Tu Boletín Semanal: Novedades de Mayo', 'Enviado'),
(2, 2, '2024-05-27 11:30:00', 'Oferta Exclusiva para Ti: ¡20% de Descuento!', 'Abierto'),
(3, 1, '2024-05-26 10:00:00', 'Tu Boletín Semanal: Consejos Rápidos', 'Enviado'),
(1, 2, '2024-05-25 14:00:00', '¡Últimas Horas! Descuento para Pedro', 'Clic'),
(4, 3, '2024-05-24 16:00:00', 'Descubre 5 Tips Esenciales de Marketing', 'Enviado'),
(5, 1, '2024-05-23 08:30:00', 'Your Weekly Newsletter: New Features', 'Rebotado');
