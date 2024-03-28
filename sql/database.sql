DROP DATABASE IF EXISTS Tec_export; -- Eliminar la base de datos si existe opcional

CREATE DATABASE Tec_export;
USE Tec_export;
CREATE TABLE roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) UNIQUE
);

INSERT INTO roles (role_name) VALUES 
('user'),
('admin'),
('super_admin');

CREATE TABLE usuarios (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    contraseña VARCHAR(100),
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES roles(role_id)
);

INSERT INTO usuarios (nombre, apellido, email, role_id) VALUES 
('Juan', 'Perez', 'juan@example.com', 1),  -- user
('Maria', 'Gonzalez', 'maria@example.com', 2),  -- admin
('Isa', 'Paredes', 'Isatest@gmail.com', 3);  -- super_admin

CREATE TABLE publicaciones (
    publicacion_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    contenido TEXT,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES usuarios(user_id)
);

-- CREATE TABLE frutas_verduras (
--     fv_id INT AUTO_INCREMENT PRIMARY KEY,
--     nombre VARCHAR(100) UNIQUE,
--     tipo ENUM('fruta', 'verdura'),
--     autor_id INT,
--     FOREIGN KEY (autor_id) REFERENCES usuarios(user_id)
-- );

-- -- Insertar algunas frutas y verduras
-- INSERT INTO frutas_verduras (nombre, tipo, autor_id) VALUES 
-- ('Manzana', 'fruta', 1),
-- ('Plátano', 'fruta', 1),
-- ('Naranja', 'fruta', 2),
-- ('Zanahoria', 'verdura', 2),
-- ('Lechuga', 'verdura', 3),
-- ('Pepino', 'verdura', 3); 

-- !!TEST DE INSERCION DE DATOS
INSERT INTO publicaciones (titulo, contenido, autor_id) VALUES 
('Publicacion 1', 'SE SUPONDE QUE EL USUSARIO NORMAL NO PUEDE PUBLICAR, YA DEPUES CHACAOS ESTO', 1),
('Publicacion 2', 'POST DE UN ADMIN ', 2),
('Publicacion 3', 'POST DE EL SUPER ADMIN', 3);


-- QUERY PARA CONSULTAR EL NOMBRE DE LOS AUTORES DE LAS PUBLICACIONES
SELECT p.publicacion_id, p.titulo, p.contenido, u.nombre AS nombre_autor
FROM publicaciones p
JOIN usuarios u ON p.autor_id = u.user_id;


-- QUERY PARA CONSULTAR EL NOMBRE DE LOS AUTORES DE LAS FRUTAS Y VERDURAS
SELECT * FROM frutas_verduras WHERE autor_id = 3 AND tipo = 'fruta'|| tipo='verdura';