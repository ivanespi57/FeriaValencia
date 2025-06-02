CREATE DATABASE dos_ruedas_feria;
USE ComicFeria;

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

INSERT INTO envios (id_suscriptor, id_newsletter, fecha_envio, asunto, estado_envio) VALUES
(1, 1, '2024-06-01 09:00:00', 'Tu Boletín Mensual: Resumen de Junio', 'Enviado'),
(2, 2, '2024-06-01 11:30:00', 'Promoción Especial: ¡30% de Descuento!', 'Abierto'),
(3, 1, '2024-05-30 10:00:00', 'Tu Boletín Mensual: Artículos Recomendados', 'Enviado'),
(1, 2, '2024-05-29 14:00:00', '¡Última Oportunidad! Descuento para María', 'Clic'),
(4, 3, '2024-05-28 16:00:00', '5 Consejos Clave para Aumentar tus Ventas', 'Enviado'),
(5, 1, '2024-05-27 08:30:00', 'Your Monthly Newsletter: Highlights', 'Rebotado');

INSERT INTO suscriptores (nombre, email, edad, idioma) VALUES
('María López', 'maria.lopez@gmail.com', 30, 'es'),
('John Doe', 'john.doe@hotmail.com', 27, 'en'),
('Clara Ruiz', 'clara.ruiz@outlook.com', 38, 'es'),
('Émile Dupont', 'emile.dupont@mail.com', 33, 'fr'),
('Laura Johnson', 'laura.johnson@business.com', 45, 'en');
INSERT INTO newsletters (nombre, descripcion) VALUES
('Boletín Mensual', 'Actualizaciones y artículos destacados del mes.'),
('Promociones Especiales', 'Ofertas y descuentos exclusivos para nuestros suscriptores.'),
('Consejos de Ventas', 'Estrategias y recomendaciones para mejorar tus ventas.'),
('Novedades de la Industria', 'Últimas tendencias y noticias del sector.');

