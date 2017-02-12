--Procedimientos y funciones asociadas a las reglas funcionales
--RF-001
CREATE OR REPLACE PROCEDURE PR_Matricular_Asig (v_codigo_matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_codigo_asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE)
IS
BEGIN
	INSERT INTO MatriculasContienenAsignaturas (Codigo_Matric, Codigo_Asig) VALUES (v_codigo_matric, v_codigo_asig);
	COMMIT;
END;
/

--RF-002
CREATE OR REPLACE PROCEDURE PR_Anular_Asig (v_codigo_matric IN MatriculasContienenAsignaturas.Codigo_Matric%TYPE, v_codigo_asig IN MatriculasContienenAsignaturas.Codigo_Asig%TYPE)
IS
BEGIN
	DELETE FROM MatriculasContienenAsignaturas WHERE Codigo_Matric = v_codigo_matric AND Codigo_Asig = v_codigo_asig;
	COMMIT;
END;
/

--RF-003
CREATE OR REPLACE PROCEDURE PR_Evaluar_Alum (v_codigo_asig IN AsignaturasPuntuadasConNotas.Codigo_Asig%TYPE, v_OID_N IN AsignaturasPuntuadasConNotas.OID_N%TYPE)
IS
BEGIN
	INSERT INTO AsignaturasPuntuadasConNotas (Codigo_Asig, OID_N) VALUES (v_codigo_asig, v_OID_N);
	COMMIT;
END;
/

--RF-004
CREATE OR REPLACE PROCEDURE PR_Alum_Matriculado_En_Asig (v_DNI IN Alumnos.DNI%TYPE, v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE)
IS
	v_EstaMatriculado NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_EstaMatriculado FROM MatriculasContienenAsignaturas WHERE Codigo_Asig = v_codigo_asig AND Codigo_Matric IN (SELECT Codigo_Matric FROM Matriculas WHERE DNI = v_DNI);
	IF v_EstaMatriculado = 1 THEN
		DBMS_OUTPUT.PUT_LINE('El alumno está matriculado en dicha asignatura.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('El alumno no está matriculado en dicha asignatura.');
	END IF;
END;	
/

--RF-005
CREATE OR REPLACE PROCEDURE PR_CalfMed_Agrup_Por_Asig (v_DNI IN Alumnos.DNI%TYPE)
IS 	
	CURSOR C IS
		SELECT Nombre, AVG(Valor) AS Nota_Media FROM Asignaturas NATURAL JOIN AsignaturasPuntuadasConNotas NATURAL JOIN Notas WHERE Codigo_Exp IN (SELECT Codigo_Exp FROM Expedientes WHERE DNI = v_DNI) GROUP BY Nombre;
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Asignaturas:', 100) || RPAD('Nota media:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 125, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Nota_Media, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-006
CREATE OR REPLACE PROCEDURE PR_Asig_Orden_Por_Curso (v_DNI IN Alumnos.DNI%TYPE)
IS
	CURSOR C IS
		SELECT Nombre FROM Asignaturas NATURAL JOIN MatriculasContienenAsignaturas WHERE Codigo_Matric IN (SELECT Codigo_Matric FROM Matriculas WHERE DNI = v_DNI) ORDER BY Curso;
	v_NombreAsig Asignaturas.Nombre%TYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_NombreAsig;
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(v_NombreAsig);
	FETCH C INTO v_NombreAsig;
	END LOOP;
	CLOSE C;
END;
/

--RF-007
CREATE OR REPLACE PROCEDURE PR_Expediente_Alumno (v_DNI IN Alumnos.DNI%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Valor, Calificacion, Convocatoria, Curso, Fecha FROM Notas NATURAL JOIN Expedientes NATURAL JOIN AsignaturasPuntuadasConNotas NATURAL JOIN Asignaturas WHERE Codigo_Exp IN (SELECT Codigo_Exp FROM Expedientes WHERE DNI = v_DNI);
	v_Notas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Notas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Asignaturas:', 25) || RPAD('Nota:', 25) || RPAD('Calificación:', 25) || RPAD('Convocatoria:', 25) || RPAD('Curso:', 25) || RPAD('Fecha:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 135, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Notas.Nombre, 25) || RPAD(v_Notas.Valor, 25) || RPAD(v_Notas.Calificacion, 25) || RPAD(v_Notas.Convocatoria, 25) || RPAD(v_Notas.Curso, 25) || RPAD(v_Notas.Fecha, 25));
	FETCH C INTO v_Notas;
	END LOOP;
	CLOSE C;
END;
/

--RF-008
CREATE OR REPLACE PROCEDURE PR_Asociar_Asignatura_Dep (v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE, v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
	v_OID_Dep Asignaturas.OID_Dep%TYPE;
BEGIN
	SELECT OID_Dep INTO v_OID_Dep FROM Departamentos WHERE Nombre = v_NombreDepartamento;
	UPDATE Asignaturas SET OID_Dep = v_OID_Dep WHERE Codigo_Asig = v_codigo_asig;
	COMMIT;
END;
/

--RF-009
CREATE OR REPLACE PROCEDURE PR_Asociar_Beca (v_codigo_beca IN Becarios.Codigo_Beca%TYPE, v_DNI IN Becarios.DNI%TYPE, v_Fecha_Comienzo IN Becarios.Fecha_Comienzo%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE)
IS
BEGIN
	INSERT INTO Becarios (DNI, Codigo_Beca, Fecha_Comienzo, Fecha_Fin) VALUES (v_DNI, v_Codigo_Beca, v_Fecha_Comienzo, v_Fecha_Fin);
	COMMIT;
END;
/

--RF-010
CREATE OR REPLACE PROCEDURE PR_Asociar_Duracion_Beca (v_codigo_beca IN Becas.Codigo_Beca%TYPE, v_DNI IN Becarios.DNI%TYPE, v_Fecha_Fin IN Becarios.Fecha_Fin%TYPE)
IS
	v_Existe NUMBER;
	v_FechaComienzo DATE := SYSDATE;
BEGIN
	SELECT COUNT(*) INTO v_Existe FROM Becarios WHERE DNI = v_DNI AND Codigo_Beca = v_codigo_beca;
	IF v_Existe = 1 THEN
		UPDATE Becarios SET Fecha_Fin = v_Fecha_Fin WHERE DNI = v_DNI AND Codigo_Beca = v_codigo_beca; 
	ELSE
		INSERT INTO Becarios (DNI, Codigo_Beca, Fecha_Comienzo, Fecha_Fin) VALUES (v_DNI, v_Codigo_Beca, v_FechaComienzo, v_Fecha_Fin);
	END IF;
	COMMIT;
END;
/

--RF-011
CREATE OR REPLACE PROCEDURE PR_Asociar_Cuantia_Fija_Beca (v_codigo_beca IN Becas.Codigo_Beca%TYPE, v_cuantia_fija IN Becas.Cuantia_Fija%TYPE)
IS
BEGIN
	UPDATE Becas SET Cuantia_Fija = v_cuantia_fija WHERE Codigo_Beca = v_codigo_beca;
	COMMIT;
END;
/

--RF-012
CREATE OR REPLACE PROCEDURE PR_Asociar_Cuantia_Var_Beca (v_codigo_beca IN Becas.Codigo_Beca%TYPE, v_cuantia_variable IN Becas.Cuantia_Variable%TYPE)
IS
BEGIN
	UPDATE Becas SET Cuantia_Variable = v_cuantia_variable WHERE Codigo_Beca = v_codigo_beca;
	COMMIT;
END;
/

--RF-013
CREATE OR REPLACE PROCEDURE PR_Becas_Alumno (v_DNI IN Becarios.DNI%TYPE)
IS
	CURSOR C IS
		SELECT Codigo_Beca, Cuantia_Fija, Cuantia_Variable,	Tipo, Fecha_Comienzo, Fecha_Fin FROM Becas NATURAL JOIN BECARIOS WHERE DNI = v_DNI;
	v_Becas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Becas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Código de la beca:', 25) || RPAD('Cuantía fija:', 25) || RPAD('Cuantía variable:', 25) || RPAD('Tipo:', 25) || RPAD('Fecha de comienzo:', 25) || RPAD('Fecha de fin:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Becas.Codigo_Beca, 25) || RPAD(v_Becas.Cuantia_Fija, 25) || RPAD(v_Becas.Cuantia_Variable, 25) || RPAD(v_Becas.Tipo, 25) || RPAD(v_Becas.Fecha_Comienzo, 25) || RPAD(v_Becas.Fecha_Fin, 25));
	FETCH C INTO v_Becas;
	END LOOP;
	CLOSE C;
END;
/

--RF-014
CREATE OR REPLACE PROCEDURE PR_Alumnos_Matriculados
IS
	CURSOR C IS
		SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email FROM Alumnos;
	v_Alumnos C%ROWTYPE;
	v_TotalAlumnos NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_TotalAlumnos FROM Alumnos;
	DBMS_OUTPUT.PUT_LINE(v_TotalAlumnos || ' alumnos matriculados en la universidad.' || CHR(13) || CHR(13));
	OPEN C;
	FETCH C INTO v_Alumnos;
	DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Alumnos.DNI, 25) || RPAD(v_Alumnos.Nombre, 25) || RPAD(v_Alumnos.Apellidos, 25) || RPAD(v_Alumnos.Fecha_Nacimiento, 25) || RPAD(v_Alumnos.Email, 25));
	FETCH C INTO v_Alumnos;
	END LOOP;
	CLOSE C;
END;
/

--RF-015
CREATE OR REPLACE PROCEDURE PR_Profesores_Impartiendo
IS
	CURSOR C IS
		SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores;
	v_Profesores C%ROWTYPE;
	v_TotalProfesores NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_TotalProfesores FROM Profesores;
	DBMS_OUTPUT.PUT_LINE(v_TotalProfesores || ' profesores impartiendo en la universidad.' || CHR(13) || CHR(13));
	OPEN C;
	FETCH C INTO v_Profesores;
	DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
	FETCH C INTO v_Profesores;
	END LOOP;
	CLOSE C;
END;
/

--RF-016
CREATE OR REPLACE PROCEDURE PR_Espacios_AgrupPor_Tipo
IS
	CURSOR C1 IS
		SELECT Nombre, Capacidad FROM Aulas WHERE Tipo = 'Teoría';
	CURSOR C2 IS
		SELECT Nombre, Capacidad FROM Aulas WHERE Tipo = 'Laboratorio';
	CURSOR C3 IS
		SELECT Nombre, Capacidad FROM Aulas WHERE Tipo = 'Examen';
	CURSOR C4 IS
		SELECT Nombre, Capacidad FROM Despachos;
	v_EspaciosT C1%ROWTYPE;
	v_EspaciosL C2%ROWTYPE;
	v_EspaciosE C3%ROWTYPE;
	v_EspaciosD C4%ROWTYPE;
BEGIN
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-'));
	DBMS_OUTPUT.PUT_LINE('|Aulas de teoría|');
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-') || CHR(13) || CHR(13));
	OPEN C1;
	FETCH C1 INTO v_EspaciosT;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
	WHILE C1%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosT.Nombre, 25) || RPAD(v_EspaciosT.Capacidad, 25));
	FETCH C1 INTO v_EspaciosT;
	END LOOP;
	CLOSE C1;
	DBMS_OUTPUT.PUT_LINE(CHR(13) || CHR(13));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 22, '-'));
	DBMS_OUTPUT.PUT_LINE('|Aulas de laboratorio|');
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 22, '-') || CHR(13) || CHR(13));
	OPEN C2;
	FETCH C2 INTO v_EspaciosL;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
	WHILE C2%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosL.Nombre, 25) || RPAD(v_EspaciosL.Capacidad, 25));
	FETCH C2 INTO v_EspaciosL;
	END LOOP;
	CLOSE C2;
	DBMS_OUTPUT.PUT_LINE(CHR(13) || CHR(13));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-'));
	DBMS_OUTPUT.PUT_LINE('|Aulas de examen|');
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 17, '-') || CHR(13) || CHR(13));
	OPEN C3;
	FETCH C3 INTO v_EspaciosE;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
	WHILE C3%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosE.Nombre, 25) || RPAD(v_EspaciosE.Capacidad, 25));
	FETCH C3 INTO v_EspaciosE;
	END LOOP;
	CLOSE C3;
	DBMS_OUTPUT.PUT_LINE(CHR(13) || CHR(13));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 11, '-'));
	DBMS_OUTPUT.PUT_LINE('|Despachos|');
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 11, '-') || CHR(13) || CHR(13));
	OPEN C4;
	FETCH C4 INTO v_EspaciosD;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 25) || RPAD('Capacidad:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 40, '-'));
	WHILE C4%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_EspaciosD.Nombre, 25) || RPAD(v_EspaciosD.Capacidad, 25));
	FETCH C4 INTO v_EspaciosD;
	END LOOP;
	CLOSE C4;
END;
/

--RF-017
CREATE OR REPLACE PROCEDURE PR_Profesores_Departamento (v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores WHERE OID_Dep IN (SELECT OID_DEP FROM Departamentos WHERE Nombre = v_NombreDepartamento);
	v_Profesores C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Profesores;
	DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
	FETCH C INTO v_Profesores;
	END LOOP;
	CLOSE C;
END;
/

--RF-018
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Departamento (v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT Codigo_Asig, Nombre, Acronimo, Creditos, Periodo, Curso, Tipo FROM Asignaturas WHERE OID_Dep IN (SELECT OID_DEP FROM Departamentos WHERE Nombre = v_NombreDepartamento);
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Código:', 25) || RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 240, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Codigo_Asig, 25) || RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-019
CREATE OR REPLACE FUNCTION FN_Grupo_Mas_Alumnos
RETURN VARCHAR2
IS
	v_nombreGrupo Grupos.Nombre%TYPE;
BEGIN
	SELECT Nombre INTO v_nombreGrupo FROM Grupos WHERE OID_Grup IN (SELECT OID_Grup FROM AlumnosPertenecenAGrupos GROUP BY OID_Grup HAVING COUNT(DNI) = (SELECT MAX(COUNT(DNI)) FROM AlumnosPertenecenAGrupos GROUP BY OID_Grup));
	RETURN (v_nombreGrupo);
END;
/

--RF-020
CREATE OR REPLACE PROCEDURE PR_Eliminar_Asignatura_Dep (v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE)
IS
BEGIN
	UPDATE Asignaturas SET OID_Dep = NULL WHERE Codigo_Asig = v_codigo_asig;
	COMMIT;
END;
/

--RF-021
CREATE OR REPLACE PROCEDURE PR_Asociar_Profesor_Dep (v_DNI IN Profesores.DNI%TYPE, v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
	v_OID_Dep Profesores.OID_Dep%TYPE;
BEGIN
	SELECT OID_Dep INTO v_OID_Dep FROM Departamentos WHERE Nombre = v_NombreDepartamento;
	UPDATE Profesores SET OID_Dep = v_OID_Dep WHERE DNI = v_DNI;
	COMMIT;
END;
/

--RF-022
CREATE OR REPLACE PROCEDURE PR_Eliminar_Profesor_Dep (v_DNI IN Profesores.DNI%TYPE)
IS
BEGIN
	UPDATE Profesores SET OID_Dep = NULL WHERE DNI = v_DNI;
	COMMIT;
END;
/

--RF-023
CREATE OR REPLACE PROCEDURE PR_Prof_Imparte_Asig (v_codigo_asig IN Asignaturas.Codigo_Asig%TYPE)
IS
	v_ImparteProfesor NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_ImparteProfesor FROM ProfesoresImpartenAsignaturas WHERE Codigo_Asig = v_codigo_asig;
	IF v_ImparteProfesor >= 1 THEN
		DBMS_OUTPUT.PUT_LINE('La asignatura es impartida al menos por un profesor.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('La asignatura no es impartida por ningún profesor.');
	END IF;
END;	
/

--RF-024
CREATE OR REPLACE PROCEDURE PR_Prof_Imparte_Asigs_Dep (v_NombreDepartamento IN Departamentos.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT Codigo_Asig FROM Asignaturas WHERE OID_Dep IN (SELECT OID_Dep FROM Departamentos WHERE Nombre = v_NombreDepartamento);
	v_Asignaturas C%ROWTYPE;
	v_ImparteProfesor NUMBER;
	v_TodasAsignadas BOOLEAN := TRUE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	WHILE C%FOUND LOOP 
		SELECT COUNT(*) INTO v_ImparteProfesor FROM ProfesoresImpartenAsignaturas WHERE Codigo_Asig = v_Asignaturas.Codigo_Asig;
		IF v_ImparteProfesor = 0 THEN
			v_TodasAsignadas := FALSE;
		END IF;
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
	IF v_TodasAsignadas = TRUE THEN
		DBMS_OUTPUT.PUT_LINE('Todas las asignaturas del departamento tienen al menos un profesor asignado.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('No todas las asignaturas del departamento tienen al menos un profesor asignado.');
	END IF;
END;	
/

--RF-025
CREATE OR REPLACE PROCEDURE PR_NumProf_AgrupadosPor_Asig
IS
	CURSOR C IS
		SELECT Nombre, COUNT(DNI) AS NumProfesores FROM ProfesoresImpartenAsignaturas NATURAL JOIN Asignaturas GROUP BY Nombre;
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Asignatura:', 100) || RPAD('Número de profesores:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 120, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.NumProfesores, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;	
/

--RF-026
CREATE OR REPLACE PROCEDURE PR_NumTut_AgrupadosPor_Prof
IS
	CURSOR C IS
		SELECT DNI_Prof, COUNT(OID_T) AS NumTutorias FROM Tutorias GROUP BY DNI_Prof;
	v_Profesores C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Profesores;
	DBMS_OUTPUT.PUT_LINE(RPAD('DNI del profesor:', 25) || RPAD('Número de tutorias:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 47, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI_Prof, 25) || RPAD(v_Profesores.NumTutorias, 25));
	FETCH C INTO v_Profesores;
	END LOOP;
	CLOSE C;
END;	
/

--RF-027
CREATE OR REPLACE PROCEDURE PR_Profesores_Despacho (v_NombreDespacho IN Despachos.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores WHERE OID_D IN (SELECT OID_D FROM Despachos WHERE Nombre = v_NombreDespacho);
	v_Profesores C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Profesores;
	DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
	FETCH C INTO v_Profesores;
	END LOOP;
	CLOSE C;
END;
/

--RF-028
CREATE OR REPLACE PROCEDURE PR_Notas_Expediente (v_codigo_exp IN Expedientes.Codigo_exp%TYPE)
IS
	CURSOR C IS
		SELECT Valor, Calificacion, Convocatoria, Curso, Fecha FROM Notas WHERE Codigo_exp = v_codigo_exp;
	v_Notas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Notas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Valor:', 25) || RPAD('Calificación:', 25) || RPAD('Convocatoria:', 25) || RPAD('Curso:', 25) || RPAD('Fecha:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Notas.Valor, 25) || RPAD(v_Notas.Calificacion, 25) || RPAD(v_Notas.Convocatoria, 25) || RPAD(v_Notas.Curso, 25) || RPAD(v_Notas.Fecha, 25));
	FETCH C INTO v_Notas;
	END LOOP;
	CLOSE C;
END;
/

--RF-029
CREATE OR REPLACE FUNCTION FN_NotaMedia_Expediente (v_codigo_exp IN Expedientes.Codigo_exp%TYPE)
RETURN NUMBER
IS
	v_notaMedia Notas.Valor%TYPE;
BEGIN
	SELECT AVG(Valor) INTO v_notaMedia FROM Notas WHERE Codigo_exp = v_codigo_exp;
	RETURN (v_notaMedia);
END;
/

--RF-030
CREATE OR REPLACE PROCEDURE PR_Evaluar_Examen (v_Valor IN Notas.Valor%TYPE, v_Calificacion IN Notas.Calificacion%TYPE, v_Convocatoria IN Notas.Convocatoria%TYPE, v_Curso IN Notas.Curso%TYPE, v_Fecha IN Notas.Fecha%TYPE, v_codigo_exp IN Notas.Codigo_exp%TYPE)
IS
BEGIN
	INSERT INTO Notas (Valor, Calificacion, Convocatoria, Curso, Fecha, Codigo_Exp) VALUES (v_Valor, v_Calificacion, v_Convocatoria, v_Curso, v_Fecha, v_codigo_exp);
	COMMIT;
END;
/

--RF-031
CREATE OR REPLACE FUNCTION FN_MejorNota_Expediente (v_codigo_exp IN Expedientes.Codigo_exp%TYPE)
RETURN NUMBER
IS
	v_mejorNota Notas.Valor%TYPE;
BEGIN
	SELECT MAX(Valor) INTO v_mejorNota FROM Notas WHERE Codigo_exp = v_codigo_exp;
	RETURN (v_mejorNota);
END;
/

--RF-032
CREATE OR REPLACE PROCEDURE PR_AsignaturasOblig_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Acronimo, Creditos, Periodo, Curso, Tipo FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Obligatorio' OR Tipo = 'Troncal';
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 215, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-033
CREATE OR REPLACE PROCEDURE PR_AsignaturasOpt_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Acronimo, Creditos, Periodo, Curso, Tipo FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Optativo';
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 215, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-034
CREATE OR REPLACE FUNCTION FN_CreditosOptativos_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
	v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
	SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Optativo';
	RETURN (v_numCreditos);
END;
/

--RF-035
CREATE OR REPLACE FUNCTION FN_CreditosObligatorios_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
	v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
	SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Obligatorio';
	RETURN (v_numCreditos);
END;
/

--RF-036
CREATE OR REPLACE FUNCTION FN_CreditosTroncales_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
	v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
	SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Tipo = 'Troncal';
	RETURN (v_numCreditos);
END;
/

--RF-037
CREATE OR REPLACE FUNCTION FN_CreditosTotales_Grado (v_Grado IN Grados.Nombre%TYPE)
RETURN NUMBER
IS
	v_numCreditos Asignaturas.Creditos%TYPE;
BEGIN
	SELECT SUM(Creditos) INTO v_numCreditos FROM Asignaturas WHERE Codigo_Asig IN (Select Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado));
	RETURN (v_numCreditos);
END;
/

--RF-038
CREATE OR REPLACE PROCEDURE PR_Departamentos_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT Nombre FROM Departamentos WHERE OID_Dep IN (SELECT OID_Dep FROM Asignaturas NATURAL JOIN AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado));
	v_Departamentos C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Departamentos;
	DBMS_OUTPUT.PUT_LINE(RPAD('Departamento:', 75));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 75, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Departamentos.Nombre, 75));
	FETCH C INTO v_Departamentos;
	END LOOP;
	CLOSE C;
END;
/

--RF-039
CREATE OR REPLACE PROCEDURE PR_Profesores_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT DISTINCT DNI, Nombre, Apellidos, Fecha_Nacimiento, Email, Categoria FROM Profesores NATURAL JOIN ProfesoresImpartenAsignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM Asignaturas NATURAL JOIN AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado));
	v_Profesores C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Profesores;
	DBMS_OUTPUT.PUT_LINE(RPAD('DNI:', 25) || RPAD('Nombre:', 25) || RPAD('Apellidos:', 25) || RPAD('Fecha de nacimiento:', 25) || RPAD('Email:', 25) || RPAD('Categoria:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 140, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Profesores.DNI, 25) || RPAD(v_Profesores.Nombre, 25) || RPAD(v_Profesores.Apellidos, 25) || RPAD(v_Profesores.Fecha_Nacimiento, 25) || RPAD(v_Profesores.Email, 25) || RPAD(v_Profesores.Categoria, 25));
	FETCH C INTO v_Profesores;
	END LOOP;
	CLOSE C;
END;
/

--RF-040
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Grado_Curso (v_Grado IN Grados.Nombre%TYPE, v_Curso IN Asignaturas.Curso%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Acronimo, Creditos, Periodo, Tipo FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Curso = v_Curso;
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Tipo:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Tipo, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-041
CREATE OR REPLACE PROCEDURE PR_AsignaturasAnuales_Grado (v_Grado IN Grados.Nombre%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Acronimo, Creditos, Curso, Tipo FROM Asignaturas WHERE Codigo_Asig IN (SELECT Codigo_Asig FROM AsignaturasPertenecenAGrados WHERE OID_G IN (SELECT OID_G FROM Grados WHERE Nombre = v_Grado)) AND Periodo = 'Anual';
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Curso:', 25) || RPAD('Tipo:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Curso, 25) || RPAD(v_Asignaturas.Tipo, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-042
CREATE OR REPLACE PROCEDURE PR_Tutorias_Profesor (v_DNI IN Profesores.DNI%TYPE)
IS
	CURSOR C IS
		SELECT Fecha, Hora_comienzo, Duracion, DNI_Alum FROM Tutorias WHERE DNI_Prof = v_DNI;
	v_Tutorias C%ROWTYPE;
    
BEGIN
	OPEN C;
	FETCH C INTO v_Tutorias;
    DBMS_OUTPUT.PUT_LINE(RPAD('Fecha', 25) || RPAD('Hora de comienzo', 25) || RPAD('Duración', 25) || RPAD('DNI del Alumno que atiende', 27));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 105, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Tutorias.Fecha, 25) || RPAD(v_Tutorias.Hora_comienzo, 25) || RPAD(v_Tutorias.Duracion, 25) || RPAD(v_Tutorias.Dni_Alum, 27));
	FETCH C INTO v_Tutorias;
	END LOOP;
	CLOSE C;
END;
/

--RF-043
CREATE OR REPLACE FUNCTION FN_Departamento_Profesor (v_DNI IN Profesores.DNI%TYPE)
RETURN VARCHAR2
IS
	v_Departamento Departamentos.Nombre%TYPE;
BEGIN
	SELECT Nombre INTO v_Departamento FROM Departamentos WHERE OID_DEP IN (SELECT OID_DEP FROM Profesores WHERE DNI = v_DNI);
	RETURN (v_Departamento);
END;
/

--RF-044
CREATE OR REPLACE FUNCTION FN_DedicacionTotal_Profesor (v_DNI IN Profesores.DNI%TYPE)
RETURN NUMBER
IS
	v_DedicacionTotal ProfesoresImpartenAsignaturas.Dedicacion%TYPE;
BEGIN
	SELECT SUM(Dedicacion) INTO v_DedicacionTotal FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI;
	RETURN (v_DedicacionTotal);
END;
/

--RF-045
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Profesor (v_DNI IN Profesores.DNI%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Acronimo, Creditos, Periodo, Tipo FROM Asignaturas NATURAL JOIN ProfesoresImpartenAsignaturas WHERE DNI = v_DNI;
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Tipo:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 200, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Tipo, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-046
CREATE OR REPLACE PROCEDURE PR_Dedicacion_Profesor (v_DNI IN Profesores.DNI%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Dedicacion FROM ProfesoresImpartenAsignaturas NATURAL JOIN Asignaturas WHERE DNI = v_DNI;
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Dedicación:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 110, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Dedicacion, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/

--RF-047
CREATE OR REPLACE PROCEDURE PR_Categoria_Profesor (v_DNI IN Profesores.DNI%TYPE, v_Categoria IN Profesores.Categoria%TYPE)
IS
BEGIN
	UPDATE Profesores SET Categoria = v_Categoria WHERE DNI = v_DNI;
	COMMIT;
END;
/

--RF-048
CREATE OR REPLACE PROCEDURE PR_Adicion_Tutoria (v_Fecha IN Tutorias.Fecha%TYPE, v_Hora_Comienzo IN Tutorias.Hora_Comienzo%TYPE, v_Duracion IN Tutorias.Duracion%TYPE, v_DNI_Prof IN Profesores.DNI%TYPE, v_DNI_Alum IN Alumnos.DNI%TYPE)
IS
BEGIN
	INSERT INTO Tutorias (Fecha, Hora_Comienzo, Duracion, DNI_Alum, DNI_Prof) VALUES (v_Fecha, v_Hora_Comienzo, v_Duracion, v_DNI_Prof, v_DNI_Alum);
	COMMIT;
END;
/

--RF-049
CREATE OR REPLACE PROCEDURE PR_Eliminar_Tutoria (v_OID_T IN Tutorias.OID_T%TYPE)
IS
BEGIN
	DELETE FROM Tutorias WHERE OID_T = v_OID_T;
	COMMIT;
END;
/

--RF-050
CREATE OR REPLACE PROCEDURE PR_Asignar_Profesor_Asignatura (v_DNI IN Profesores.DNI%TYPE, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE, v_Dedicacion IN ProfesoresImpartenAsignaturas.Dedicacion%TYPE)
IS
BEGIN
	INSERT INTO ProfesoresImpartenAsignaturas (DNI, Codigo_Asig, Dedicacion) VALUES (v_DNI, v_Codigo_Asig, v_Dedicacion);
	COMMIT;
END;
/

--RF-051
CREATE OR REPLACE PROCEDURE PR_Eliminar_Profesor_Asig (v_DNI IN Profesores.DNI%TYPE, v_Codigo_Asig IN Asignaturas.Codigo_Asig%TYPE)
IS
BEGIN
	DELETE FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI AND Codigo_Asig = v_Codigo_Asig;
	COMMIT;
END;
/

--RF-052
CREATE OR REPLACE PROCEDURE PR_Asignaturas_Aula (v_Aula IN Aulas.Nombre%TYPE, v_Fecha IN AsignaturasImpartidasEnAulas.Fecha%TYPE)
IS
	CURSOR C IS
		SELECT Nombre, Acronimo, Creditos, Periodo, Tipo FROM Asignaturas NATURAL JOIN AsignaturasImpartidasEnAulas	WHERE OID_A IN (SELECT OID_A FROM Aulas WHERE Nombre = v_Aula) AND TRUNC(Fecha) = v_Fecha;
	v_Asignaturas C%ROWTYPE;
BEGIN
	OPEN C;
	FETCH C INTO v_Asignaturas;
	DBMS_OUTPUT.PUT_LINE(RPAD('Nombre:', 100) || RPAD('Acrónimo:', 25) || RPAD('Créditos:', 25) || RPAD('Periodo:', 25) || RPAD('Tipo:', 25));
	DBMS_OUTPUT.PUT_LINE(LPAD('-', 195, '-'));
	WHILE C%FOUND LOOP 
		DBMS_OUTPUT.PUT_LINE(RPAD(v_Asignaturas.Nombre, 100) || RPAD(v_Asignaturas.Acronimo, 25) || RPAD(v_Asignaturas.Creditos, 25) || RPAD(v_Asignaturas.Periodo, 25) || RPAD(v_Asignaturas.Tipo, 25));
	FETCH C INTO v_Asignaturas;
	END LOOP;
	CLOSE C;
END;
/