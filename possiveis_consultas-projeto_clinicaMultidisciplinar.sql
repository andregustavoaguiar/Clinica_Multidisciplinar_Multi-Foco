-- Retorna o nome do profissional, o tipo e a descrição da categoria ocupacional em que cada profissional está associado.

SELECT P.Nome_profissional, C.tipo_categoria, C.descricao
FROM PROFISSIONAL P
JOIN PROFISSIONAL_CATEGORIA_OCUPA PCO ON P.Matricula_profissional = PCO.FK_PROFISSIONAL_Matricula_profissional
JOIN CATEGORIA C ON PCO.FK_CATEGORIA_id_categoria = C.id_categoria;

-- Consultar todos os pacientes e seus prontuários:

SELECT P.nome_paciente, PR.diagnostico, PR.tratamento
FROM PACIENTE P
JOIN PRONTUARIO PR ON P.CPF_paciente = PR.FK_PACIENTE_CPF_paciente;

-- Consultar os agendamentos marcados:

SELECT A.id_agendamento, A.data, A.hora, A.tipo_atendimento, P.nome_paciente, PR.Nome_profissional
FROM AGENDAMENTO A
JOIN PACIENTE P ON A.FK_PACIENTE_CPF_paciente = P.CPF_paciente
JOIN PROFISSIONAL PR ON A.FK_PROFISSIONAL_Matricula_profissional = PR.Matricula_profissional;

-- Consultar as avaliações dos profissionais:

SELECT A.data, P.Nome_profissional, A.avaliacao_profissional, A.comunicacao, A.empatia, A.comentarios
FROM AVALIACAO A
JOIN PROFISSIONAL P ON A.matricula_profissional = P.Matricula_profissional;