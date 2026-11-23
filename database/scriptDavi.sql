DROP DATABASE IF EXISTS davi;
CREATE DATABASE davi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE davi;

-- 1. Tabla planes
CREATE TABLE planes (
    id_plan INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    precio_mensual DECIMAL(5, 2) NOT NULL,
    max_anuncios INT NOT NULL
);

-- 2. Tabla comercio
CREATE TABLE comercio (
    id_comercio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    localidad VARCHAR(80) NOT NULL,
    fecha_alta DATE NOT NULL,
    id_plan INT NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES planes(id_plan)
);

-- 3. Tabla cliente
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    localidad VARCHAR(80) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- 4. Tabla resena (relaciona cliente y comercio)
CREATE TABLE resena (
    id_resena INT AUTO_INCREMENT PRIMARY KEY,
    puntuacion INT NOT NULL,
    comentario VARCHAR(255) NOT NULL,
    fecha_resena DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_comercio INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_comercio) REFERENCES comercio(id_comercio)
);

-- ==========================================
-- DATOS DE PRUEBA
-- ==========================================

INSERT INTO planes (nombre, precio_mensual, max_anuncios) VALUES
('Gratuito', 0.00, 1),
('Impulso', 19.99, 5),
('Premium', 39.99, 15);

INSERT INTO comercio (nombre, categoria, localidad, fecha_alta, id_plan) VALUES
('Zapatería Paso Firme', 'Zapatería', 'Tomelloso', '2026-10-01', 2),
('Lencería Seda y Encaje', 'Lencería', 'Alcázar de San Juan', '2026-10-05', 3),
('Quesería Don Quijote', 'Alimentación', 'Tomelloso', '2026-10-12', 3),
('Librería Papel y Tinta', 'Papelería', 'Alcázar de San Juan', '2026-11-01', 1);

INSERT INTO cliente (nombre, email, localidad, fecha_registro) VALUES
('Laura Martínez', 'laura@email.com', 'Tomelloso', '2026-10-03'),
('Carlos Sánchez', 'carlos@email.com', 'Alcázar de San Juan', '2026-10-08'),
('Elena Navarro', 'elena@email.com', 'Tomelloso', '2026-10-15'),
('Javier Morales', 'javier@email.com', 'Ciudad Real', '2026-11-02');

INSERT INTO resena (puntuacion, comentario, fecha_resena, id_cliente, id_comercio) VALUES
(5, 'Trato muy cercano y calzado de muy buena calidad.', '2026-10-10', 1, 1),
(4, 'Mucha variedad y asesoramiento estupendo en tienda.', '2026-10-14', 2, 2),
(5, 'El queso curado artesanal está espectacular, repetiré seguro.', '2026-10-20', 3, 3),
(4, 'Buena atención y precios muy competitivos en libros.', '2026-11-06', 2, 4),
(5, 'Me consiguieron el número que buscaba en un día.', '2026-11-12', 3, 1);
