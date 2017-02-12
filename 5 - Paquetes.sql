--Función auxiliar
CREATE OR REPLACE FUNCTION ASSERT_EQUALS (v_Salida BOOLEAN, salidaEsperada BOOLEAN)
RETURN VARCHAR2
IS
BEGIN
	IF v_Salida = salidaEsperada THEN
		RETURN 'ÉXITO';
	ELSE
		RETURN 'FALLO';
	END IF;
END;
/

--Cabeceras de paquetes
--Tabla Alumnos
CREATE OR REPLACE PACKAGE PCK_Alumnos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla AlumnosPertenecenAGrupos
CREATE OR REPLACE PACKAGE PCK_AlumnosPertenecenAGrupos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Asignaturas
CREATE OR REPLACE PACKAGE PCK_Asignaturas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla AsignaturasPuntuadasConNotas
CREATE OR REPLACE PACKAGE PCK_AsigPuntuadasConNotas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla AsignaturasImpartidasEnAulas
CREATE OR REPLACE PACKAGE PCK_AsigImpartidasEnAulas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla AsignaturasPertenecenAGrados
CREATE OR REPLACE PACKAGE PCK_AsigPertenecenAGrados
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Aulas
CREATE OR REPLACE PACKAGE PCK_Aulas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Becarios
CREATE OR REPLACE PACKAGE PCK_Becarios
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Becas
CREATE OR REPLACE PACKAGE PCK_Becas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Departamentos
CREATE OR REPLACE PACKAGE PCK_Departamentos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Despachos
CREATE OR REPLACE PACKAGE PCK_Despachos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Expedientes
CREATE OR REPLACE PACKAGE PCK_Expedientes
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Grados
CREATE OR REPLACE PACKAGE PCK_Grados
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Grupos
CREATE OR REPLACE PACKAGE PCK_Grupos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla GruposAsistenAClaseEnAulas
CREATE OR REPLACE PACKAGE PCK_GruposAsistenAClaseEnAulas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Matriculas
CREATE OR REPLACE PACKAGE PCK_Matriculas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla MatriculasContienenAsignaturas
CREATE OR REPLACE PACKAGE PCK_MatriculasContienenAsig
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla MatriculasPertenecenAGrados
CREATE OR REPLACE PACKAGE PCK_MatricPertenecenAGrados
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Notas
CREATE OR REPLACE PACKAGE PCK_Notas
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Profesores
CREATE OR REPLACE PACKAGE PCK_Profesores
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla ProfesoresImpartenAsignaturas
CREATE OR REPLACE PACKAGE PCK_ProfesoresImpartenAsig
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla ProfesoresImpartenEnGrupos
CREATE OR REPLACE PACKAGE PCK_ProfesoresImpartenEnGrupos
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN);
END;
/

--Tabla Tutorias
CREATE OR REPLACE PACKAGE PCK_Tutorias
IS
PROCEDURE Inicializar;
PROCEDURE Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN);
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, salidaEsperada BOOLEAN);
END;
/


--Cuerpos de paquetes
--Tabla Alumnos
CREATE OR REPLACE PACKAGE BODY PCK_Alumnos
IS
	CURSOR C IS
		SELECT * FROM Alumnos;
	v_Salida BOOLEAN := TRUE;
	v_Alumnos Alumnos%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Alumnos;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Alumnos;
		DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha_Nacimiento:', 25) || RPAD('Email:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI, 25) || RPAD(v_Alumnos.Nombre, 25) || RPAD(v_Alumnos.Apellidos, 25) || RPAD(v_Alumnos.Fecha_Nacimiento, 25) || RPAD(v_Alumnos.Email, 25));
		FETCH C INTO v_Alumnos;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO Alumnos (DNI, Nombre, Apellidos, Fecha_Nacimiento, Email) VALUES (v_DNI, v_Nombre, v_Apellidos, v_Fecha_Nacimiento, v_Email);
		SELECT * INTO v_Alumnos FROM Alumnos WHERE DNI = v_DNI;
		IF v_Alumnos.Nombre != v_Nombre AND v_Alumnos.Apellidos != v_Apellidos AND v_Alumnos.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Alumnos.Email != v_Email THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, v_Nombre IN Alumnos.Nombre%TYPE, v_Apellidos IN Alumnos.Apellidos%TYPE, v_Fecha_Nacimiento IN Alumnos.Fecha_Nacimiento%TYPE, v_Email IN Alumnos.Email%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Alumnos SET Nombre = v_Nombre, Apellidos = v_Apellidos, Fecha_Nacimiento = v_Fecha_Nacimiento, Email = v_Email WHERE DNI = v_DNI;
		SELECT * INTO v_Alumnos FROM Alumnos WHERE DNI = v_DNI;
		IF v_Alumnos.Nombre != v_Nombre AND v_Alumnos.Apellidos != v_Apellidos AND v_Alumnos.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Alumnos.Email != v_Email THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Alumnos.DNI%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumAlumnos NUMBER := 0;
	BEGIN
		DELETE FROM Alumnos WHERE DNI = v_DNI;
		SELECT COUNT(*) INTO v_NumAlumnos FROM Alumnos WHERE DNI = v_DNI;
		IF v_NumAlumnos != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla AlumnosPertenecenAGrupos
CREATE OR REPLACE PACKAGE BODY PCK_AlumnosPertenecenAGrupos
IS
    CURSOR C IS
        SELECT * FROM AlumnosPertenecenAGrupos;
    v_Salida BOOLEAN := TRUE;
    v_AlumnosPertenecenAGrupos AlumnosPertenecenAGrupos%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM AlumnosPertenecenAGrupos;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_AlumnosPertenecenAGrupos;
        DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('OID_Grup:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_AlumnosPertenecenAGrupos.DNI, 25) || RPAD(v_AlumnosPertenecenAGrupos.OID_Grup, 25));
        FETCH C INTO v_AlumnosPertenecenAGrupos;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO AlumnosPertenecenAGrupos (DNI, OID_Grup) VALUES (v_DNI, v_OID_grup);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN AlumnosPertenecenAGrupos.DNI%TYPE, v_OID_Grup IN AlumnosPertenecenAGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAlumnosPertenecenAGrupos NUMBER := 0;
    BEGIN
        DELETE FROM AlumnosPertenecenAGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
        SELECT COUNT(*) INTO v_NumAlumnosPertenecenAGrupos FROM AlumnosPertenecenAGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
        IF v_NumAlumnosPertenecenAGrupos != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/

--Tabla Asignaturas
CREATE OR REPLACE PACKAGE BODY PCK_Asignaturas
IS
    CURSOR C IS
        SELECT * FROM Asignaturas;
    v_Salida BOOLEAN := TRUE;
    v_Asignaturas Asignaturas%ROWTYPE;
PROCEDURE Inicializar
    IS
    BEGIN
        DELETE FROM Asignaturas;
    END Inicializar;
PROCEDURE Consultar
    IS
    BEGIN
        OPEN C;
        FETCH C INTO v_Asignaturas;
        DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('Nombre:', 75) || RPAD('Acronimo:', 25) || RPAD('Creditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25) || RPAD('OID_Dep:', 25));
        DBMS_OUTPUT.PUT_LINE(LPAD('-', 250, '-'));
        WHILE C%FOUND LOOP 
            DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Codigo_Asig, 25) || RPAD(v_Asignaturas.Nombre, 75) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25) || RPAD(v_Asignaturas.OID_Dep, 25));
        FETCH C INTO v_Asignaturas;
        END LOOP;
        CLOSE C;
    END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        INSERT INTO Asignaturas (Codigo_Asig, Nombre, Acronimo, Creditos, Periodo, Curso, Tipo, OID_Dep) VALUES (v_Codigo_Asig, v_Nombre, v_Acronimo, v_Creditos, v_Periodo, v_Curso, v_Tipo, v_OID_Dep);
        SELECT * INTO v_Asignaturas FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
        IF (v_Asignaturas.Nombre != v_Nombre AND v_Asignaturas.Acronimo != v_Acronimo AND v_Asignaturas.Creditos != v_Creditos AND v_Asignaturas.Periodo != v_Periodo AND v_Asignaturas.Curso != v_Curso AND v_Asignaturas.Tipo != v_Tipo AND v_Asignaturas.OID_Dep != v_OID_Dep) THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2,v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Nombre IN Asignaturas.Nombre%TYPE, v_Acronimo IN Asignaturas.Acronimo%TYPE, v_Creditos IN Asignaturas.Creditos%TYPE, v_Periodo IN Asignaturas.Periodo%TYPE, v_Curso IN Asignaturas.Curso%TYPE, v_Tipo IN Asignaturas.Tipo%TYPE, v_OID_Dep IN Asignaturas.OID_Dep%TYPE, salidaEsperada BOOLEAN)
    IS
    BEGIN
        UPDATE Asignaturas SET Nombre = v_Nombre, Acronimo = v_Acronimo, Creditos = v_Creditos, Periodo = v_Periodo, Curso = v_Curso, Tipo = v_Tipo, OID_Dep = v_OID_Dep WHERE Codigo_Asig = v_Codigo_asig;
        SELECT * INTO v_Asignaturas FROM Asignaturas WHERE  Codigo_Asig = v_Codigo_asig;
        IF v_Asignaturas.Nombre != v_Nombre AND v_Asignaturas.Acronimo != v_Acronimo AND v_Asignaturas.Creditos != v_Creditos AND v_Asignaturas.Periodo != v_Periodo AND v_Asignaturas.Curso = v_Curso AND v_Asignaturas.Tipo = v_Tipo AND v_Asignaturas.OID_Dep = v_OID_Dep  THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumAsignaturas NUMBER := 0;
    BEGIN
        DELETE FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
        SELECT COUNT(*) INTO v_NumAsignaturas FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
        IF v_NumAsignaturas != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/

--Tabla AsignaturasPuntuadasConNotas
CREATE OR REPLACE PACKAGE BODY PCK_AsigPuntuadasConNotas
IS
	CURSOR C IS
		SELECT * FROM AsignaturasPuntuadasConNotas;
	v_Salida BOOLEAN := TRUE;
	v_AsignaturasPuntuadasConNotas AsignaturasPuntuadasConNotas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM AsignaturasPuntuadasConNotas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_AsignaturasPuntuadasConNotas;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('OID_N:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_AsignaturasPuntuadasConNotas.Codigo_Asig, 25) || RPAD(v_AsignaturasPuntuadasConNotas.OID_N, 25) );
		FETCH C INTO v_AsignaturasPuntuadasConNotas;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO AsignaturasPuntuadasConNotas (Codigo_Asig, OID_N) VALUES (v_Codigo_Asig, v_OID_N);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumAsigPuntuadasConNotas NUMBER := 0;
	BEGIN
		DELETE FROM AsignaturasPuntuadasConNotas WHERE Codigo_Asig = v_Codigo_Asig AND OID_N = v_OID_N;
		SELECT COUNT(*) INTO v_NumAsigPuntuadasConNotas FROM AsignaturasPuntuadasConNotas WHERE Codigo_Asig = v_Codigo_Asig AND OID_N = v_OID_N;
		IF v_NumAsigPuntuadasConNotas != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla AsignaturasImpartidasEnAulas
CREATE OR REPLACE PACKAGE BODY PCK_AsigImpartidasEnAulas
IS
	CURSOR C IS
		SELECT * FROM AsignaturasImpartidasEnAulas;
	v_Salida BOOLEAN := TRUE;
	v_AsignaturasImpartidasEnAulas AsignaturasImpartidasEnAulas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM AsignaturasImpartidasEnAulas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_AsignaturasImpartidasEnAulas;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('OID_A:', 25) || RPAD('Fecha:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_AsignaturasImpartidasEnAulas.Codigo_Asig, 25) || RPAD(v_AsignaturasImpartidasEnAulas.OID_A, 25) || RPAD(v_AsignaturasImpartidasEnAulas.Fecha, 25));
		FETCH C INTO v_AsignaturasImpartidasEnAulas;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO AsignaturasImpartidasEnAulas (Codigo_Asig, OID_A, Fecha) VALUES (v_Codigo_Asig, v_OID_A, v_Fecha);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasImpartidasEnAulas.Codigo_Asig%TYPE, v_OID_A IN AsignaturasImpartidasEnAulas.OID_A%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumAsigImpartidasEnAulas NUMBER := 0;
	BEGIN
		DELETE FROM AsignaturasImpartidasEnAulas WHERE Codigo_Asig = v_Codigo_Asig AND OID_A = v_OID_A AND Fecha = v_Fecha;
		SELECT COUNT(*) INTO v_NumAsigImpartidasEnAulas FROM AsignaturasImpartidasEnAulas WHERE Codigo_Asig = v_Codigo_Asig AND OID_A = v_OID_A AND Fecha = v_Fecha;
		IF v_NumAsigImpartidasEnAulas != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
		ROLLBACK;
	END Eliminar;
END;
/

--Tabla AsignaturasPertenecenAGrados
CREATE OR REPLACE PACKAGE BODY PCK_AsigPertenecenAGrados
IS
	CURSOR C IS
		SELECT * FROM AsignaturasPertenecenAGrados;
	v_Salida BOOLEAN := TRUE;
	v_AsigPertenecenAGrados AsignaturasPertenecenAGrados%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM AsignaturasPertenecenAGrados;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_AsigPertenecenAGrados;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Asig:', 25) || RPAD('OID_G', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_AsigPertenecenAGrados.Codigo_Asig, 25) || RPAD(v_AsigPertenecenAGrados.OID_G, 25));
		FETCH C INTO v_AsigPertenecenAGrados;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO AsignaturasPertenecenAGrados (Codigo_Asig, OID_G) VALUES (v_Codigo_Asig, v_OID_G);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Asig IN AsignaturasPertenecenAGrados.Codigo_Asig%TYPE, v_OID_G IN AsignaturasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumAsigPertenecenAGrados NUMBER := 0;
	BEGIN
		DELETE FROM AsignaturasPertenecenAGrados WHERE Codigo_Asig = v_Codigo_Asig AND OID_G = v_OID_G;
		SELECT COUNT(*) INTO v_NumAsigPertenecenAGrados FROM AsignaturasPertenecenAGrados WHERE Codigo_Asig = v_Codigo_Asig AND OID_G = v_OID_G;
		IF v_NumAsigPertenecenAGrados != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
		ROLLBACK;
	END Eliminar;
END;
/

--Tabla Aulas
CREATE OR REPLACE PACKAGE BODY PCK_Aulas
IS
	CURSOR C IS
		SELECT * FROM Aulas;
	v_Salida BOOLEAN := TRUE;
	v_Aulas Aulas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Aulas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Aulas;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_A:', 25) ||RPAD('Nombre:', 25) || RPAD('Capacidad:', 25) || RPAD('Tipo:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 100, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Aulas.OID_A, 25) || RPAD(v_Aulas.Nombre, 25) || RPAD(v_Aulas.Capacidad, 25) || RPAD(v_Aulas.Tipo, 25) );
		FETCH C INTO v_Aulas;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_A Aulas.OID_A%TYPE;
	BEGIN
		INSERT INTO Aulas (Nombre, Capacidad, Tipo) VALUES (v_Nombre, v_Capacidad, v_Tipo);
		v_OID_A := SEC_Aulas.CURRVAL;
		SELECT * INTO v_Aulas FROM Aulas WHERE OID_A = v_OID_A;
		IF v_Aulas.Nombre != v_Nombre AND v_Aulas.Capacidad != v_Capacidad AND v_Aulas.Tipo != v_Tipo THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, v_Nombre IN Aulas.Nombre%TYPE, v_Capacidad IN Aulas.Capacidad%TYPE, v_Tipo IN Aulas.Tipo%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Aulas SET Nombre = v_Nombre, Capacidad = v_Capacidad, Tipo = v_Tipo WHERE OID_A = v_OID_A;
		SELECT * INTO v_Aulas FROM Aulas WHERE OID_A = v_OID_A;
		IF v_Aulas.Nombre != v_Nombre AND v_Aulas.Capacidad != v_Capacidad AND v_Aulas.Tipo != v_Tipo THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_A IN Aulas.OID_A%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumAulas NUMBER := 0;
	BEGIN
		DELETE FROM AULAS WHERE OID_A = v_OID_A;
		SELECT COUNT(*) INTO v_NumAulas FROM Aulas WHERE OID_A = v_OID_A;
		IF v_NumAulas != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Becarios
CREATE OR REPLACE PACKAGE BODY PCK_Becarios
IS
	CURSOR C IS
		SELECT * FROM Becarios;
	v_Salida BOOLEAN := TRUE;
	v_Becarios Becarios%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Becarios;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Becarios;
		DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Codigo_Beca:', 25) || RPAD('Fecha_Comienzo:', 25) || RPAD('Fecha_Fin:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 100, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Becarios.DNI, 25) || RPAD(v_Becarios.Codigo_Beca, 25) || RPAD(v_Becarios.Fecha_Comienzo, 25) || RPAD(v_Becarios.Fecha_Fin, 25));
		FETCH C INTO v_Becarios;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO Becarios (DNI, Codigo_Beca, Fecha_Comienzo, Fecha_Fin) VALUES (v_DNI, v_Codigo_Beca, v_Fecha_Comienzo, v_Fecha_Fin);
		SELECT * INTO v_Becarios FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
		IF v_Becarios.Fecha_Comienzo != v_Fecha_Comienzo AND v_Becarios.Fecha_Fin != v_Fecha_Fin THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Becarios SET Fecha_Comienzo=v_Fecha_Comienzo, Fecha_Fin=v_Fecha_Fin WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
		SELECT * INTO v_Becarios FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
		IF v_Becarios.Fecha_Comienzo != v_Fecha_Comienzo AND v_Becarios.Fecha_Fin != v_Fecha_Fin THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Becarios.DNI%TYPE, v_Codigo_Beca IN Becarios.Codigo_Beca%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumBecarios NUMBER := 0;
	BEGIN
		DELETE FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
		SELECT COUNT(*) INTO v_NumBecarios FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_Codigo_Beca;
		IF v_NumBecarios != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Becas
CREATE OR REPLACE PACKAGE BODY PCK_Becas
IS
	CURSOR C IS
		SELECT * FROM Becas;
	v_Salida BOOLEAN := TRUE;
	v_Becas Becas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Becas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Becas;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Beca:', 25) || RPAD('Cuantia_Fija:', 25) || RPAD('Cuantia_Variable:', 25) || RPAD('Tipo:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 100, '-'));
		WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Becas.Codigo_Beca, 25) || RPAD(v_Becas.Cuantia_Fija, 25) || RPAD(v_Becas.Cuantia_Variable, 25) || RPAD(v_Becas.Tipo, 25));
		FETCH C INTO v_Becas;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO Becas (Codigo_Beca, Cuantia_Fija, Cuantia_Variable, Tipo) VALUES (v_Codigo_Beca, v_Cuantia_Fija, v_Cuantia_Variable, v_Tipo);
		SELECT * INTO v_Becas FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
		IF v_Becas.Cuantia_Fija != v_Cuantia_Fija AND v_Becas.Cuantia_Variable = v_Cuantia_Variable AND v_Becas.Tipo = v_Tipo THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, v_Cuantia_Fija IN Becas.Cuantia_Fija%TYPE, v_Cuantia_Variable IN Becas.Cuantia_Variable%TYPE, v_Tipo IN Becas.Tipo%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Becas SET Cuantia_Fija = v_Cuantia_Fija, Cuantia_Variable = v_Cuantia_Variable, Tipo = v_Tipo WHERE Codigo_Beca = v_Codigo_Beca;
		SELECT * INTO v_Becas FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
		IF v_Becas.Cuantia_Fija != v_Cuantia_Fija AND v_Becas.Cuantia_Variable = v_Cuantia_Variable AND v_Becas.Tipo = v_Tipo THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Beca IN Becas.Codigo_Beca%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumBecas NUMBER := 0;
	BEGIN
		DELETE FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
		SELECT COUNT(*) INTO v_NumBecas FROM Becas WHERE Codigo_Beca = v_Codigo_Beca;
		IF v_NumBecas  != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Departamentos
CREATE OR REPLACE PACKAGE BODY PCK_Departamentos
IS
	CURSOR C IS
		SELECT * FROM Departamentos;
	v_Salida BOOLEAN := TRUE;
	v_Departamentos Departamentos%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Departamentos;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Departamentos;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_Dep:', 25) || RPAD('Nombre:', 50));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Departamentos.OID_Dep, 25) || RPAD(v_Departamentos.Nombre, 50));
		FETCH C INTO v_Departamentos;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_Dep Departamentos.OID_Dep%TYPE;
	BEGIN
		INSERT INTO Departamentos (Nombre) VALUES (v_Nombre);
		v_OID_Dep := SEC_Departamentos.CURRVAL;
		SELECT * INTO v_Departamentos FROM Departamentos WHERE OID_Dep = v_OID_Dep;
		IF v_Departamentos.Nombre != v_Nombre THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, v_Nombre IN Departamentos.Nombre%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Departamentos SET Nombre = v_Nombre WHERE OID_Dep = v_OID_Dep;
		SELECT * INTO v_Departamentos FROM Departamentos WHERE OID_Dep = v_OID_Dep;
		IF v_Departamentos.Nombre != v_Nombre THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Dep IN Departamentos.OID_Dep%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumDepartamentos NUMBER := 0;
	BEGIN
		DELETE FROM Departamentos WHERE OID_Dep = v_OID_Dep;
		SELECT COUNT(*) INTO v_NumDepartamentos FROM Departamentos WHERE OID_Dep = v_OID_Dep;
		IF v_NumDepartamentos  != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Despachos
CREATE OR REPLACE PACKAGE BODY PCK_Despachos
IS
	CURSOR C IS
		SELECT * FROM Despachos;
	v_Salida BOOLEAN := TRUE;
	v_Despachos Despachos%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Despachos;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Despachos;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_D:', 25) || RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Despachos.OID_D, 25) || RPAD(v_Despachos.Nombre, 25) || RPAD(v_Despachos.Capacidad, 25));
		FETCH C INTO v_Despachos;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_D Despachos.OID_D%TYPE;
	BEGIN
		INSERT INTO Despachos (Nombre, Capacidad) VALUES (v_Nombre, v_Capacidad);
		v_OID_D := SEC_Despachos.CURRVAL;
		SELECT * INTO v_Despachos FROM Despachos WHERE OID_D = v_OID_D;
		IF v_Despachos.Nombre != v_Nombre AND v_Despachos.Capacidad != v_Capacidad THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, v_Nombre IN Despachos.Nombre%TYPE, v_Capacidad IN Despachos.Capacidad%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Despachos SET Nombre = v_Nombre, Capacidad = v_Capacidad WHERE OID_D = v_OID_D;
		SELECT * INTO v_Despachos FROM Despachos WHERE OID_D = v_OID_D;
		IF v_Despachos.Nombre != v_Nombre AND v_Despachos.Capacidad != v_Capacidad THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_D IN Despachos.OID_D%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumDespachos NUMBER := 0;
	BEGIN
		DELETE FROM Despachos WHERE OID_D = v_OID_D;
		SELECT COUNT(*) INTO v_NumDespachos FROM Despachos WHERE OID_D = v_OID_D;
		IF v_NumDespachos  != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Expedientes
CREATE OR REPLACE PACKAGE BODY PCK_Expedientes
IS
	CURSOR C IS
		SELECT * FROM Expedientes;
	v_Salida BOOLEAN := TRUE;
	v_Expedientes Expedientes%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Expedientes;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Expedientes;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Exp:', 25) || RPAD('DNI:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Expedientes.Codigo_Exp, 25) || RPAD(v_Expedientes.DNI, 25));
		FETCH C INTO v_Expedientes;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO Expedientes (Codigo_Exp, DNI) VALUES (v_Codigo_Exp, v_DNI);
		SELECT * INTO v_Expedientes FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
		IF v_Expedientes.DNI != v_DNI THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, v_DNI IN Expedientes.DNI%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Expedientes SET DNI = v_DNI WHERE Codigo_Exp = v_Codigo_Exp;
		SELECT * INTO v_Expedientes FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
		IF v_Expedientes.DNI != v_DNI THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Exp IN Expedientes.Codigo_Exp%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumExpedientes NUMBER := 0;
	BEGIN
		DELETE FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
		SELECT COUNT(*) INTO v_NumExpedientes FROM Expedientes WHERE Codigo_Exp = v_Codigo_Exp;
		IF v_NumExpedientes != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Grados
CREATE OR REPLACE PACKAGE BODY PCK_Grados
IS
	CURSOR C IS
		SELECT * FROM Grados;
	v_Salida BOOLEAN := TRUE;
	v_Grados Grados%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Grados;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Grados;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_G:', 25) || RPAD('Nombre:', 55));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 80, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Grados.OID_G, 25) || RPAD(v_Grados.Nombre, 55));
		FETCH C INTO v_Grados;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_G Grados.OID_G%TYPE;
	BEGIN
		INSERT INTO Grados (Nombre) VALUES (v_Nombre);
		v_OID_G := SEC_Grados.CURRVAL;
		SELECT * INTO v_Grados FROM Grados WHERE OID_G = v_OID_G;
		IF v_Grados.Nombre != v_Nombre THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, v_Nombre IN Grados.Nombre%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Grados SET Nombre = v_Nombre WHERE OID_G = v_OID_G;
		SELECT * INTO v_Grados FROM Grados WHERE OID_G = v_OID_G;
		IF v_Grados.Nombre != v_Nombre THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_G IN Grados.OID_G%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumGrados NUMBER := 0;
	BEGIN
		DELETE FROM Grados WHERE OID_G = v_OID_G;
		SELECT COUNT(*) INTO v_NumGrados FROM Grados WHERE OID_G = v_OID_G;
		IF v_NumGrados != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Grupos
CREATE OR REPLACE PACKAGE BODY PCK_Grupos
IS
	CURSOR C IS
		SELECT * FROM Grupos;
	v_Salida BOOLEAN := TRUE;
	v_Grupos Grupos%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Grupos;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Grupos;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_Grup:', 25) || RPAD('Nombre:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Grupos.OID_Grup, 25) || RPAD(v_Grupos.Nombre, 25));
		FETCH C INTO v_Grupos;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_Grup NUMBER;
	BEGIN
		INSERT INTO Grupos (Nombre) VALUES (v_Nombre);
		v_OID_Grup := SEC_Grupos.CURRVAL;
		SELECT * INTO v_Grupos FROM Grupos WHERE OID_Grup = v_OID_Grup;
		IF v_Grupos.Nombre != v_Nombre THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, v_Nombre IN Grupos.Nombre%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Grupos SET Nombre = v_Nombre WHERE OID_Grup = v_OID_Grup;
		SELECT * INTO v_Grupos FROM Grupos WHERE OID_Grup = v_OID_Grup;
		IF v_Grupos.Nombre != v_Nombre THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN Grupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumGrupos NUMBER := 0;
	BEGIN
		DELETE FROM Grupos WHERE OID_Grup = v_OID_Grup;
		SELECT COUNT(*) INTO v_NumGrupos FROM Grupos WHERE OID_Grup = v_OID_Grup;
		IF v_NumGrupos != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla GruposAsistenAClaseEnAulas
CREATE OR REPLACE PACKAGE BODY PCK_GruposAsistenAClaseEnAulas
IS
	CURSOR C IS
		SELECT * FROM GruposAsistenAClaseEnAulas;
	v_Salida BOOLEAN := TRUE;
	v_GruposAsistenAClaseEnAulas GruposAsistenAClaseEnAulas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM GruposAsistenAClaseEnAulas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_GruposAsistenAClaseEnAulas;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_Grup:', 25) || RPAD('OID_A:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_GruposAsistenAClaseEnAulas.OID_Grup, 25) || RPAD(v_GruposAsistenAClaseEnAulas.OID_A, 25) );
		FETCH C INTO v_GruposAsistenAClaseEnAulas;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO GruposAsistenAClaseEnAulas (OID_Grup, OID_A) VALUES (v_OID_Grup, v_OID_A);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_Grup IN GruposAsistenAClaseEnAulas.OID_Grup%TYPE, v_OID_A IN GruposAsistenAClaseEnAulas.OID_A%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumGrupAsistenAClaseEnAulas NUMBER := 0;
	BEGIN
		DELETE FROM GruposAsistenAClaseEnAulas WHERE OID_Grup = v_OID_Grup AND OID_A = v_OID_A;
		SELECT COUNT(*) INTO v_NumGrupAsistenAClaseEnAulas FROM GruposAsistenAClaseEnAulas WHERE OID_Grup = v_OID_Grup AND OID_A = v_OID_A;
		IF v_NumGrupAsistenAClaseEnAulas != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Matriculas
CREATE OR REPLACE PACKAGE BODY PCK_Matriculas
IS
	CURSOR C IS
		SELECT * FROM Matriculas;
	v_Salida BOOLEAN := TRUE;
	v_Matriculas Matriculas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Matriculas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Matriculas;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Matric:', 25) || RPAD('Fecha:', 25)||RPAD('Curso:', 25)||RPAD('DNI:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Matriculas.Codigo_Matric, 25) || RPAD(v_Matriculas.Fecha, 25)|| RPAD(v_Matriculas.Curso, 25)|| RPAD(v_Matriculas.DNI, 25));
		FETCH C INTO v_Matriculas;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO Matriculas (Codigo_Matric, Fecha, Curso, DNI) VALUES (v_Codigo_Matric, v_Fecha, v_Curso, v_DNI);
		SELECT * INTO v_Matriculas FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
		IF v_Matriculas.Fecha != v_Fecha AND v_Matriculas.Curso != v_Curso AND v_Matriculas.DNI != v_DNI THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, v_Fecha IN Matriculas.Fecha%TYPE, v_Curso IN Matriculas.Curso%TYPE, v_DNI IN Matriculas.DNI%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Matriculas SET Fecha = v_Fecha, Curso = v_Curso, DNI = v_DNI WHERE Codigo_Matric = v_Codigo_Matric;
		SELECT * INTO v_Matriculas FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
		IF v_Matriculas.Fecha != v_Fecha AND v_Matriculas.Curso != v_Curso AND v_Matriculas.DNI != v_DNI THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN Matriculas.Codigo_Matric%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumMatriculas NUMBER := 0;
	BEGIN
		DELETE FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
		SELECT COUNT(*) INTO v_NumMatriculas FROM Matriculas WHERE Codigo_Matric = v_Codigo_Matric;
		IF v_NumMatriculas != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla MatriculasContienenAsignaturas
CREATE OR REPLACE PACKAGE BODY PCK_MatriculasContienenAsig
IS
	CURSOR C IS
		SELECT * FROM MatriculasContienenAsignaturas;
	v_Salida BOOLEAN := TRUE;
	v_MatriculasContienenAsig MatriculasContienenAsignaturas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM MatriculasContienenAsignaturas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_MatriculasContienenAsig;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Matric:', 25) || RPAD('Codigo_Asig:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_MatriculasContienenAsig.Codigo_Matric, 25) || RPAD(v_MatriculasContienenAsig.Codigo_Asig, 25) );
		FETCH C INTO v_MatriculasContienenAsig;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO MatriculasContienenAsignaturas (Codigo_Matric, Codigo_Asig) VALUES (v_Codigo_Matric, v_Codigo_Asig);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_Codigo_Asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumMatriculasContienenAsig NUMBER := 0;
	BEGIN
		DELETE FROM MatriculasContienenAsignaturas WHERE Codigo_Matric = v_Codigo_Matric AND Codigo_Asig = v_Codigo_Asig;
		SELECT COUNT(*) INTO v_NumMatriculasContienenAsig FROM MatriculasContienenAsignaturas WHERE Codigo_Matric = v_Codigo_Matric AND Codigo_Asig = v_Codigo_Asig;
		IF v_NumMatriculasContienenAsig != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla MatriculasPertenecenAGrados
CREATE OR REPLACE PACKAGE BODY PCK_MatricPertenecenAGrados
IS
	CURSOR C IS
		SELECT * FROM MatriculasPertenecenAGrados;
	v_Salida BOOLEAN := TRUE;
	v_MatriculasContienenAsig MatriculasPertenecenAGrados%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM MatriculasPertenecenAGrados;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_MatriculasContienenAsig;
		DBMS_OUTPUT.PUT_LINE(RPAD('Codigo_Matric:', 25) || RPAD('OID_G:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_MatriculasContienenAsig.Codigo_Matric, 25) || RPAD(v_MatriculasContienenAsig.OID_G, 25) );
		FETCH C INTO v_MatriculasContienenAsig;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO MatriculasPertenecenAGrados (Codigo_Matric, OID_G) VALUES (v_Codigo_Matric, v_OID_G);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_Codigo_Matric IN MatriculasPertenecenAGrados.Codigo_Matric%TYPE, v_OID_G IN MatriculasPertenecenAGrados.OID_G%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumMatricPertenecenAGrados NUMBER := 0;
	BEGIN
		DELETE FROM MatriculasPertenecenAGrados WHERE Codigo_Matric = v_Codigo_Matric AND OID_G = v_OID_G;
		SELECT COUNT(*) INTO v_NumMatricPertenecenAGrados FROM MatriculasPertenecenAGrados WHERE Codigo_Matric = v_Codigo_Matric AND OID_G = v_OID_G;
		IF v_NumMatricPertenecenAGrados != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Notas
CREATE OR REPLACE PACKAGE BODY PCK_Notas
IS
	CURSOR C IS
		SELECT * FROM Notas;
	v_Salida BOOLEAN := TRUE;
	v_Notas Notas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Notas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Notas;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_N:', 25) || RPAD('Valor:', 25) || RPAD('Calificacion:', 25) || RPAD('Convocatoria:', 25) || RPAD('Curso:', 25) || RPAD('Fecha:', 25) || RPAD('Codigo_Exp:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 175, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Notas.OID_N, 25) || RPAD(v_Notas.Valor, 25) || RPAD(v_Notas.Calificacion, 25) || RPAD(v_Notas.Convocatoria, 25) || RPAD(v_Notas.Curso, 25) || RPAD(v_Notas.Fecha, 25) || RPAD(v_Notas.Codigo_Exp, 25));
		FETCH C INTO v_Notas;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_N Notas.OID_N%TYPE;
	BEGIN
		INSERT INTO Notas (Valor, Calificacion, Convocatoria, Curso, Fecha, Codigo_Exp) VALUES (v_Valor, v_Calificacion, v_Convocatoria, v_Curso, v_Fecha, v_Codigo_Exp);
		v_OID_N := SEC_Notas.CURRVAL;
		SELECT * INTO v_Notas FROM Notas WHERE OID_N = v_OID_N;
		IF v_Notas.Valor != v_Valor AND v_Notas.Calificacion != v_Calificacion AND v_Notas.Convocatoria != v_Convocatoria AND v_Curso != v_Curso AND v_Notas.Fecha != v_Fecha AND v_Notas.Codigo_Exp != v_Codigo_Exp THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_Codigo_Exp IN Notas.Codigo_Exp%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Notas SET Valor = v_Valor, Calificacion = v_Calificacion, Convocatoria = v_Convocatoria, Curso = v_Curso, Fecha = v_Fecha, Codigo_Exp = v_Codigo_Exp WHERE OID_N = v_OID_N;
		SELECT * INTO v_Notas FROM Notas WHERE OID_N = v_OID_N;
		IF v_Notas.Valor != v_Valor AND v_Notas.Calificacion != v_Calificacion AND v_Notas.Convocatoria != v_Convocatoria AND v_Curso != v_Curso AND v_Notas.Fecha != v_Fecha AND v_Notas.Codigo_Exp != v_Codigo_Exp THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_N IN Notas.OID_N%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumNotas NUMBER := 0;
	BEGIN
		DELETE FROM Notas WHERE OID_N = v_OID_N;
		SELECT COUNT(*) INTO v_NumNotas FROM Notas WHERE OID_N = v_OID_N;
		IF v_NumNotas != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Profesores
CREATE OR REPLACE PACKAGE BODY PCK_Profesores
IS
	CURSOR C IS
		SELECT * FROM Profesores;
	v_Salida BOOLEAN := TRUE;
	v_Profesores Profesores%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Profesores;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Profesores;
		DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha_Nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25) || RPAD('OID_D:', 25) || RPAD('OID_Dep:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25) || RPAD(v_Profesores.OID_D, 25) || RPAD(v_Profesores.OID_Dep, 25));
		FETCH C INTO v_Profesores;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO Profesores (DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria, OID_D, OID_Dep) VALUES (v_DNI, v_Nombre, v_Apellidos, v_Fecha_Nacimiento, v_Email, v_Categoria, v_OID_D, v_OID_Dep);
		SELECT * INTO v_Profesores FROM Profesores WHERE DNI = v_DNI;
		IF v_Profesores.Nombre != v_Nombre AND v_Profesores.Apellidos != v_Apellidos AND v_Profesores.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Profesores.Email != v_Email AND v_Profesores.Categoria != v_Categoria AND v_Profesores.OID_D != v_OID_D AND v_Profesores.OID_Dep != v_OID_Dep THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, v_Nombre IN Profesores.Nombre%TYPE, v_Apellidos IN Profesores.Apellidos%TYPE, v_Fecha_Nacimiento IN Profesores.Fecha_Nacimiento%TYPE, v_Email IN Profesores.Email%TYPE, v_Categoria IN Profesores.Categoria%TYPE, v_OID_D IN Profesores.OID_D%TYPE, v_OID_Dep IN Profesores.OID_Dep%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Profesores SET Nombre = v_Nombre, Apellidos = v_Apellidos, Fecha_Nacimiento = v_Fecha_Nacimiento, Email = v_Email, Categoria = v_Categoria, OID_D = v_OID_D, OID_Dep = v_OID_Dep WHERE DNI = v_DNI;
		SELECT * INTO v_Profesores FROM Profesores WHERE DNI = v_DNI;
		IF v_Profesores.Nombre != v_Nombre AND v_Profesores.Apellidos != v_Apellidos AND v_Profesores.Fecha_Nacimiento != v_Fecha_Nacimiento AND v_Profesores.Email != v_Email AND v_Profesores.Categoria != v_Categoria AND v_Profesores.OID_D != v_OID_D AND v_Profesores.OID_Dep != v_OID_Dep THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN Profesores.DNI%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumProfesores NUMBER := 0;
	BEGIN
		DELETE FROM Profesores WHERE DNI = v_DNI;
		SELECT COUNT(*) INTO v_NumProfesores FROM Profesores WHERE DNI = v_DNI;
		IF v_NumProfesores != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla ProfesoresImpartenAsignaturas
CREATE OR REPLACE PACKAGE BODY PCK_ProfesoresImpartenAsig
IS
	CURSOR C IS
		SELECT * FROM ProfesoresImpartenAsignaturas;
	v_Salida BOOLEAN := TRUE;
	v_ProfesoresAsig ProfesoresImpartenAsignaturas%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM ProfesoresImpartenAsignaturas;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_ProfesoresAsig;
		DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Codigo_Asig:', 25)|| RPAD('Dedicacion:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_ProfesoresAsig.DNI, 25) || RPAD(v_ProfesoresAsig.Codigo_Asig, 25)|| RPAD(v_ProfesoresAsig.Dedicacion, 25));
		FETCH C INTO v_ProfesoresAsig;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO ProfesoresImpartenAsignaturas (DNI, Codigo_Asig, Dedicacion) VALUES (v_DNI, v_Codigo_Asig, v_Dedicacion);
		SELECT * INTO v_ProfesoresAsig FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
		IF v_ProfesoresAsig.Dedicacion != v_Dedicacion THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE ProfesoresImpartenAsignaturas SET Dedicacion = v_Dedicacion WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
		SELECT * INTO v_ProfesoresAsig FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
		IF v_ProfesoresAsig.Dedicacion != v_Dedicacion THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenAsignaturas.DNI%TYPE, v_Codigo_Asig IN ProfesoresImpartenAsignaturas.Codigo_Asig%TYPE, salidaEsperada BOOLEAN)
    IS
        v_NumProfesoresImpartenAsig NUMBER := 0;
    BEGIN
        DELETE FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
        SELECT COUNT(*) INTO v_NumProfesoresImpartenAsig FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
        IF v_NumProfesoresImpartenAsig != 0 THEN
            v_Salida := FALSE;
        END IF;
        COMMIT;
        DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
                ROLLBACK;
    END Eliminar;
END;
/

--Tabla ProfesoresImpartenEnGrupos
CREATE OR REPLACE PACKAGE BODY PCK_ProfesoresImpartenEnGrupos
IS
	CURSOR C IS
		SELECT * FROM ProfesoresImpartenEnGrupos;
	v_Salida BOOLEAN := TRUE;
	v_ProfesoresImpartenEnGrupos ProfesoresImpartenEnGrupos%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM ProfesoresImpartenEnGrupos;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_ProfesoresImpartenEnGrupos;
		DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('OID_Grup:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 50, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_ProfesoresImpartenEnGrupos.DNI, 25) || RPAD(v_ProfesoresImpartenEnGrupos.OID_Grup, 25) );
		FETCH C INTO v_ProfesoresImpartenEnGrupos;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		INSERT INTO ProfesoresImpartenEnGrupos (DNI, OID_Grup) VALUES (v_DNI, v_OID_Grup);
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_DNI IN ProfesoresImpartenEnGrupos.DNI%TYPE, v_OID_Grup IN ProfesoresImpartenEnGrupos.OID_Grup%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumProfImpartenEnGrupos NUMBER := 0;
	BEGIN
		DELETE FROM ProfesoresImpartenEnGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
		SELECT COUNT(*) INTO v_NumProfImpartenEnGrupos FROM ProfesoresImpartenEnGrupos WHERE DNI = v_DNI AND OID_Grup = v_OID_Grup;
		IF v_NumProfImpartenEnGrupos != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/

--Tabla Tutorias
CREATE OR REPLACE PACKAGE BODY PCK_Tutorias
IS
	CURSOR C IS
		SELECT * FROM Tutorias;
	v_Salida BOOLEAN := TRUE;
	v_Tutorias Tutorias%ROWTYPE;
PROCEDURE Inicializar
	IS
	BEGIN
		DELETE FROM Tutorias;
	END Inicializar;
PROCEDURE Consultar
	IS
	BEGIN
		OPEN C;
		FETCH C INTO v_Tutorias;
		DBMS_OUTPUT.PUT_LINE(RPAD('OID_T:', 25) || RPAD('Fecha:', 25) || RPAD('Hora_Comienzo:', 25) || RPAD('Duracion:', 25) || RPAD('DNI_Alum:', 25) || RPAD('DNI_Prof:', 25));
		DBMS_OUTPUT.PUT_LINE(LPAD('-', 150, '-'));
		WHILE C%FOUND LOOP 
			DBMS_OUTPUT.PUT_LINE(RPAD(v_Tutorias.OID_T, 25) || RPAD(v_Tutorias.Fecha, 25) || RPAD(v_Tutorias.Hora_Comienzo, 25) || RPAD(v_Tutorias.Duracion, 25) || RPAD(v_Tutorias.DNI_Alum, 25) || RPAD(v_Tutorias.DNI_Prof, 25));
		FETCH C INTO v_Tutorias;
		END LOOP;
		CLOSE C;
	END Consultar;
PROCEDURE Insertar (nombrePrueba VARCHAR2, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN)
	IS
		v_OID_T Tutorias.OID_T%TYPE;
	BEGIN
		INSERT INTO Tutorias (Fecha, Hora_Comienzo, Duracion, DNI_Alum, DNI_Prof) VALUES (v_Fecha, v_Hora_Comienzo, v_Duracion, v_DNI_Alum, v_DNI_Prof);
		v_OID_T := SEC_Tutorias.CURRVAL;
		SELECT * INTO v_Tutorias FROM Tutorias WHERE OID_T = v_OID_T;
		IF v_Tutorias.Fecha != v_Fecha AND v_Tutorias.Hora_Comienzo != v_Hora_Comienzo AND v_Tutorias.Duracion != v_Duracion AND v_Tutorias.DNI_Alum != v_DNI_Alum AND v_Tutorias.DNI_Prof != v_DNI_Prof THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Insertar;
PROCEDURE Actualizar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_DNI_Alum IN Tutorias.DNI_Alum%TYPE, v_DNI_Prof IN Tutorias.DNI_Prof%TYPE, salidaEsperada BOOLEAN)
	IS
	BEGIN
		UPDATE Tutorias SET Fecha = v_Fecha, Hora_Comienzo = v_Hora_Comienzo, Duracion = v_Duracion, DNI_Alum = v_DNI_Alum, DNI_Prof = v_DNI_Prof WHERE OID_T = v_OID_T;
		SELECT * INTO v_Tutorias FROM Tutorias WHERE OID_T = v_OID_T;
		IF v_Tutorias.Fecha != v_Fecha AND v_Tutorias.Hora_Comienzo != v_Hora_Comienzo AND v_Tutorias.Duracion != v_Duracion AND v_Tutorias.DNI_Alum != v_DNI_Alum AND v_Tutorias.DNI_Prof != v_DNI_Prof THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Actualizar;
PROCEDURE Eliminar (nombrePrueba VARCHAR2, v_OID_T IN Tutorias.OID_T%TYPE, salidaEsperada BOOLEAN)
	IS
		v_NumTutorias NUMBER := 0;
	BEGIN
		DELETE FROM Tutorias WHERE OID_T = v_OID_T;
		SELECT COUNT(*) INTO v_NumTutorias FROM Tutorias WHERE OID_T = v_OID_T;
		IF v_NumTutorias != 0 THEN
			v_Salida := FALSE;
		END IF;
		COMMIT;
		DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(v_Salida, salidaEsperada));
		EXCEPTION
			WHEN OTHERS THEN
				DBMS_OUTPUT.PUT_LINE(nombrePrueba || ': ' || ASSERT_EQUALS(FALSE, salidaEsperada));
				ROLLBACK;
	END Eliminar;
END;
/