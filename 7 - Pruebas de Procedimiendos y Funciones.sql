SET SERVEROUTPUT ON;

--RF-001
EXEC PR_Matricular_Asig(2623254, 2050032);

--RF-002
EXEC PR_Anular_Asig(2623254, 2050032);

--RF-003
EXEC PR_Evaluar_Alum(2050004, 1);

--RF-004
EXEC PR_Alum_Matriculado_En_Asig('35849097D', 2050004);

--RF-005
EXEC PR_CalfMed_Agrup_Por_Asig('56336094D');

--RF-006
EXEC PR_Asig_Orden_Por_Curso('07804804F');

--RF-007
EXEC PR_Expediente_Alumno('93839721C');

--RF-008
EXEC PR_Asociar_Asignatura_Dep(2050029,'Biología Celular');

--RF-009
EXEC PR_Asociar_Beca('91440SRA', '93839721C', TO_DATE('07/10/2016', 'DD/MM/YYYY'), TO_DATE('23/05/2017', 'DD/MM/YYYY'));

--RF-010
EXEC PR_Asociar_Duracion_Beca('61700LIW', '93839721C', TO_DATE('23/05/2017', 'DD/MM/YYYY'));

--RF-011
EXEC PR_Asociar_Cuantia_Fija_Beca('61700LIW', 3000);

--RF-012
EXEC PR_Asociar_Cuantia_Var_Beca('61700LIW', 100);

--RF-013
EXEC PR_Becas_Alumno('93839721C');

--RF-014
EXEC PR_Alumnos_Matriculados;

--RF-015
EXEC PR_Profesores_Impartiendo;

--RF-016
EXEC PR_Espacios_AgrupPor_Tipo;

--RF-017
EXEC PR_Profesores_Departamento('Lenguajes y Sistemas Informáticos');

--RF-018
EXEC PR_Asignaturas_Departamento('Lenguajes y Sistemas Informáticos');

--RF-019
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_Grupo_Mas_Alumnos);
END;
/

--RF-020
EXEC PR_Eliminar_Asignatura_Dep(2050012)

--RF-021
EXEC PR_Asociar_Profesor_Dep('53712051J', 'Lenguajes y Sistemas Informáticos');

--RF-022
EXEC PR_Eliminar_Profesor_Dep('53712051J');

--RF-023
EXEC PR_Prof_Imparte_Asig(2050029);

--RF-024
EXEC PR_Prof_Imparte_Asigs_Dep('Lenguajes y Sistemas Informáticos');

--RF-025
EXEC PR_NumProf_AgrupadosPor_Asig;

--RF-026
EXEC PR_NumTut_AgrupadosPor_Prof;

--RF-027
EXEC PR_Profesores_Despacho('F0.25');

--RF-028
EXEC PR_Notas_Expediente(78002608);

--RF-029
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_NotaMedia_Expediente(61654321));
END;
/

--RF-030
EXEC PR_Evaluar_Examen(TO_NUMBER('5,4'), 'Aprobado', 'Primera', 1, TO_DATE('25/01/2017', 'DD/MM/YYYY'), 84656361); 

--RF-031
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_MejorNota_Expediente(61654321));
END;
/

--RF-032
EXEC PR_AsignaturasOblig_Grado('Ingeniería Informática - Tecnologías Informáticas');

--RF-033
EXEC PR_AsignaturasOpt_Grado('Matemáticas');

--RF-034
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_CreditosOptativos_Grado('Ingeniería de la Salud'));
END;
/

--RF-035
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_CreditosObligatorios_Grado('Matemáticas'));
END;
/

--RF-036
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_CreditosTroncales_Grado('Ingeniería de la Salud'));
END;
/

--RF-037
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_CreditosTotales_Grado('Ingeniería de la Salud'));
END;
/

--RF-038
EXEC PR_Departamentos_Grado('Ingeniería de la Salud');

--RF-039
EXEC PR_Profesores_Grado('Ingeniería de la Salud');

--RF-040
EXEC PR_Asignaturas_Grado_Curso('Ingeniería de la Salud', 2);

--RF-041
EXEC PR_AsignaturasAnuales_Grado('Ingeniería de la Salud');

--RF-042
EXEC PR_Tutorias_Profesor('53712051J');

--RF-043
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_Departamento_Profesor('75238658T'));
END;
/

--RF-044
BEGIN
	DBMS_OUTPUT.PUT_LINE(FN_DedicacionTotal_Profesor('53712051J'));
END;
/

--RF-045
EXEC PR_Asignaturas_Profesor('53712051J');

--RF-046
EXEC PR_Dedicacion_Profesor('53712051J');

--RF-047
EXEC PR_Categoria_Profesor('53712051J', 'Interino');

--RF-048
EXEC PR_Adicion_Tutoria(TO_DATE('25/01/2017', 'DD/MM/YYYY'),'17:00', 20, '93839721C', '78035832Y');

--RF-049
EXEC PR_Eliminar_Tutoria(1);

--RF-050
EXEC PR_Asignar_Profesor_Asignatura('75258403B', 2050011, 6);

--RF-051
EXEC PR_Eliminar_Profesor_Asig('53712051J', 2050043);

--RF-052
EXEC PR_Asignaturas_Aula('A0.07', TO_DATE('01/10/2016', 'DD/MM/YYYY'));