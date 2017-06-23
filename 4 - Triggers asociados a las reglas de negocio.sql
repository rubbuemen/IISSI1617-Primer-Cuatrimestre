--Triggers asociados a las reglas de negocio
--RN-001
CREATE OR REPLACE TRIGGER TR_Email_Alum
AFTER INSERT OR UPDATE OF Email ON Alumnos
FOR EACH ROW
DECLARE
	v_Email VARCHAR2(40) := :NEW.Email;
BEGIN
	IF v_Email NOT LIKE '%@alum.es' THEN
		RAISE_APPLICATION_ERROR(-20001, 'Un alumno matriculado debe tener un email acabado en @alum.es.');
	END IF;
END;
/

--RN-002
CREATE OR REPLACE TRIGGER TR_Creditos_Asig
AFTER INSERT OR UPDATE OF Creditos ON Asignaturas
FOR EACH ROW
DECLARE
	v_Creditos NUMBER := :NEW.Creditos;
BEGIN
	IF v_Creditos <= 0 THEN
		RAISE_APPLICATION_ERROR(-20002, 'Los créditos de una asignatura deben ser un número positivo distinto de 0.');
	END IF;
END;
/

--RN-003
CREATE OR REPLACE TRIGGER TR_Duracion_Beca
AFTER INSERT OR UPDATE OF Fecha_Comienzo, Fecha_Fin ON Becarios
FOR EACH ROW
DECLARE
	v_Fecha_Comienzo DATE := :NEW.Fecha_Comienzo;
	v_Fecha_Fin DATE := :NEW.Fecha_Fin;
	v_Duracion NUMBER;
BEGIN
	SELECT MONTHS_BETWEEN(TO_DATE(v_Fecha_Fin, 'DD/MM/YYYY'), TO_DATE(v_Fecha_Comienzo, 'DD/MM/YYYY')) INTO v_Duracion FROM DUAL;
	IF v_Duracion < 1 THEN
		RAISE_APPLICATION_ERROR(-20003, 'La duración de una beca debe ser como mínimo de 1 mes.');
	END IF;
END;
/

--RN-004
CREATE OR REPLACE TRIGGER TR_Minimo_Cuantia_Fija
AFTER INSERT OR UPDATE OF Cuantia_Fija ON Becas
FOR EACH ROW
DECLARE
	v_Cuantia_Fija NUMBER := :NEW.Cuantia_Fija;
BEGIN
	IF v_Cuantia_Fija < 1500 THEN
		RAISE_APPLICATION_ERROR(-20004, 'La cuantía total fija de una beca debe ser de al menos 1500€.');
	END IF;
END;
/

--RN-005
CREATE OR REPLACE TRIGGER TR_Capacidad_Despachos
AFTER INSERT OR UPDATE OF Capacidad ON Despachos
FOR EACH ROW
DECLARE
	v_Capacidad NUMBER := :NEW.Capacidad;
BEGIN
	IF v_Capacidad > 3 THEN
		RAISE_APPLICATION_ERROR(-20005, 'La capacidad máxima de profesores en un despacho debe ser 3.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_Capacidad_Despachos_Prof
AFTER INSERT OR UPDATE OF OID_D ON Profesores
FOR EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
	v_OID_D_Nuevo NUMBER := :NEW.OID_D;
	v_OID_D_Antiguo NUMBER := :OLD.OID_D;
	v_NumProfesores NUMBER;
	v_Capacidad NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_NumProfesores FROM Profesores WHERE OID_D = v_OID_D_Nuevo;
	SELECT Capacidad INTO v_Capacidad FROM Despachos WHERE OID_D = v_OID_D_Nuevo;
	IF UPDATING ('OID_D') AND v_OID_D_Antiguo = v_OID_D_Nuevo THEN
		v_NumProfesores := v_NumProfesores;
	ELSE
		v_NumProfesores := v_NumProfesores + 1;
	END IF;
	IF v_NumProfesores > v_Capacidad THEN
		RAISE_APPLICATION_ERROR(-20006, 'La capacidad máxima de profesores de este despacho es de ' || v_Capacidad);
	END IF;
END;
/


--RN-006
CREATE OR REPLACE TRIGGER TR_Capacidad_Aulas
AFTER INSERT OR UPDATE OF Capacidad ON Aulas
FOR EACH ROW
DECLARE
	v_Capacidad NUMBER := :NEW.Capacidad;
	v_Tipo VARCHAR2(20) := :NEW.TIPO;
BEGIN
	IF v_Tipo LIKE 'Teoría' AND v_Capacidad > 70 THEN
		RAISE_APPLICATION_ERROR(-20007, 'La capacidad máxima de alumnos en un aula de tipo teoría debe ser 70.');
	END IF;
	IF v_Tipo LIKE 'Laboratorio' AND v_Capacidad > 30 THEN
		RAISE_APPLICATION_ERROR(-20008, 'La capacidad máxima de alumnos en un aula de tipo laboratorio debe ser 30.');
	END IF;
	IF v_Tipo LIKE 'Examen' AND v_Capacidad > 200 THEN
		RAISE_APPLICATION_ERROR(-20009, 'La capacidad máxima de alumnos en un aula de tipo examen debe ser 200.');
	END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_Capacidad_Aulas_Alum
BEFORE INSERT ON GruposAsistenAClaseEnAulas
FOR EACH ROW
DECLARE
	v_OID_Grup NUMBER := :NEW.OID_Grup;
	v_OID_A NUMBER := :NEW.OID_A;
	v_NumAlumnos NUMBER;
	v_Capacidad NUMBER;
BEGIN
	SELECT COUNT(*) INTO v_NumAlumnos FROM AlumnosPertenecenAGrupos WHERE OID_Grup = v_OID_Grup;
	SELECT Capacidad INTO v_Capacidad FROM Aulas WHERE OID_A = v_OID_A;
	IF v_NumAlumnos > v_Capacidad THEN
		RAISE_APPLICATION_ERROR(-20010, 'La capacidad máxima de alumnos de este aula es de ' || v_Capacidad);
	END IF;
END;
/

--RN-007
CREATE OR REPLACE TRIGGER TR_Calificacion_Expediente
BEFORE INSERT ON AsignaturasPuntuadasConNotas
FOR EACH ROW 
DECLARE
	CURSOR C IS
		SELECT Codigo_Asig, OID_N FROM AsignaturasPuntuadasConNotas;
	v_CodAsignaturaNueva NUMBER := :NEW.Codigo_Asig;
	v_NotaNueva NUMBER := :NEW.OID_N;
	v_Convocatoria VARCHAR(20);
	v_Curso NUMBER;
	v_Expediente NUMBER;
	v_ConvocatoriaAux VARCHAR(20);
	v_CursoAux NUMBER;
	v_ExpedienteAux NUMBER;
BEGIN
	SELECT Convocatoria INTO v_Convocatoria FROM Notas WHERE OID_N = v_NotaNueva;	
	SELECT Curso INTO v_Curso FROM Notas WHERE OID_N = v_NotaNueva;
	SELECT Codigo_Exp INTO v_Expediente FROM Notas WHERE OID_N = v_NotaNueva;
	FOR Evaluacion IN C LOOP
		IF Evaluacion.Codigo_Asig = v_CodAsignaturaNueva THEN
			SELECT Convocatoria INTO v_ConvocatoriaAux FROM Notas WHERE OID_N = Evaluacion.OID_N;	
			SELECT Curso INTO v_CursoAux FROM Notas WHERE OID_N = Evaluacion.OID_N;
			SELECT Codigo_Exp INTO v_ExpedienteAux FROM Notas WHERE OID_N = Evaluacion.OID_N;
			IF v_Convocatoria = v_ConvocatoriaAux AND v_Curso = v_CursoAux AND v_Expediente = v_ExpedienteAux THEN
				RAISE_APPLICATION_ERROR(-20011, 'El expediente de un alumno no puede contener calificaciones para más de 1 convocatoria de una misma asignatura y curso.');
			END IF;
		END IF;
	END LOOP;
END;
/

--RN-008
CREATE OR REPLACE TRIGGER TR_AsigOpt_MismoNum_Creditos
AFTER INSERT OR UPDATE OF Creditos, Tipo ON Asignaturas
FOR EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
	CURSOR C IS
		SELECT Creditos FROM Asignaturas WHERE Tipo = 'Optativo';
	v_Creditos NUMBER := :NEW.Creditos;
	v_Tipo VARCHAR2(20) := :NEW.Tipo;
BEGIN
	FOR Asignatura IN C LOOP
		IF Asignatura.Creditos != v_Creditos AND v_Tipo LIKE 'Optativo' THEN
			RAISE_APPLICATION_ERROR(-20012, 'Todas las asignaturas optativas de un grado deben tener el mismo número de créditos.');
		END IF;
	END LOOP;
END;
/

--RN-009
CREATE OR REPLACE TRIGGER TR_AsigOpt_Trimestrales
AFTER INSERT OR UPDATE OF Periodo, Tipo ON Asignaturas
FOR EACH ROW
DECLARE
	v_Periodo VARCHAR2(20) := :NEW.Periodo;
	v_Tipo VARCHAR2(20) := :NEW.Tipo;
BEGIN
	IF v_Tipo = 'Optativo' AND v_Periodo ='Anual' THEN
		RAISE_APPLICATION_ERROR(-20013, 'Todas las asignaturas optativas de un grado deben ser cuatrimestrales.');
	END IF;
END;
/

--RN-010
CREATE OR REPLACE TRIGGER TR_CantCredOpt_A_Cursar
BEFORE INSERT ON MatriculasContienenAsignaturas
FOR EACH ROW
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
	CURSOR C IS
		SELECT OID_G FROM MatriculasPertenecenAGrados WHERE Codigo_Matric = :NEW.Codigo_Matric;
	v_Codigo_Asig NUMBER := :NEW.Codigo_Asig;
	v_Codigo_Matric NUMBER := :NEW.Codigo_Matric;
	v_CreditosOptMatriculados NUMBER;
	v_CreditosNuevaAsig NUMBER := 0;
	v_TotalCreditos NUMBER;
	v_Tipo VARCHAR2(20);
BEGIN
	FOR Grado IN C LOOP
		SELECT SUM(Creditos) INTO v_CreditosOptMatriculados FROM Asignaturas WHERE Tipo = 'Optativo' AND Codigo_Asig IN (SELECT DISTINCT Codigo_Asig FROM MatriculasContienenAsignaturas NATURAL JOIN Matriculas NATURAL JOIN MatriculasPertenecenAGrados WHERE OID_G = Grado.OID_G AND Codigo_Matric = v_Codigo_Matric);
		SELECT Tipo INTO v_Tipo FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
		IF v_Tipo LIKE 'Optativo' THEN
			SELECT Creditos INTO v_CreditosNuevaAsig FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
			v_TotalCreditos := v_CreditosNuevaAsig + v_CreditosOptMatriculados;
			IF v_TotalCreditos > 30 THEN
				RAISE_APPLICATION_ERROR(-20014, 'El número mínimo de créditos de asignaturas optativas que debe cursar un alumno debe estar comprendido entre 0 y 30.');
			END IF;
		END IF;
	END LOOP;		
END;
/

--RN-011
CREATE OR REPLACE TRIGGER TR_Valor_Nota
AFTER INSERT OR UPDATE OF Valor ON Notas
FOR EACH ROW
DECLARE
	v_Valor NUMBER := :NEW.Valor;
BEGIN
	IF v_Valor < 0 OR v_Valor > 10 THEN
		RAISE_APPLICATION_ERROR(-20015, 'El valor de una nota a la hora de evaluar un alumno debe estar comprendida entre 0 y 10.');
	END IF;
END;
/

--RN-012
CREATE OR REPLACE TRIGGER TR_Calificacion_Nota
AFTER INSERT OR UPDATE OF Valor, Calificacion ON Notas
FOR EACH ROW 
DECLARE
	v_Valor NUMBER := :NEW.Valor;
	v_Calificacion VARCHAR2(20) := :NEW.Calificacion;
	v_EsCorrecto BOOLEAN := TRUE;
BEGIN
	IF v_Valor < 5 AND v_Calificacion != 'Suspenso' THEN
		v_EsCorrecto := FALSE;
	END IF;
	IF v_Valor >= 5 AND v_Valor < 7 AND v_Calificacion != 'Aprobado' THEN
		v_EsCorrecto := FALSE;
	END IF;
	IF v_Valor >= 7 AND v_Valor < 9 AND v_Calificacion != 'Notable' THEN
		v_EsCorrecto := FALSE;
	END IF;
	IF v_Valor >= 9 AND v_Valor < 10  AND v_Calificacion != 'Sobresaliente' THEN
		v_EsCorrecto := FALSE;
	END IF;
	IF v_Valor = 10 AND v_Calificacion != 'Matrícula de honor' THEN
		v_EsCorrecto := FALSE;
	END IF;
	IF v_EsCorrecto = FALSE THEN
		RAISE_APPLICATION_ERROR(-20016, 'La calificación de una evaluación debe tener su correspondiente valor de nota.');
	END IF;
END;
/

--RN-013
CREATE OR REPLACE TRIGGER TR_AsigImpartidas_Unico_Dept
AFTER INSERT OR UPDATE OF DNI, Codigo_Asig ON ProfesoresImpartenAsignaturas
FOR EACH ROW
DECLARE
	v_DNI VARCHAR2(10) := :NEW.DNI;
	v_Codigo_Asig NUMBER := :NEW.Codigo_Asig;
	v_OID_Dep_Prof NUMBER;
	v_OID_Dep_Asig NUMBER;
BEGIN
	SELECT OID_Dep INTO v_OID_Dep_Prof FROM Profesores WHERE DNI = v_DNI;
	SELECT OID_Dep INTO v_OID_Dep_Asig FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
	IF v_OID_Dep_Prof != v_OID_Dep_Asig THEN
		RAISE_APPLICATION_ERROR(-20017, 'Un profesor no puede impartir una asignatura de otro departamento que no corresponda al suyo.');
	END IF;
END;
/

--RN-014
CREATE OR REPLACE TRIGGER TR_Dedicacion_Prof_Asig
AFTER INSERT OR UPDATE OF Codigo_Asig, Dedicacion ON ProfesoresImpartenAsignaturas
FOR EACH ROW 
DECLARE
	v_Codigo_Asig NUMBER := :NEW.Codigo_Asig;
	v_Dedicacion NUMBER := :NEW.Dedicacion;
	v_Creditos NUMBER;
BEGIN
	SELECT Creditos INTO v_Creditos FROM Asignaturas WHERE Codigo_Asig = v_Codigo_Asig;
	IF v_Dedicacion <= 0 OR v_Dedicacion > v_Creditos THEN
		RAISE_APPLICATION_ERROR(-20018, 'El número de créditos dedicados a una asignatura por un profesor debe ser mayor que 0 y menor o igual que el número de créditos de ésta.');
	END IF;
END;
/

--RN-015
CREATE OR REPLACE TRIGGER TR_Dedicacion_Maxima_Prof
AFTER INSERT OR UPDATE OF DNI, Dedicacion ON ProfesoresImpartenAsignaturas
FOR EACH ROW 
DECLARE
	PRAGMA AUTONOMOUS_TRANSACTION;
	v_DNI VARCHAR2(10) := :NEW.DNI;
	v_NuevaDedicacion NUMBER := :NEW.Dedicacion;
	v_AntiguaDedicacion NUMBER := :OLD.Dedicacion;
	v_DedicacionActual NUMBER;
	v_TotalCreditos NUMBER;
	v_CategoriaProfesor VARCHAR2(20);
BEGIN
	SELECT Categoria INTO v_CategoriaProfesor FROM Profesores WHERE DNI = v_DNI;
	SELECT SUM(Dedicacion) INTO v_DedicacionActual FROM ProfesoresImpartenAsignaturas WHERE DNI = v_DNI;
	IF UPDATING ('Dedicacion') THEN
		v_TotalCreditos := v_DedicacionActual - v_AntiguaDedicacion + v_NuevaDedicacion;
	ELSE
		v_TotalCreditos := v_DedicacionActual + v_NuevaDedicacion;
	END IF;
	IF (v_TotalCreditos > 32) AND (v_CategoriaProfesor NOT LIKE 'Ayudante' OR v_CategoriaProfesor NOT LIKE 'Ayudante doctor') THEN
		RAISE_APPLICATION_ERROR(-20019, 'Un profesor no ayudante puede impartir un máximo de 32 créditos.');
	END IF;
	IF (v_TotalCreditos > 6) AND (v_CategoriaProfesor LIKE 'Ayudante' OR v_CategoriaProfesor LIKE 'Ayudante doctor') THEN
		RAISE_APPLICATION_ERROR(-20020, 'Un profesor ayudante puede impartir un máximo de 6 créditos.');
	END IF;	
END;
/

--RN-016
CREATE OR REPLACE TRIGGER TR_Dias_Tutorias
AFTER INSERT OR UPDATE OF Fecha ON Tutorias
FOR EACH ROW
DECLARE
	v_Fecha DATE := :NEW.Fecha;
	v_Dia VARCHAR2(20);
BEGIN
	SELECT TO_CHAR(v_Fecha, 'D') INTO v_Dia FROM Dual;
	IF v_Dia IN (6, 7) THEN
		RAISE_APPLICATION_ERROR(-20021, 'Los días de la semana en dónde se puede realizar una tutoría deben estar entre lunes y viernes');
	END IF;
END;
/

--RN-017
CREATE OR REPLACE TRIGGER TR_Duracion_Tutorias
AFTER INSERT OR UPDATE OF Duracion ON Tutorias
FOR EACH ROW 
DECLARE
	v_Duracion NUMBER := :NEW.Duracion;
BEGIN
	IF v_Duracion > 30 OR v_Duracion < 10 THEN
		RAISE_APPLICATION_ERROR(-20022, 'La duración de una tutoría debe ser de al menos 10 minutos y de máximo 30 minutos');
	END IF;
END;
/