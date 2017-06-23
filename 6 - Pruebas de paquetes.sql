SET SERVEROUTPUT ON;

--Tabla Alumnos
BEGIN
PCK_Alumnos.Inicializar;
PCK_Alumnos.Insertar ('Insertar un alumno', '77843402V', 'Rubén', 'Bueno Menéndez', TO_DATE('25/08/1991', 'DD/MM/YYYY'), 'rubenbm@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '93839721C', 'Alfredo', 'Gomez Reyes', TO_DATE('18/03/1988', 'DD/MM/YYYY'), 'alfredogr@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '07842998K', 'Álvaro', 'Alonso Agenjo', TO_DATE('17/10/1987', 'DD/MM/YYYY'), 'alvaroaa@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '00548678J', 'Diego', 'Barbero Cano', TO_DATE('02/11/1985', 'DD/MM/YYYY'), 'diegobc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '35849097D', 'Álvaro', 'Cano García', TO_DATE('30/07/1995', 'DD/MM/YYYY'), 'alvarocg@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '98523686N', 'Natalia', 'Cereza Arias', TO_DATE('17/06/1992', 'DD/MM/YYYY'), 'nataliaca@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '07804804F', 'Claudia', 'Frutos Vidal', TO_DATE('13/03/1993', 'DD/MM/YYYY'), 'claudiafv@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '26810393Y', 'María', 'Sanchez Muñoz', TO_DATE('10/02/1989', 'DD/MM/YYYY'), 'mariasm@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '64427553E', 'Alicia', 'Heredia Gomez', TO_DATE('15/10/1985', 'DD/MM/YYYY'), 'aliciahg@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '42312153L', 'Ainhoa', 'Santiago Cid', TO_DATE('23/05/1990', 'DD/MM/YYYY'), 'anhoasc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '77008982Z', 'Naila', 'Muñez Ruiz', TO_DATE('30/05/1992', 'DD/MM/YYYY'), 'nailamr@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '27576410P', 'Lucia', 'Perez Fuertes', TO_DATE('01/11/1992', 'DD/MM/YYYY'), 'luciapf@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '70964804Y', 'Natalia', 'Ruiz Camarena', TO_DATE('13/07/1993', 'DD/MM/YYYY'), 'nataliarc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '67202652X', 'Roberto', 'Bravo Ballesteros', TO_DATE('23/03/1989', 'DD/MM/YYYY'), 'robertobb@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '63441519K', 'María', 'Reyes Méndez', TO_DATE('25/09/1987', 'DD/MM/YYYY'), 'mariaym@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '62968537B', 'Iván', 'Agustín Navarro', TO_DATE('05/02/1988', 'DD/MM/YYYY'), 'ivanan@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '23801240N', 'Paula', 'Baena Blázquez', TO_DATE('08/02/1985', 'DD/MM/YYYY'), 'paulabb@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '47966225R', 'Sergio', 'Caballero Cabeza', TO_DATE('28/10/1991', 'DD/MM/YYYY'), 'sergiocc@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '56336094D', 'Juan Antonio', 'Lago Medina', TO_DATE('03/02/1989', 'DD/MM/YYYY'), 'juanantoniolm@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno', '36081385C', 'Sebastián', 'Páez Vaquero', TO_DATE('22/01/1995', 'DD/MM/YYYY'), 'sebastianpv@alum.es', TRUE);
PCK_Alumnos.Insertar ('Insertar un alumno con DNI NULL', NULL, 'Juan Antonio', 'Giralda Torres', TO_DATE('04/09/1995', 'DD/MM/YYYY'), 'juanantoniogt@alum.es', FALSE);
PCK_Alumnos.Insertar ('Insertar un alumno violando PK', '77843402V', 'Juan Antonio', 'Giralda Torres', TO_DATE('04/09/1995', 'DD/MM/YYYY'), 'juanantoniogt@alum.es', FALSE);
PCK_Alumnos.Insertar ('Insertar un alumno violando CK_DNI_Alumnos', '563360949','Rubén', 'Bueno Menéndez', TO_DATE('25/08/1991', 'DD/MM/YYYY'), 'rubenbm@alum.es', FALSE);
PCK_Alumnos.Insertar ('Insertar un alumno incumpliendo la RN-001', '77843402V', 'Rubén', 'Bueno Menéndez', TO_DATE('25/08/1991', 'DD/MM/YYYY'), 'rubenbm@hotmail.es', FALSE);
PCK_Alumnos.Actualizar ('Actualizar un alumno', '77843402V', 'Rubén', 'Bueno Mendez', TO_DATE('25/08/1991', 'DD/MM/YYYY'), 'rubenbm@alum.es', TRUE);
PCK_Alumnos.Actualizar ('Actualizar un alumno incumpliendo la RN-001', '77843402V', 'Rubén', 'Bueno Menéndez', TO_DATE('25/08/1991', 'DD/MM/YYYY'), 'rubenbm@hotmail.es', FALSE);
PCK_Alumnos.Actualizar ('Actualizar un alumno inexistente', '99694117L', 'Susana', 'Giralda Torres', TO_DATE('04/09/1995', 'DD/MM/YYYY'), 'susanagt@alum.es', FALSE);
PCK_Alumnos.Eliminar ('Eliminar un alumno', '77843402V', TRUE);
PCK_Alumnos.Consultar;
END;
/

--Tabla Aulas
BEGIN
PCK_Aulas.Inicializar;
PCK_Aulas.Insertar ('Insertar un aula', 'A0.01', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A0.02', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A0.03', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A0.04', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A1.01', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A1.02', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.01', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.02', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.03', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H0.04', 70, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H1.01', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'H1.02', 50, 'Teoría', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'F1.01', 30, 'Laboratorio', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'F1.02', 30, 'Laboratorio', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'G1.01', 10, 'Laboratorio', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A3.01', 150, 'Examen', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A3.02', 150, 'Examen', TRUE);
PCK_Aulas.Insertar ('Insertar un aula', 'A4.01', 200, 'Examen', TRUE);
PCK_Aulas.Insertar ('Insertar un aula con Nombre NULL', NULL, 70, 'Teoría', FALSE);
PCK_Aulas.Insertar ('Insertar un aula violando AK', 'A0.01', 70, 'Teoría', FALSE);
PCK_Aulas.Insertar ('Insertar un aula violando CK_Tipo_Aulas', 'F2.01', 70, 'Oficina', FALSE);
PCK_Aulas.Insertar ('Insertar un aula incumpliendo la RN-006', 'A0.05', 130, 'Teoría', FALSE);
PCK_Aulas.Insertar ('Insertar un aula incumpliendo la RN-006', 'F0.06', 50, 'Laboratorio', FALSE);
PCK_Aulas.Insertar ('Insertar un aula incumpliendo la RN-006', 'A3.07', 250, 'Examen', FALSE);
PCK_Aulas.Actualizar ('Actualizar un aula', 1, 'A0.07', 70, 'Teoría', TRUE);
PCK_Aulas.Actualizar ('Actualizar un aula con Nombre NULL', 1, NULL, 70, 'Teoría', FALSE);
PCK_Aulas.Actualizar ('Actualizar un aula violando AK', 1, 'A0.03', 70, 'Teoría', FALSE);
PCK_Aulas.Actualizar ('Actualizar un aula violando CK_Tipo_Aulas', 1, 'F2.01', 70, 'Oficina', FALSE);
PCK_Aulas.Actualizar ('Actualizar un aula incumpliendo la RN-006', 1, 'A0.05', 130, 'Teoría', FALSE);
PCK_Aulas.Actualizar ('Actualizar un aula incumpliendo la RN-006', 1, 'F0.06', 50, 'Laboratorio', FALSE);
PCK_Aulas.Actualizar ('Actualizar un aula incumpliendo la RN-006', 1, 'A3.07', 250, 'Examen', FALSE);
PCK_Aulas.Actualizar ('Actualizar un aula inexistente', 666, 'A3.07', 150, 'Examen', FALSE);
PCK_Aulas.Eliminar ('Eliminar un aula', 2, TRUE);
PCK_Aulas.Consultar;
END;
/

--Tabla Becas
BEGIN
PCK_Becas.Inicializar;
PCK_Becas.Insertar ('Insertar una beca', '61700LIW', 2000, 80, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '28194XAM', 1500, 810, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '18537TZN', 2400, 785, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '91440SRA', 1600, 630, 'Ordinaria', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '84676UFX', 3680, 720, 'Movilidad', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '93073MJH', 2400, 380, 'Movilidad', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '13617EVK', 1500, 670, 'Movilidad', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '13617BAU', 6400, 890, 'Empresa', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '07284VPY', 2000, 670, 'Empresa', TRUE);
PCK_Becas.Insertar ('Insertar una beca', '38720AJG', 2500, 540, 'Empresa', TRUE);
PCK_Becas.Insertar ('Insertar una beca con Codigo_Beca NULL', NULL, 1500, 500, 'Ordinaria', FALSE);
PCK_Becas.Insertar ('Insertar una beca violando PK', '61700LIW', 1500, 500, 'Ordinaria', FALSE);
PCK_Becas.Insertar ('Insertar una beca violando CK_Codigo_Becas', '6938532T', 1500, 500, 'Ordinaria', FALSE);
PCK_Becas.Insertar ('Insertar una beca violando CK_Tipo_Becas', '69385YOS', 1500, 500, 'Extra', FALSE);
PCK_Becas.Insertar ('Insertar una beca incumpliendo la RN-004', '69385YOS', 1000, 300, 'Ordinaria', FALSE);
PCK_Becas.Actualizar ('Actualizar una beca', '61700LIW', 2500, 400, 'Movilidad', TRUE);
PCK_Becas.Actualizar ('Actualizar una beca violando CK_Tipo_Becas', '61700LIW', 1500, 500, 'Extra', FALSE);
PCK_Becas.Actualizar ('Actualizar una beca incumpliendo la RN-004', '61700LIW', 1000, 300, 'Ordinaria', FALSE);
PCK_Becas.Actualizar ('Actualizar una beca inexistente', '95025YFA', 2500, 400, 'Movilidad', FALSE);
PCK_Becas.Eliminar ('Eliminar una beca', '28194XAM', TRUE);
PCK_Becas.Consultar;
END;
/

--Tabla Departamentos
BEGIN
PCK_Departamentos.Inicializar;
PCK_Departamentos.Insertar ('Insertar un departamento', 'Física Aplicada I', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Electrónica y Electromagnetismo', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Ciencias de la Comput. e Int. Artificial', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Arquitectura y Tecnolog. de Computadores', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Ingeniería Aeroespacial y Mecánica de Fluidos', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Ingeniería de Sistemas y Automática', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Lenguajes y Sistemas Informáticos', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Matemática Aplicada I', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento', 'Tecnología Electrónica', TRUE);
PCK_Departamentos.Insertar ('Insertar un departamento con Nombre NULL', NULL, FALSE);
PCK_Departamentos.Insertar ('Insertar un departamento violando AK', 'Lenguajes y Sistemas Informáticos', FALSE);
PCK_Departamentos.Actualizar ('Actualizar un departamento', 1, 'Biología Celular', TRUE);
PCK_Departamentos.Actualizar ('Actualizar un departamento con Nombre NULL', 1, NULL, FALSE);
PCK_Departamentos.Actualizar ('Actualizar un departamento violando AK', 1, 'Tecnología Electrónica', FALSE);
PCK_Departamentos.Actualizar ('Actualizar un departamento inexistente', 666, 'Biología Celular', FALSE);
PCK_Departamentos.Eliminar ('Eliminar un departamento', 20, TRUE);
PCK_Departamentos.Consultar;
END;
/

--Tabla Despachos
BEGIN
PCK_Despachos.Inicializar;
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.20', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.21', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.22', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F0.23', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.20', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.21', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.22', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'F1.23', 3, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'G0.20', 1, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'G0.21', 1, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho', 'G1.20', 2, TRUE);
PCK_Despachos.Insertar ('Insertar un despacho con Nombre NULL', NULL, 2, FALSE);
PCK_Despachos.Insertar ('Insertar un despacho violando AK', 'F0.20', 2, FALSE);
PCK_Despachos.Insertar ('Insertar un despacho incumpliendo la RN-005', 'F0.25', 5, FALSE);
PCK_Despachos.Actualizar ('Actualizar un despacho', 1, 'F0.25', 2, TRUE);
PCK_Despachos.Actualizar ('Actualizar un despacho con Nombre NULL', 1, NULL, 2, FALSE);
PCK_Despachos.Actualizar ('Actualizar un despacho violando AK', 'F1.21', NULL, 3, FALSE);
PCK_Despachos.Actualizar ('Actualizar un despacho incumpliendo la RN-005', 1, 'F0.30', 5, FALSE);
PCK_Despachos.Actualizar ('Actualizar un despacho inexistente', 666, 'F0.30', 2, FALSE);
PCK_Despachos.Eliminar ('Eliminar un despacho', 11, TRUE);
PCK_Despachos.Consultar;
END;
/

--Tabla Grados
BEGIN
PCK_Grados.Inicializar;
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería Informática - Ingeniería de Computadores', TRUE);
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería Informática - Ingeniería del Software', TRUE);
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería Informática - Tecnologías Informáticas', TRUE);
PCK_Grados.Insertar ('Insertar un grado', 'Ingeniería de la Salud', TRUE);
PCK_Grados.Insertar ('Insertar un grado con Nombre NULL', NULL, FALSE);
PCK_Grados.Insertar ('Insertar un grado violando AK', 'Ingeniería Informática - Ingeniería del Software', FALSE);
PCK_Grados.Actualizar ('Actualizar un grado', 1, 'Matemáticas', TRUE);
PCK_Grados.Actualizar ('Actualizar un grado con Nombre NULL', 1, NULL, FALSE);
PCK_Grados.Actualizar ('Actualizar un grado violando AK', 1, 'Ingeniería Informática - Tecnologías Informáticas', FALSE);
PCK_Grados.Actualizar ('Actualizar un grado inexistente', 666, 'Ingeniería Informática - Tecnologías Informáticas', FALSE);
PCK_Grados.Eliminar ('Eliminar un grado', 2, TRUE);
PCK_Grados.Consultar;
END;
/

--Tabla Grupos
BEGIN
PCK_Grupos.Inicializar;
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 1', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 2', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 3', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 4', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 5', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 6', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 7', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 8', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 9', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 10', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 11', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 12', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 13', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 14', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 15', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo', 'Grupo 16', TRUE);
PCK_Grupos.Insertar ('Insertar un grupo con Nombre NULL', NULL, FALSE);
PCK_Grupos.Insertar ('Insertar un grupo violando AK', 'Grupo 2', FALSE);
PCK_Grupos.Actualizar ('Actualizar un grupo', 1, 'Grupo 17', TRUE);
PCK_Grupos.Actualizar ('Actualizar un grupo con Nombre NULL', 1, NULL, FALSE);
PCK_Grupos.Actualizar ('Actualizar un grupo violando AK', 1, 'Grupo 2', FALSE);
PCK_Grupos.Actualizar ('Actualizar un grupo inexistente', 666, 'Grupo 2', FALSE);
PCK_Grupos.Eliminar ('Eliminar un grupo', 2, TRUE);
PCK_Grupos.Consultar;
END;
/

--Tabla AlumnosPertenecenAGrupos
BEGIN
PCK_AlumnosPertenecenAGrupos.Inicializar;
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '42312153L', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '42312153L', 4, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '93839721C', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '07842998K', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '07842998K', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '00548678J', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '35849097D', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '98523686N', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '98523686N', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '07804804F', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '26810393Y', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '26810393Y', 3, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '64427553E', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '36081385C', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '56336094D', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '47966225R', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '23801240N', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '63441519K', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '67202652X', 8, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '70964804Y', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '27576410P', 1, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '77008982Z', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '63441519K', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '93839721C', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '56336094D', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '64427553E', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '35849097D', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '77008982Z', 7, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '27576410P', 7, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '42312153L', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '47966225R', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '27576410P', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '36081385C', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '26810393Y', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo', '00548678J', 5, TRUE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo con DNI NULL', NULL, 6, FALSE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo con OID_Grup NULL', '67202652X', NULL, FALSE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo violando PK', '42312153L', 1, FALSE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo violando FK de alumnos', '12345678P', 1, FALSE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo violando FK de grupos', '42312153L', 5656, FALSE);
PCK_AlumnosPertenecenAGrupos.Insertar ('Insertar un alumno perteneciente a un grupo violando CK_DNI_AlumPertAGrup', '778434028', 1, FALSE);
PCK_AlumnosPertenecenAGrupos.Eliminar ('Eliminar un alumno perteneciente a un grupo', '42312153L', 4, TRUE);
PCK_AlumnosPertenecenAGrupos.Consultar;
END;
/

--Tabla Asignaturas
BEGIN
PCK_Asignaturas.Inicializar;
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050004, 'Fundamentos Físicos de la Informática', 'FFI', 6, 'Primer cuatrimestre', 1, 'Troncal', 1, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050040, 'Integración de Sistemas Físicos e Informáticos', 'ISFI', 6, 'Primer cuatrimestre', 4, 'Optativo', 1, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050029, 'Aplicaciones de Soft Computing', 'ASC', 6, 'Segundo cuatrimestre', 4, 'Optativo', 2, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050012, 'Lógica Informática', 'LI', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 3, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050024, 'Inteligencia Artificial', 'IA', 6, 'Primer cuatrimestre', 3, 'Obligatorio', 3, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050015, 'Arquitectura de Computadores', 'AC', 6, 'Segundo cuatrimestre', 2, 'Obligatorio', 4, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050001, 'Fundamentos de Programación', 'FP', 12, 'Anual', 1, 'Troncal', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050010, 'Análisis y Diseño de Datos y Algoritmos', 'ADDA', 12, 'Anual', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050011, 'Introducción a la Ingeniería del Software y los Sistemas de Información', 'IISSI', 12, 'Anual', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050014, 'Sistemas Operativos', 'SO', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050016, 'Arquitectura e Integración de Sistemas Software', 'AISS', 6, 'Segundo cuatrimestre', 2, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050018, 'Diseño y Pruebas', 'DP', 12, 'Anual', 3, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050019, 'Proceso Software y Gestión', 'PSG', 12, 'Anual', 3, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050020, 'Ingeniería de Requisitos', 'IR', 6, 'Primer cuatrimestre', 3, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050026, 'Prácticas Externas', 'PE', 6, 'Segundo cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050027, 'Acceso Inteligente a la Información', 'AII', 6, 'Primer cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050032, 'Evolución y Gestión de la Configuración', 'EGC', 6, 'Primer cuatrimestre', 4, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050035, 'Planificación y Gestión de Proyectos Informáticos', 'PGPI', 6, 'Segundo cuatrimestre', 4, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050039, 'Ingeniería del Software y Práctica Profesional', 'ISPP', 6, 'Primer cuatrimestre', 4, 'Obligatorio', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050043, 'Seguridad en Sistemas Informáticos y en Internet', 'SSII', 6, 'Segundo cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050007, 'Álgebra Lineal y Numérica', 'ALN', 6, 'Segundo cuatrimestre', 1, 'Troncal', 8, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050017, 'Matemática Discreta', 'MD', 6, 'Segundo cuatrimestre', 2, 'Obligatorio', 8, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050002, 'Cálculo Infinitesimal y Numérico', 'CIN', 6, 'Primer cuatrimestre', 1, 'Troncal', 8, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050003, 'Circuitos Electrónicos Digitales', 'CED', 6, 'Primer cuatrimestre', 1, 'Troncal', 9, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050009, 'Estructura de Computadores', 'EDC', 6, 'Segundo cuatrimestre', 1, 'Troncal', 9, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050013, 'Redes de Computadores', 'RC', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 9, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura', 2050041, 'Optimización de Sistemas', 'OS', 6, 'Primer cuatrimestre', 4, 'Optativo', 7, TRUE);
PCK_Asignaturas.Insertar ('Insertar una asignatura con Codigo_Asig NULL', NULL, 'Redes de Computadores', 'RC', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 9, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura con Nombre NULL', 2050045, NULL, 'RC', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 9, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura violando PK', 2050004, 'Teledetección', 'T', 6, 'Primer cuatrimestre', 4, 'Optativo', 9, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura violando AK', 2050041, 'Fundamentos Físicos de la Informática', 'FFI', 6, 'Primer cuatrimestre', 1, 'Troncal', 1, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura violando FK de departamentos', 2050045, 'Trabajo Fin de Grado', 'TFG', 12, 'Anual', 4, 'Obligatorio', 33, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura violando CK_Cod_Asig_Asignaturas', 20588, 'Modelado y Simulación Numérica', 'MSN', 6, 'Primer cuatrimestre', 3, 'Obligatorio', 8, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura violando CK_Periodo_Asignaturas', 2050021, 'Modelado y Simulación Numérica', 'MSN', 6, 'Indefinido', 3, 'Obligatorio', 8, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura violando CK_Curso_Asignaturas', 2050021, 'Modelado y Simulación Numérica', 'MSN', 6, 'Primer cuatrimestre', 7, 'Obligatorio', 8, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura violando CK_Tipo_Asignaturas', 2050021, 'Modelado y Simulación Numérica', 'MSN', 6, 'Primer cuatrimestre', 3, 'Opcional', 8, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura incumpliendo la RN-002', 2050021, 'Modelado y Simulación Numérica', 'MSN', 0, 'Primer cuatrimestre', 3, 'Optativo', 8, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura incumpliendo la RN-008', 2050021, 'Modelado y Simulación Numérica', 'MSN', 12, 'Primer cuatrimestre', 3, 'Optativo', 8, FALSE);
PCK_Asignaturas.Insertar ('Insertar una asignatura incumpliendo la RN-009', 2050021, 'Modelado y Simulación Numérica', 'MSN', 6, 'Anual', 3, 'Optativo', 8, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura', 2050013, 'Redes de Computación', 'RC', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 9, TRUE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura con Nombre NULL', 2050013, NULL, 'RC', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 9, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura violando AK', 2050013, 'Fundamentos Físicos de la Informática', 'FFI', 6, 'Primer cuatrimestre', 1, 'Troncal', 1, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura violando FK de departamentos', 2050013, 'Trabajo Fin de Grado', 'TFG', 12, 'Anual', 4, 'Obligatorio', 33, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura violando CK_Periodo_Asignaturas', 2050013, 'Modelado y Simulación Numérica', 'MSN', 6, 'Indefinido', 3, 'Obligatorio', 8, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura violando CK_Curso_Asignaturas', 2050013, 'Modelado y Simulación Numérica', 'MSN', 6, 'Primer cuatrimestre', 7, 'Obligatorio', 8, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura violando CK_Tipo_Asignaturas', 2050013, 'Modelado y Simulación Numérica', 'MSN', 6, 'Primer cuatrimestre', 3, 'Opcional', 8, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura incumpliendo la RN-002', 2050013, 'Modelado y Simulación Numérica', 'MSN', 0, 'Primer cuatrimestre', 3, 'Optativo', 8, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura incumpliendo la RN-008', 2050013, 'Modelado y Simulación Numérica', 'MSN', 12, 'Primer cuatrimestre', 3, 'Optativo', 8, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura incumpliendo la RN-009', 2050013, 'Modelado y Simulación Numérica', 'MSN', 6, 'Anual', 3, 'Optativo', 8, FALSE);
PCK_Asignaturas.Actualizar ('Actualizar una asignatura inexistente', 2999999, 'Redes de Computación', 'RC', 6, 'Primer cuatrimestre', 2, 'Obligatorio', 9, FALSE);
PCK_Asignaturas.Eliminar ('Eliminar una asignatura', 2050013, TRUE);
PCK_Asignaturas.Consultar;
END;
/

--Tabla Expedientes
BEGIN
PCK_Expedientes.Inicializar;
PCK_Expedientes.Insertar ('Insertar un expediente', 84656361, '93839721C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 94814291, '07842998K', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 72715608, '27576410P', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 24992812, '00548678J', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 66217035, '56336094D', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 67367181, '64427553E', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 42079230, '62968537B', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 30004413, '42312153L', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 85838415, '67202652X', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 19955161, '77008982Z', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 95326106, '00548678J', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 64586570, '70964804Y', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 44748275, '63441519K', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 67032771, '70964804Y', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 78208070, '23801240N', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 53909587, '23801240N', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 12226352, '56336094D', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 78002608, '27576410P', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 17361731, '36081385C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 61654321, '62968537B', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 83665705, '93839721C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 32407767, '36081385C', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente', 42794228, '67202652X', TRUE);
PCK_Expedientes.Insertar ('Insertar un expediente con Codigo_Exp NULL', NULL, '47966225R', FALSE);
PCK_Expedientes.Insertar ('Insertar un expediente con DNI NULL', 14833197, NULL, FALSE);
PCK_Expedientes.Insertar ('Insertar un expediente violando PK', 84656361, '47966225R', FALSE);
PCK_Expedientes.Insertar ('Insertar un expediente violando FK de alumnos', 14833197, '77777797R', FALSE);
PCK_Expedientes.Insertar ('Insertar un expediente violando CK_Codigo_Expedientes', 7468, '47966225R', FALSE);
PCK_Expedientes.Insertar ('Insertar un expediente violando CK_DNI_Expedientes', 14833197, '4795TS625Y', FALSE);
PCK_Expedientes.Actualizar ('Actualizar un expediente', 84656361, '27576410P', TRUE);
PCK_Expedientes.Actualizar ('Actualizar un expediente con DNI NULL', 84656361, NULL, FALSE);
PCK_Expedientes.Actualizar ('Actualizar un expediente violando FK de alumnos', 84656361, '77777797R', FALSE);
PCK_Expedientes.Actualizar ('Actualizar un expediente violando CK_DNI_Expedientes', 84656361, '4795TS625Y', FALSE);
PCK_Expedientes.Actualizar ('Actualizar un expediente inexistente', 99999999, '4795TS625Y', FALSE);
PCK_Expedientes.Eliminar ('Eliminar un expediente', 94814291, TRUE);
PCK_Expedientes.Consultar;
END;
/

--Tabla Notas
BEGIN
PCK_Notas.Inicializar;
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('5,4'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,5'), 'Aprobado', 'Segunda', 2, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 42794228, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('4,5'), 'Suspenso', 'Tercera', 3, TO_DATE('03/12/2017', 'DD/MM/YYYY'), 32407767, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('8,2'), 'Notable', 'Segunda', 4, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 83665705, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('8,9'), 'Notable', 'Primera', 3, TO_DATE('24/01/2017', 'DD/MM/YYYY'), 83665705, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('1,6'), 'Suspenso', 'Tercera', 1, TO_DATE('02/12/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('1'), 'Suspenso', 'Segunda', 1, TO_DATE('02/09/2017', 'DD/MM/YYYY'), 17361731, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,3'), 'Aprobado', 'Tercera', 1, TO_DATE('03/12/2017', 'DD/MM/YYYY'), 78002608, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('2'), 'Suspenso', 'Primera', 2, TO_DATE('23/01/2017', 'DD/MM/YYYY'), 12226352, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,5'), 'Sobresaliente', 'Tercera', 3, TO_DATE('04/12/2017', 'DD/MM/YYYY'), 53909587, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9'), 'Sobresaliente', 'Segunda', 1, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 78208070, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('10'), 'Matrícula de honor', 'Segunda', 3, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 44748275, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,2'), 'Aprobado', 'Primera', 2, TO_DATE('22/01/2017', 'DD/MM/YYYY'), 95326106, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('0'), 'Suspenso', 'Segunda', 1, TO_DATE('05/09/2017', 'DD/MM/YYYY'), 64586570, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('5,5'), 'Aprobado', 'Tercera', 2, TO_DATE('05/12/2017', 'DD/MM/YYYY'), 64586570, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('3,5'), 'Suspenso', 'Primera', 3, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 95326106, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,1'), 'Sobresaliente', 'Segunda', 1, TO_DATE('04/09/2017', 'DD/MM/YYYY'), 19955161, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,6'), 'Aprobado', 'Primera', 1, TO_DATE('28/01/2017', 'DD/MM/YYYY'), 42079230, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('8,2'), 'Notable', 'Segunda', 4, TO_DATE('06/09/2017', 'DD/MM/YYYY'), 85838415, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('10'), 'Matrícula de honor', 'Primera', 4, TO_DATE('29/01/2017', 'DD/MM/YYYY'), 66217035, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,8'), 'Sobresaliente', 'Tercera', 2, TO_DATE('06/12/2017', 'DD/MM/YYYY'), 66217035, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('2,5'), 'Suspenso', 'Segunda', 3, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 67032771, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,4'), 'Sobresaliente', 'Primera', 2, TO_DATE('30/01/2017', 'DD/MM/YYYY'), 72715608, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('5,9'), 'Aprobado', 'Segunda', 1, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 84656361, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('9,2'), 'Sobresaliente', 'Tercera', 2, TO_DATE('06/12/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('7,4'), 'Notable', 'Segunda', 2, TO_DATE('07/09/2017', 'DD/MM/YYYY'), 12226352, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('10'), 'Matrícula de honor', 'Segunda', 1, TO_DATE('01/09/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('3'), 'Suspenso', 'Segunda', 1, TO_DATE('06/09/2017', 'DD/MM/YYYY'), 61654321, TRUE);
PCK_Notas.Insertar ('Insertar una nota', TO_NUMBER('6,5'), 'Aprobado', 'Tercera', 2, TO_DATE('19/12/2017', 'DD/MM/YYYY'), 83665705, TRUE);
PCK_Notas.Insertar ('Insertar una nota con Codigo_Exp NULL', TO_NUMBER('5'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), NULL, FALSE);
PCK_Notas.Insertar ('Insertar una nota violando FK de expedientes', TO_NUMBER('5'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 99999999, FALSE);
PCK_Notas.Insertar ('Insertar una nota violando CK_Calificacion_Notas', TO_NUMBER('5'), 'Suficiente', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Insertar ('Insertar una nota violando CK_Convocatoria_Notas', TO_NUMBER('5'), 'Aprobado', 'Cuarta', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Insertar ('Insertar una nota violando CK_Curso_Notas', TO_NUMBER('5'), 'Aprobado', 'Primera', 7, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Insertar ('Insertar una nota incumpliendo la RN-011', TO_NUMBER('15'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Insertar ('Insertar una nota incumpliendo la RN-012', TO_NUMBER('5'), 'Sobresaliente', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota', 1, TO_NUMBER('6,5'), 'Aprobado', 'Tercera', 2, TO_DATE('19/12/2017', 'DD/MM/YYYY'), 83665705, TRUE);
PCK_Notas.Actualizar ('Actualizar una nota con Codigo_Exp NULL', 1, TO_NUMBER('5'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), NULL, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota violando FK de expedientes', 1, TO_NUMBER('5'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 99999999, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota violando CK_Calificacion_Notas', 1, TO_NUMBER('5'), 'Suficiente', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota violando CK_Convocatoria_Notas', 1, TO_NUMBER('5'), 'Aprobado', 'Cuarta', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota violando CK_Curso_Notas', 1, TO_NUMBER('5'), 'Aprobado', 'Primera', 7, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota incumpliendo la RN-011', 1, TO_NUMBER('15'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota incumpliendo la RN-012', 1, TO_NUMBER('5'), 'Sobresaliente', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Actualizar ('Actualizar una nota inexistente', 666, TO_NUMBER('5'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361, FALSE);
PCK_Notas.Eliminar ('Eliminar una nota', 2, TRUE);
PCK_Notas.Consultar;
END;
/

--Tabla AsignaturasPuntuadasConNotas
BEGIN
PCK_AsigPuntuadasConNotas.Inicializar;
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050004, 1, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050024, 4, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050018, 5, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050035, 14, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050043, 1, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050003, 16, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050014, 5, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050004, 6, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050010, 22, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050012, 21, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050001, 1, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050026, 6, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050004, 10, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050015, 5, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050027, 9, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050032, 7, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050039, 8, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050001, 7, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050035, 8, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050035, 20, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050002, 28, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050020, 6, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050043, 9, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota', 2050010, 27, TRUE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota con Codigo_Asig NULL', NULL, 9, FALSE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota con OID_N NULL', 2050043, NULL, FALSE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota violando PK', 2050004, 1, FALSE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota violando FK de asignaturas', 2999999, 1, FALSE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota violando FK de notas', 2050004, 666, FALSE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota violando CK_Cod_Asig_AsigPuntConNot', 20004, 4, FALSE);
PCK_AsigPuntuadasConNotas.Insertar ('Insertar una asignatura puntuada con una nota incumpliendo la RN-007', 2050010, 28, FALSE);
PCK_AsigPuntuadasConNotas.Eliminar ('Eliminar una asignatura puntuada con una nota', 2050004, 1, TRUE);
PCK_AsigPuntuadasConNotas.Consultar;
END;
/

--Tabla AsignaturasImpartidasEnAulas
BEGIN
PCK_AsigImpartidasEnAulas.Inicializar;
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050004, 1, TO_DATE('07/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050004, 7, TO_DATE('15/11/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050004, 3, TO_DATE('16/12/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050035, 5, TO_DATE('16/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050035, 6, TO_DATE('24/09/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050035, 2, TO_DATE('03/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050043, 1, TO_DATE('05/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050043, 9, TO_DATE('06/12/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050043, 5, TO_DATE('07/05/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050015, 1, TO_DATE('07/04/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050015, 7, TO_DATE('20/01/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050002, 4, TO_DATE('26/11/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050002, 1, TO_DATE('30/03/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050001, 3, TO_DATE('23/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050001, 2, TO_DATE('07/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050012, 6, TO_DATE('02/04/2017', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula', 2050012, 1, TO_DATE('01/10/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula con Codigo_Asig NULL', NULL, 1, TO_DATE('01/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula con OID_A NULL', 2050012, NULL, TO_DATE('01/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula con Fecha NULL', 2050012, 1, NULL, FALSE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula violando PK', 2050004, 1, TO_DATE('07/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula violando FK de asignaturas', 2999999, 1, TO_DATE('07/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula violando FK de aulas', 2050004, 666, TO_DATE('07/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_AsigImpartidasEnAulas.Insertar ('Insertar una asignatura impartida en un aula violando CK_Cod_Asig_AsigImpartEnAulas', 2004, 1, TO_DATE('07/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_AsigImpartidasEnAulas.Eliminar ('Eliminar una asignatura impartida en un aula', 2050004, 7, TO_DATE('15/11/2016', 'DD/MM/YYYY'), TRUE);
PCK_AsigImpartidasEnAulas.Consultar;
END;
/

--Tabla AsignaturasPertenecenAGrados
BEGIN
PCK_AsigPertenecenAGrados.Inicializar;
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050004, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050004, 3, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050043, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050043, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050035, 3, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050035, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050012, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050012, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050001, 3, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050001, 4, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050001, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050029, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050026, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050027, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050040, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado', 2050041, 1, TRUE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado con Codigo_Asig NULL', NULL, 1, FALSE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado con OID_G NULL', 2050004, NULL, FALSE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado violando PK', 2050004, 1, FALSE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado violando FK de asignaturas', 2999999, 1, FALSE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado violando FK de grados', 2050004, 666, FALSE);
PCK_AsigPertenecenAGrados.Insertar ('Insertar una asignatura perteneciente a un grado violando CK_Cod_Asig_AsigPertAGrad', 2004, 1, FALSE);
PCK_AsigPertenecenAGrados.Eliminar ('Eliminar una asignatura perteneciente a un grado', 2050004, 1, TRUE);
PCK_AsigPertenecenAGrados.Consultar;
END;
/

--Tabla Becarios
BEGIN
PCK_Becarios.Inicializar;
PCK_Becarios.Insertar ('Insertar un becario', '93839721C', '61700LIW', TO_DATE('07/10/2016', 'DD/MM/YYYY'), TO_DATE('23/05/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '07842998K', '18537TZN', TO_DATE('08/11/2016', 'DD/MM/YYYY'), TO_DATE('26/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '67202652X', '18537TZN', TO_DATE('15/09/2016', 'DD/MM/YYYY'), TO_DATE('05/03/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '27576410P', '93073MJH', TO_DATE('03/11/2016', 'DD/MM/YYYY'), TO_DATE('24/06/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '67202652X', '38720AJG', TO_DATE('13/12/2016', 'DD/MM/YYYY'), TO_DATE('27/01/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '70964804Y', '07284VPY', TO_DATE('17/10/2016', 'DD/MM/YYYY'), TO_DATE('28/02/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '47966225R', '18537TZN', TO_DATE('27/09/2016', 'DD/MM/YYYY'), TO_DATE('29/03/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '00548678J', '13617BAU', TO_DATE('14/11/2016', 'DD/MM/YYYY'), TO_DATE('14/04/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '64427553E', '84676UFX', TO_DATE('23/12/2016', 'DD/MM/YYYY'), TO_DATE('05/05/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario', '00548678J', '84676UFX', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Insertar ('Insertar un becario con DNI NULL', NULL, '84676UFX', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario con Codigo_Beca NULL', '00548678J', NULL, TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario violando PK', '93839721C', '61700LIW', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario violando FK de alumnos', '88888888C', '61700LIW', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario violando FK de becas', '93839721C', '99990LIW', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario violando CK_DNI_Becarios', '938C', '61700LIW', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario violando CK_Codigo_Becas_Becarios', '93839721C', '610099W', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario violando CK_Fechas_Becarios', '93839721C', '61700LIW', TO_DATE('06/06/2017', 'DD/MM/YYYY'), TO_DATE('30/09/2016', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Insertar ('Insertar un becario incumpliendo la RN-003', '93839721C', '61700LIW', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Actualizar ('Actualizar un becario', '93839721C', '61700LIW', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), TRUE);
PCK_Becarios.Actualizar ('Actualizar un becario violando CK_Fechas_Becarios', '93839721C', '61700LIW', TO_DATE('06/06/2017', 'DD/MM/YYYY'), TO_DATE('30/09/2016', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Actualizar ('Actualizar un becario incumpliendo la RN-003', '93839721C', '61700LIW', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/10/2016', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Actualizar ('Actualizar un becario inexistente', '67202652Q', '12345TZN', TO_DATE('30/09/2016', 'DD/MM/YYYY'), TO_DATE('06/06/2017', 'DD/MM/YYYY'), FALSE);
PCK_Becarios.Eliminar ('Eliminar un becario', '07842998K', '18537TZN', TRUE);
PCK_Becarios.Consultar;
END;
/

--Tabla GruposAsistenAClaseEnAulas
BEGIN
PCK_GruposAsistenAClaseEnAulas.Inicializar;
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 1, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 3, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 4, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 5, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 6, 3, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 7, 3, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 8, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 1, 7, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 4, 6, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 5, 5, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 7, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 9, 1, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 10, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula', 9, 4, TRUE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula con OID_Grup NULL', NULL, 2, FALSE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula con OID_A NULL', 1, NULL, FALSE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula violando FK de grupos', 666, 1, FALSE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula violando FK de aulas', 1, 666, FALSE);
PCK_GruposAsistenAClaseEnAulas.Insertar ('Insertar un grupo que asiste a clase en un aula incumpliendo la RN-006', 5, 15, FALSE);
PCK_GruposAsistenAClaseEnAulas.Eliminar ('Eliminar un grupo que asiste a clase en un aula', 6, 3, TRUE);
PCK_GruposAsistenAClaseEnAulas.Consultar;
END;
/

--Tabla Matriculas
BEGIN
PCK_Matriculas.Inicializar;
PCK_Matriculas.Insertar ('Insertar una matrícula', 3447488, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 1, '93839721C', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 2459519, TO_DATE('03/09/2016', 'DD/MM/YYYY'), 2, '07842998K', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 3171154, TO_DATE('05/09/2016', 'DD/MM/YYYY'), 1, '00548678J', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 1190202, TO_DATE('10/09/2016', 'DD/MM/YYYY'), 3, '35849097D', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 3771130, TO_DATE('03/09/2016', 'DD/MM/YYYY'), 1, '98523686N', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 9333670, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 4, '93839721C', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 3204793, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '07804804F', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 6521080, TO_DATE('06/09/2016', 'DD/MM/YYYY'), 2, '26810393Y', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 1367797, TO_DATE('03/09/2016', 'DD/MM/YYYY'), 3, '42312153L', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 6851033, TO_DATE('08/09/2016', 'DD/MM/YYYY'), 1, '42312153L', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 2623254, TO_DATE('02/09/2016', 'DD/MM/YYYY'), 2, '27576410P', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 7314633, TO_DATE('11/09/2016', 'DD/MM/YYYY'), 4, '64427553E', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 2826843, TO_DATE('05/09/2016', 'DD/MM/YYYY'), 1, '07804804F', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 1326913, TO_DATE('08/09/2016', 'DD/MM/YYYY'), 3, '77008982Z', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 7805950, TO_DATE('04/09/2016', 'DD/MM/YYYY'), 1, '62968537B', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 1065287, TO_DATE('08/09/2016', 'DD/MM/YYYY'), 3, '47966225R', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 1535713, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '23801240N', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 3988080, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 3, '36081385C', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula', 6255933, TO_DATE('02/09/2016', 'DD/MM/YYYY'), 1, '67202652X', TRUE);
PCK_Matriculas.Insertar ('Insertar una matrícula con Codigo_Matric NULL', NULL, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 1, '67202652X', FALSE);
PCK_Matriculas.Insertar ('Insertar una matrícula con DNI NULL', 1571054, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 1, NULL, FALSE);
PCK_Matriculas.Insertar ('Insertar una matrícula violando PK', 3447488, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '67202652X', FALSE);
PCK_Matriculas.Insertar ('Insertar una matrícula violando FK de alumnos', 1571054, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '99999999X', FALSE);
PCK_Matriculas.Insertar ('Insertar una matrícula violando CK_Cod_Matric_Matriculas', 6636, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 1, '67202652X', FALSE);
PCK_Matriculas.Insertar ('Insertar una matrícula violando CK_Curso_Matriculas', 1571054, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 5, '67202652X', FALSE);
PCK_Matriculas.Actualizar ('Actualizar una matrícula', 3447488, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 1, '67202652X', TRUE);
PCK_Matriculas.Actualizar ('Actualizar una matrícula con DNI NULL', 3447488, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 1, NULL, FALSE);
PCK_Matriculas.Actualizar ('Actualizar una matrícula violando FK de alumnos', 3447488, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '99999999X', FALSE);
PCK_Matriculas.Actualizar ('Actualizar una matrícula violando CK_Curso_Matriculas', 3447488, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 5, '67202652X', FALSE);
PCK_Matriculas.Actualizar ('Actualizar una matrícula inexistente', 3499988, TO_DATE('01/09/2016', 'DD/MM/YYYY'), 2, '67202652X', FALSE);
PCK_Matriculas.Eliminar ('Actualizar una matrícula inexistente', 2459519, TRUE);
PCK_Matriculas.Consultar;
END;
/

--Tabla MatriculasPertenecenAGrados
BEGIN
PCK_MatricPertenecenAGrados.Inicializar;
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 3447488, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1190202, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 6851033, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 6255933, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 7805950, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 3447488, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 1190202, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 6255933, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 2826843, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 7805950, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 9333670, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 3204793, 3, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 2623254, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 6521080, 4, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 6851033, 3, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado', 2826843, 1, TRUE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado con Codigo_Matric NULL', NULL, 1, FALSE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado con OID_G NULL', 2826843, NULL, FALSE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado violando PK', 3447488, 1, FALSE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado violando FK de matrículas', 9999999, 1, FALSE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado violando FK de grados', 3447488, 666, FALSE);
PCK_MatricPertenecenAGrados.Insertar ('Insertar una matrícula que pertenece a un grado violando CK_Cod_Matric_MatricPertAGrad', 7575, 1, FALSE);
PCK_MatricPertenecenAGrados.Eliminar ('Eliminar una matrícula que pertenece a un grado', 6255933, 1, TRUE);
PCK_MatricPertenecenAGrados.Consultar;
END;
/

--Tabla MatriculasContienenAsignaturas
BEGIN
PCK_MatriculasContienenAsig.Inicializar;
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 3447488, 2050004, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 3447488, 2050040, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 3447488, 2050029, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 3447488, 2050015, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 3447488, 2050019, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 3447488, 2050026, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1190202, 2050007, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1190202, 2050004, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1190202, 2050035, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1190202, 2050027, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1190202, 2050011, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 1190202, 2050043, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 6851033, 2050040, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 6851033, 2050035, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 6851033, 2050002, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 6851033, 2050001, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 6851033, 2050010, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 2826843, 2050017, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 2826843, 2050004, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 2826843, 2050035, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 2826843, 2050014, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 2826843, 2050020, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050026, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050020, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050011, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050024, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050043, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050027, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050029, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura', 7805950, 2050040, TRUE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura con Codigo_Matric NULL', NULL, 2050043, FALSE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura con Codigo_Asig NULL', 2826843, NULL, FALSE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura violando PK', 7805950, 2050043, FALSE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura violando FK de matrículas', 9999999, 2050043, FALSE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura violando FK de asignaturas', 7805950, 9999999, FALSE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura violando CK_Cod_Matric_MatricContAsig', 7850, 2050043, FALSE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura violando CK_Cod_Asig_MatricContAsig', 7805950, 4633, FALSE);
PCK_MatriculasContienenAsig.Insertar ('Insertar una matrícula que contiene una asignatura incumpliendo la RN-010', 7805950, 2050041, FALSE);
PCK_MatriculasContienenAsig.Eliminar ('Eliminar una matrícula que contiene una asignatura', 3447488, 2050040, TRUE);
PCK_MatriculasContienenAsig.Consultar;
END;
/

--Tabla Profesores
BEGIN
PCK_Profesores.Inicializar;
PCK_Profesores.Insertar ('Insertar un profesor', '53712051J', 'Rosa María', 'Acien Zuruta', TO_DATE('12/02/1988', 'DD/MM/YYYY'), 'rosamariaaz@gmail.com', 'Catedrático', 1, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75098488S', 'Daniel', 'Amate Garrido', TO_DATE('22/03/1976', 'DD/MM/YYYY'), 'danielag@gmail.com', 'Titular', 2, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '45295530C', 'José', 'Benayas Perez', TO_DATE('10/07/1967', 'DD/MM/YYYY'), 'josebp@gmail.com', 'Contratado doctor', 3, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '78035832Y', 'Susana', 'Bernabe Casanova', TO_DATE('04/07/1968', 'DD/MM/YYYY'), 'susanabc@gmail.com', 'Colaborador', 7, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '78035130V', 'Irene', 'Bernal Ruiz', TO_DATE('04/09/1980', 'DD/MM/YYYY'), 'irenebr@gmail.com', 'Ayudante', 9, 9, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75238658T', 'Magdalena', 'Carrera Benitez', TO_DATE('06/03/1974', 'DD/MM/YYYY'), 'magdalenacb@gmail.com', 'Ayudante doctor', 1, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75258403B', 'Natalia', 'Casas García', TO_DATE('17/08/1962', 'DD/MM/YYYY'), 'nataliacg@gmail.com', 'Interino', 5, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75243008A', 'Encarnación', 'Cortes Ibáñez', TO_DATE('18/05/1964', 'DD/MM/YYYY'), 'encarnacionci@gmail.com', 'Contratado doctor', 5, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor', '75257344X', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 5, 7, TRUE);
PCK_Profesores.Insertar ('Insertar un profesor con DNI NULL', NULL, 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 8, 7, FALSE);
PCK_Profesores.Insertar ('Insertar un profesor violando PK', '53712051J', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 8, 7, FALSE);
PCK_Profesores.Insertar ('Insertar un profesor violando FK de despachos', '67842443X', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 666, 7, FALSE);
PCK_Profesores.Insertar ('Insertar un profesor violando FK de departamentos', '67842443X', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 8, 666, FALSE);
PCK_Profesores.Insertar ('Insertar un profesor violando CK_DNI_Profesores', '6784fd', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 8, 7, FALSE);
PCK_Profesores.Insertar ('Insertar un profesor violando CK_Categoria_Profesores', '67842443X', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Temporal', 8, 7, FALSE);
PCK_Profesores.Insertar ('Insertar un profesor incumpliendo la RN-005', '67842443X', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 1, 7, FALSE);
PCK_Profesores.Actualizar ('Actualizar un profesor', '53712051J', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 1, 7, TRUE);
PCK_Profesores.Actualizar ('Actualizar un profesor con DNI NULL', NULL, 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 8, 7, FALSE);
PCK_Profesores.Actualizar ('Actualizar un profesor violando FK de despachos', '53712051J', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 666, 7, FALSE);
PCK_Profesores.Actualizar ('Actualizar un profesor violando FK de departamentos', '53712051J', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 8, 666, FALSE);
PCK_Profesores.Actualizar ('Actualizar un profesor violando CK_Categoria_Profesores', '53712051J', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Temporal', 8, 7, FALSE);
PCK_Profesores.Actualizar ('Actualizar un profesor incumpliendo la RN-005', '53712051J', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 5, 7, FALSE);
PCK_Profesores.Actualizar ('Actualizar un profesor inexistente', '13067547M', 'Mónica', 'Gonzalez Navas', TO_DATE('10/01/1980', 'DD/MM/YYYY'), 'monicagn@gmail.com', 'Titular', 8, 7, FALSE);
PCK_Profesores.Eliminar ('Eliminar un profesor', '75098488S', TRUE);
PCK_Profesores.Consultar;
END;
/

--Tabla ProfesoresImpartenAsignaturas
BEGIN
PCK_ProfesoresImpartenAsig.Inicializar;
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050001, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75257344X', 2050010, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '45295530C', 2050011, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050018, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75238658T', 2050026, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75258403B', 2050019, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035130V', 2050003, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050043, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '75257344X', 2050011, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '45295530C', 2050010, 12, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '78035832Y', 2050014, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050039, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura', '53712051J', 2050041, 6, TRUE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura con DNI NULL', NULL, 2050039, 6, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura con Codigo_Asig NULL', '53712051J', NULL, 6, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura violando PK', '53712051J', 2050001, 6, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura violando FK de profesores', '99999999J', 2050001, 6, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura violando FK de asignaturas', '53712051J', 6770001, 6, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura violando CK_DNI_ProfImpAsig', '5371GF51J', 2050001, 12, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura violando CK_Cod_Asig_ProfImpAsig', '75257344X', 2010, 12, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura incumpliendo la RN-013', '75257344X', 2050015, 6, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura incumpliendo la RN-014', '78035832Y', 2050026, 12, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura incumpliendo la RN-015', '78035130V', 2050009, 6, FALSE);
PCK_ProfesoresImpartenAsig.Insertar ('Insertar un profesor que imparte una asignatura incumpliendo la RN-015', '53712051J', 2050010, 6, FALSE);
PCK_ProfesoresImpartenAsig.Eliminar ('Eliminar un profesor que imparte una asignatura', '75257344X', 2050010, TRUE);
PCK_ProfesoresImpartenAsig.Consultar;
END;
/

--Tabla ProfesoresImpartenEnGrupos
BEGIN
PCK_ProfesoresImpartenEnGrupos.Inicializar;
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 3, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 4, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 6, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '53712051J', 8, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 7, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 10, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 14, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '78035832Y', 3, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '45295530C', 6, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '45295530C', 5, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '45295530C', 8, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '75258403B', 3, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo', '75258403B', 1, TRUE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo con DNI NULL', NULL, 1, FALSE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo con OID_Grup NULL', '75258403B', NULL, FALSE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo violando PK', '53712051J', 3, FALSE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo violando FK de profesores', '88888584J', 3, FALSE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo violando FK de grupos', '53712051J', 666, FALSE);
PCK_ProfesoresImpartenEnGrupos.Insertar ('Insertar un profesor que imparte en un grupo violando CK_DNI_ProfImpEnGrup', '537ds1J', 6, FALSE);
PCK_ProfesoresImpartenEnGrupos.Eliminar ('Eliminar un profesor que imparte en un grupo', '53712051J', 3, TRUE);
PCK_ProfesoresImpartenEnGrupos.Consultar;
END;
/

--Tabla Tutorias
BEGIN
PCK_Tutorias.Inicializar;
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '93839721C', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('17/11/2016', 'DD/MM/YYYY'), '18:30', 25, '07842998K', '75258403B', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('19/12/2016', 'DD/MM/YYYY'), '20:00', 20, '27576410P', '78035832Y', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('21/02/2017', 'DD/MM/YYYY'), '09:30', 10, '07842998K', '75258403B', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '16:00', 30, '62968537B', '53712051J', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '12:50', 25, '62968537B', '53712051J', TRUE);
PCK_Tutorias.Insertar ('Insertar una tutoría DNI_Alum NULL', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, NULL, '78035832Y', FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría DNI_Prof NULL', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '93839721C', NULL, FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría violando FK de alumnos', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '55533672C', '78035832Y', FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría violando FK de profesores', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '93839721C', '77537276Y', FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría violando CK_Hora_Comienzo_Tutorias', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '35:80', 20, '93839721C', '78035832Y', FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría violando CK_DNI_Alum_Tutorias', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '938s1C', '78035832Y', FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría violando CK_DNI_Prof_Tutorias', TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '93839721C', '780gd832Y', FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría incumpliendo la RN-016', TO_DATE('08/01/2017', 'DD/MM/YYYY'), '17:00', 20, '93839721C', '78035832Y', FALSE);
PCK_Tutorias.Insertar ('Insertar una tutoría incumpliendo la RN-017', TO_DATE('12/01/2017', 'DD/MM/YYYY'), '17:00', 50, '93839721C', '78035832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '12:50', 25, '62968537B', '53712051J', TRUE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría DNI_Alum NULL', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, NULL, '78035832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría DNI_Prof NULL', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '93839721C', NULL, FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría violando FK de alumnos', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '55533672C', '78035832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría violando FK de profesores', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '93839721C', '77537276Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría violando CK_Hora_Comienzo_Tutorias', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '35:80', 20, '93839721C', '78035832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría violando CK_DNI_Alum_Tutorias', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '938s1C', '78035832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría violando CK_DNI_Prof_Tutorias', 1, TO_DATE('12/10/2016', 'DD/MM/YYYY'), '17:00', 20, '93839721C', '780gd832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría incumpliendo la RN-016', 1, TO_DATE('08/01/2017', 'DD/MM/YYYY'), '17:00', 20, '93839721C', '78035832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría incumpliendo la RN-017', 1, TO_DATE('12/01/2017', 'DD/MM/YYYY'), '17:00', 50, '93839721C', '78035832Y', FALSE);
PCK_Tutorias.Actualizar ('Actualizar una tutoría inexistente', 666, TO_DATE('12/01/2017', 'DD/MM/YYYY'), '17:00', 50, '93839721C', '78035832Y', FALSE);
PCK_Tutorias.Eliminar ('Eliminar una tutoría', 2, TRUE);
PCK_Tutorias.Consultar;
END;
/