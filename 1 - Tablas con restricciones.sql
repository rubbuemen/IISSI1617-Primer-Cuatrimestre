--Creación de tablas
CREATE TABLE Alumnos(
    DNI CHAR(9),
    Nombre VARCHAR2(20),
    Apellidos VARCHAR2(35),
    Fecha_Nacimiento DATE,
    Email VARCHAR2(40)
);

CREATE TABLE AlumnosPertenecenAGrupos(
	DNI CHAR(9),
	OID_Grup NUMBER
);

CREATE TABLE Asignaturas(
	Codigo_Asig INTEGER,
	Nombre VARCHAR2(100),
	Acronimo VARCHAR2(7),
	Creditos NUMBER,
	Periodo VARCHAR2(25),
	Curso INTEGER,
	Tipo VARCHAR2(25),
	OID_Dep NUMBER	
);

CREATE TABLE AsignaturasPuntuadasConNotas(
	Codigo_Asig INTEGER,
	OID_N NUMBER
);

CREATE TABLE AsignaturasImpartidasEnAulas(
	Codigo_Asig INTEGER,
	OID_A NUMBER,
	Fecha DATE
);

CREATE TABLE AsignaturasPertenecenAGrados(
    Codigo_Asig INTEGER,
    OID_G NUMBER
);

CREATE TABLE Aulas(
	OID_A NUMBER,
	Nombre VARCHAR2(6),
	Capacidad INTEGER,
	Tipo VARCHAR2(15)
);

CREATE TABLE Becarios(
	DNI CHAR(9),
	Codigo_Beca CHAR(8),
	Fecha_Comienzo DATE,
	Fecha_Fin DATE
);

CREATE TABLE Becas(
	Codigo_Beca CHAR(8),
	Cuantia_Fija NUMBER,
	Cuantia_Variable NUMBER,
	Tipo VARCHAR2(15)
);

CREATE TABLE Departamentos(
	OID_Dep NUMBER,
	Nombre VARCHAR2(50)
);

CREATE TABLE Despachos(
	OID_D NUMBER,
	Nombre VARCHAR2(6),
	Capacidad INTEGER
);

CREATE TABLE Expedientes(
	Codigo_Exp INTEGER,
	DNI CHAR(9)
);

CREATE TABLE Grados(
	OID_G NUMBER,
	Nombre VARCHAR2(100)
);

CREATE TABLE Grupos(
	OID_Grup NUMBER,
	Nombre VARCHAR2(10)
);

CREATE TABLE GruposAsistenAClaseEnAulas(
	OID_Grup NUMBER,
	OID_A NUMBER
);

CREATE TABLE Matriculas(
    Codigo_Matric INTEGER,
    Fecha DATE,
    Curso INTEGER,
    DNI CHAR(9)
);

CREATE TABLE MatriculasContienenAsignaturas(
	Codigo_Matric INTEGER,
	Codigo_Asig INTEGER
);

CREATE TABLE MatriculasPertenecenAGrados(
	Codigo_Matric INTEGER,
	OID_G NUMBER
);

CREATE TABLE Notas(
	OID_N NUMBER,
	Valor NUMBER,
	Calificacion VARCHAR2(25),
	Convocatoria VARCHAR2(15),
	Curso INTEGER,
	Fecha DATE,
	Codigo_Exp INTEGER
);

CREATE TABLE Profesores(
	DNI CHAR(9),
	Nombre VARCHAR2(20),
	Apellidos VARCHAR2(35),
	Fecha_Nacimiento DATE,
	Email VARCHAR2(40),
	Categoria VARCHAR2(20),
	OID_D NUMBER,
	OID_Dep NUMBER
);

CREATE TABLE ProfesoresImpartenAsignaturas(
	DNI CHAR(9),
	Codigo_Asig INTEGER,
	Dedicacion NUMBER
);

CREATE TABLE ProfesoresImpartenEnGrupos(
	DNI CHAR(9),
	OID_Grup NUMBER
);

CREATE TABLE Tutorias(
	OID_T NUMBER,
	Fecha DATE,
	Hora_Comienzo VARCHAR2(5),
	Duracion INTEGER,
	DNI_Alum CHAR(9),
	DNI_Prof CHAR(9)
);


--Restricciones NOT NULL
ALTER TABLE Alumnos MODIFY (DNI NOT NULL);
ALTER TABLE AlumnosPertenecenAGrupos MODIFY (DNI NOT NULL);
ALTER TABLE AlumnosPertenecenAGrupos MODIFY (OID_Grup NOT NULL);
ALTER TABLE Asignaturas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE Asignaturas MODIFY (Nombre NOT NULL);
ALTER TABLE AsignaturasPuntuadasConNotas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE AsignaturasPuntuadasConNotas MODIFY (OID_N NOT NULL);
ALTER TABLE AsignaturasImpartidasEnAulas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE AsignaturasImpartidasEnAulas MODIFY (OID_A NOT NULL);
ALTER TABLE AsignaturasImpartidasEnAulas MODIFY (Fecha NOT NULL);
ALTER TABLE AsignaturasPertenecenAGrados MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE AsignaturasPertenecenAGrados MODIFY (OID_G NOT NULL);
ALTER TABLE Aulas MODIFY (OID_A NOT NULL);
ALTER TABLE Aulas MODIFY (Nombre NOT NULL);
ALTER TABLE Becarios MODIFY (DNI NOT NULL);
ALTER TABLE Becarios MODIFY (Codigo_Beca NOT NULL);
ALTER TABLE Becas MODIFY (Codigo_Beca NOT NULL);
ALTER TABLE Departamentos MODIFY (OID_Dep NOT NULL);
ALTER TABLE Departamentos MODIFY (Nombre NOT NULL);
ALTER TABLE Despachos MODIFY (OID_D NOT NULL);
ALTER TABLE Despachos MODIFY (Nombre NOT NULL);
ALTER TABLE Expedientes MODIFY (Codigo_Exp NOT NULL);
ALTER TABLE Expedientes MODIFY (DNI NOT NULL);
ALTER TABLE Grados MODIFY (OID_G NOT NULL);
ALTER TABLE Grados MODIFY (Nombre NOT NULL);
ALTER TABLE Grupos MODIFY (OID_Grup NOT NULL);
ALTER TABLE Grupos MODIFY (Nombre NOT NULL);
ALTER TABLE GruposAsistenAClaseEnAulas MODIFY (OID_Grup NOT NULL);
ALTER TABLE GruposAsistenAClaseEnAulas MODIFY (OID_A NOT NULL);
ALTER TABLE Matriculas MODIFY (Codigo_Matric NOT NULL);
ALTER TABLE Matriculas MODIFY (DNI NOT NULL);
ALTER TABLE MatriculasContienenAsignaturas MODIFY (Codigo_Matric NOT NULL);
ALTER TABLE MatriculasContienenAsignaturas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE MatriculasPertenecenAGrados MODIFY (Codigo_Matric NOT NULL);
ALTER TABLE MatriculasPertenecenAGrados MODIFY (OID_G NOT NULL);
ALTER TABLE Notas MODIFY (OID_N NOT NULL);
ALTER TABLE Notas MODIFY (Codigo_Exp NOT NULL);
ALTER TABLE Profesores MODIFY (DNI NOT NULL);
ALTER TABLE ProfesoresImpartenAsignaturas MODIFY (DNI NOT NULL);
ALTER TABLE ProfesoresImpartenAsignaturas MODIFY (Codigo_Asig NOT NULL);
ALTER TABLE ProfesoresImpartenEnGrupos MODIFY (DNI NOT NULL);
ALTER TABLE ProfesoresImpartenEnGrupos MODIFY (OID_Grup NOT NULL);
ALTER TABLE Tutorias MODIFY (OID_T NOT NULL);
ALTER TABLE Tutorias MODIFY (DNI_Alum NOT NULL);
ALTER TABLE Tutorias MODIFY (DNI_Prof NOT NULL);


--Primary Keys
ALTER TABLE Alumnos ADD CONSTRAINT PK_Alumnos PRIMARY KEY (DNI);
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT PK_AlumPertAGrup PRIMARY KEY (DNI, OID_Grup);
ALTER TABLE Asignaturas ADD CONSTRAINT PK_Asignaturas PRIMARY KEY (Codigo_Asig);
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT PK_AsigPuntConNot PRIMARY KEY (Codigo_Asig, OID_N);
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT PK_AsigImpartEnAulas PRIMARY KEY (Codigo_Asig, OID_A, Fecha);
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT PK_AsigPertAGrad PRIMARY KEY (Codigo_Asig, OID_G);
ALTER TABLE Aulas ADD CONSTRAINT PK_Aulas PRIMARY KEY (OID_A);
ALTER TABLE Becarios ADD CONSTRAINT PK_Becarios PRIMARY KEY (DNI, Codigo_Beca);
ALTER TABLE Becas ADD CONSTRAINT PK_Becas PRIMARY KEY (Codigo_Beca);
ALTER TABLE Departamentos ADD CONSTRAINT PK_Departamentos PRIMARY KEY (OID_Dep);
ALTER TABLE Despachos ADD CONSTRAINT PK_Despachos PRIMARY KEY (OID_D);
ALTER TABLE Expedientes ADD CONSTRAINT PK_Expedientes PRIMARY KEY (Codigo_Exp);
ALTER TABLE Grados ADD CONSTRAINT PK_Grados PRIMARY KEY (OID_G);
ALTER TABLE Grupos ADD CONSTRAINT PK_Grupos PRIMARY KEY (OID_Grup);
ALTER TABLE GruposAsistenAClaseEnAulas ADD CONSTRAINT PK_GrupAsisAClaseEnAulas PRIMARY KEY (OID_Grup, OID_A);
ALTER TABLE Matriculas ADD CONSTRAINT PK_Matriculas PRIMARY KEY (Codigo_Matric);
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT PK_MatricContAsig PRIMARY KEY (Codigo_Matric, Codigo_Asig);
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT PK_MatricPertAGrad PRIMARY KEY (Codigo_Matric, OID_G);
ALTER TABLE Notas ADD CONSTRAINT PK_Notas PRIMARY KEY (OID_N);
ALTER TABLE Profesores ADD CONSTRAINT PK_Profesores PRIMARY KEY (DNI);
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT PK_ProfImpAsig PRIMARY KEY (DNI, Codigo_Asig);
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT PK_ProfImpEnGrup PRIMARY KEY (DNI, OID_Grup);
ALTER TABLE Tutorias ADD CONSTRAINT PK_Tutorias PRIMARY KEY (OID_T);


--Alternate Keys
ALTER TABLE Asignaturas ADD CONSTRAINT AK_Asignaturas UNIQUE (Nombre);
ALTER TABLE Aulas ADD CONSTRAINT AK_Aulas UNIQUE (Nombre);
ALTER TABLE Departamentos ADD CONSTRAINT AK_Departamentos UNIQUE (Nombre);
ALTER TABLE Despachos ADD CONSTRAINT AK_Despachos UNIQUE (Nombre);
ALTER TABLE Grados ADD CONSTRAINT AK_Grados UNIQUE (Nombre);
ALTER TABLE Grupos ADD CONSTRAINT AK_Grupos UNIQUE (Nombre);


--Foreign Keys
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT FK_AlumPertAGrup_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT FK_AlumPertAGrup_Grup FOREIGN KEY (OID_Grup) REFERENCES Grupos (OID_Grup) ON DELETE CASCADE;
ALTER TABLE Asignaturas ADD CONSTRAINT FK_Asignaturas_Dep FOREIGN KEY (OID_Dep) REFERENCES Departamentos (OID_Dep) ON DELETE CASCADE;
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT FK_AsigPuntConNot_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT FK_AsigPuntConNot_Not FOREIGN KEY (OID_N) REFERENCES Notas (OID_N) ON DELETE CASCADE;
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT FK_AsigImpartEnAulas_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT FK_AsigImpartEnAulas_Aulas FOREIGN KEY (OID_A) REFERENCES Aulas (OID_A) ON DELETE CASCADE;
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT FK_AsigPertAGrad_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT FK_AsigPertAGrad_G FOREIGN KEY (OID_G) REFERENCES Grados (OID_G) ON DELETE CASCADE;
ALTER TABLE Becarios ADD CONSTRAINT FK_Becarios_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE Becarios ADD CONSTRAINT FK_Becarios_Becas FOREIGN KEY (Codigo_Beca) REFERENCES Becas (Codigo_Beca) ON DELETE CASCADE;
ALTER TABLE Expedientes ADD CONSTRAINT FK_Expedientes_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE GruposAsistenAClaseEnAulas ADD CONSTRAINT FK_GrupAsisAClaseEnAulas_Grup FOREIGN KEY (OID_Grup) REFERENCES Grupos (OID_Grup) ON DELETE CASCADE;
ALTER TABLE GruposAsistenAClaseEnAulas ADD CONSTRAINT FK_GrupAsisAClaseEnAulas_Aulas FOREIGN KEY (OID_A) REFERENCES Aulas (OID_A) ON DELETE CASCADE;
ALTER TABLE Matriculas ADD CONSTRAINT FK_Matriculas_Alum FOREIGN KEY (DNI) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT FK_MatricContAsig_Matric FOREIGN KEY (Codigo_Matric) REFERENCES Matriculas (Codigo_Matric) ON DELETE CASCADE;
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT FK_MatricContAsig_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT FK_MatricPertAGrad_Matric FOREIGN KEY (Codigo_Matric) REFERENCES Matriculas (Codigo_Matric) ON DELETE CASCADE;
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT FK_MatricPertAGrad_G FOREIGN KEY (OID_G) REFERENCES Grados (OID_G) ON DELETE CASCADE;
ALTER TABLE Notas ADD CONSTRAINT FK_Notas_Exp FOREIGN KEY (Codigo_Exp) REFERENCES Expedientes (Codigo_Exp) ON DELETE CASCADE;
ALTER TABLE Profesores ADD CONSTRAINT FK_Profesores_D FOREIGN KEY (OID_D) REFERENCES Despachos (OID_D) ON DELETE CASCADE;
ALTER TABLE Profesores ADD CONSTRAINT FK_Profesores_Dep FOREIGN KEY (OID_Dep) REFERENCES Departamentos (OID_Dep) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT FK_ProfImpAsig_Prof FOREIGN KEY (DNI) REFERENCES Profesores (DNI) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT FK_ProfImpAsig_Asig FOREIGN KEY (Codigo_Asig) REFERENCES Asignaturas (Codigo_Asig) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT FK_ProfImpEnGrup_Prof FOREIGN KEY (DNI) REFERENCES Profesores (DNI) ON DELETE CASCADE;
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT FK_ProfImpEnGrup_Grup FOREIGN KEY (OID_Grup) REFERENCES Grupos (OID_Grup) ON DELETE CASCADE;
ALTER TABLE Tutorias ADD CONSTRAINT FK_Tutorias_Alum FOREIGN KEY (DNI_Alum) REFERENCES Alumnos (DNI) ON DELETE CASCADE;
ALTER TABLE Tutorias ADD CONSTRAINT FK_Tutorias_Prof FOREIGN KEY (DNI_Prof) REFERENCES Profesores (DNI) ON DELETE CASCADE;


--Restricciones de tablas
ALTER TABLE Alumnos ADD CONSTRAINT CK_DNI_Alumnos CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE AlumnosPertenecenAGrupos ADD CONSTRAINT CK_DNI_AlumPertAGrup CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Cod_Asig_Asignaturas CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Periodo_Asignaturas CHECK (Periodo IN ('Anual', 'Primer cuatrimestre', 'Segundo cuatrimestre'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Curso_Asignaturas CHECK (Curso IN ('1', '2', '3', '4'));
ALTER TABLE Asignaturas ADD CONSTRAINT CK_Tipo_Asignaturas CHECK (Tipo IN ('Troncal', 'Obligatorio', 'Optativo'));
ALTER TABLE AsignaturasPuntuadasConNotas ADD CONSTRAINT CK_Cod_Asig_AsigPuntConNot CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE AsignaturasImpartidasEnAulas ADD CONSTRAINT CK_Cod_Asig_AsigImpartEnAulas CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE AsignaturasPertenecenAGrados ADD CONSTRAINT CK_Cod_Asig_AsigPertAGrad CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Aulas ADD CONSTRAINT CK_Tipo_Aulas CHECK (Tipo IN ('Teoría', 'Laboratorio', 'Examen'));
ALTER TABLE Becarios ADD CONSTRAINT CK_DNI_Becarios CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Becarios ADD CONSTRAINT CK_Codigo_Becas_Becarios CHECK (REGEXP_LIKE(Codigo_Beca, '[0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
ALTER TABLE Becarios ADD CONSTRAINT CK_Fechas_Becarios CHECK (TO_DATE(Fecha_Comienzo, 'DD/MM/YYYY') < TO_DATE(Fecha_Fin, 'DD/MM/YYYY'));
ALTER TABLE Becas ADD CONSTRAINT CK_Codigo_Becas CHECK (REGEXP_LIKE(Codigo_Beca, '[0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]'));
ALTER TABLE Becas ADD CONSTRAINT CK_Tipo_Becas CHECK (Tipo IN ('Ordinaria', 'Movilidad', 'Empresa'));
ALTER TABLE Expedientes ADD CONSTRAINT CK_Codigo_Expedientes CHECK (REGEXP_LIKE(Codigo_Exp, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Expedientes ADD CONSTRAINT CK_DNI_Expedientes CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Matriculas ADD CONSTRAINT CK_Cod_Matric_Matriculas CHECK (REGEXP_LIKE(Codigo_Matric, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Matriculas ADD CONSTRAINT CK_Curso_Matriculas CHECK (Curso IN ('1', '2', '3', '4'));
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT CK_Cod_Matric_MatricContAsig CHECK (REGEXP_LIKE(Codigo_Matric, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE MatriculasContienenAsignaturas ADD CONSTRAINT CK_Cod_Asig_MatricContAsig CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE MatriculasPertenecenAGrados ADD CONSTRAINT CK_Cod_Matric_MatricPertAGrad CHECK (REGEXP_LIKE(Codigo_Matric, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE Notas ADD CONSTRAINT CK_Calificacion_Notas CHECK (Calificacion IN ('Suspenso', 'Aprobado', 'Notable', 'Sobresaliente', 'Matrícula de honor'));
ALTER TABLE Notas ADD CONSTRAINT CK_Convocatoria_Notas CHECK (Convocatoria IN ('Primera', 'Segunda', 'Tercera'));
ALTER TABLE Notas ADD CONSTRAINT CK_Curso_Notas CHECK (Curso IN ('1', '2', '3', '4'));
ALTER TABLE Profesores ADD CONSTRAINT CK_DNI_Profesores CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Profesores ADD CONSTRAINT CK_Categoria_Profesores CHECK (Categoria IN ('Catedrático', 'Titular', 'Contratado doctor', 'Colaborador', 'Ayudante doctor', 'Ayudante', 'Interino'));
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT CK_DNI_ProfImpAsig CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE ProfesoresImpartenAsignaturas ADD CONSTRAINT CK_Cod_Asig_ProfImpAsig CHECK (REGEXP_LIKE(Codigo_Asig, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9]'));
ALTER TABLE ProfesoresImpartenEnGrupos ADD CONSTRAINT CK_DNI_ProfImpEnGrup CHECK (REGEXP_LIKE(DNI, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Tutorias ADD CONSTRAINT CK_Hora_Comienzo_Tutorias CHECK (REGEXP_LIKE(Hora_Comienzo, '[0-2][0-9]:[0-5][0-9]'));
ALTER TABLE Tutorias ADD CONSTRAINT CK_DNI_Alum_Tutorias CHECK (REGEXP_LIKE(DNI_Alum, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));
ALTER TABLE Tutorias ADD CONSTRAINT CK_DNI_Prof_Tutorias CHECK (REGEXP_LIKE(DNI_Prof, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]'));