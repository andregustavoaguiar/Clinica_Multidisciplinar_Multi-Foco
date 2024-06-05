-- Populando tabela CLINICA
INSERT INTO CLINICA (id_clinica, Nome_clinica, CNPJ, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_Cep, telefone_1, whatsapp, email)
VALUES
(1, 'Clinica Central', '12345678901234', 'Rua Principal', '100', NULL, 'Centro', 'Cidade A', '12345-678', '1234567890', NULL, 'clinica.central@example.com');



-- Populando tabela PERMISSAO
INSERT INTO PERMISSAO (id_permissao, permissao, ponto, adm_todos, agendamento, prontuario)
VALUES
(1, 'Administrador', true, true, true, true),
(2, 'Médico', true, false, true, true),
(3, 'Recepcionista', true, false, true, false),
(4, 'Fisioterapeuta', true, false, true, true),
(5, 'Enfermeiro', true, false, true, true);

-- Populando tabela PROFISSIONAL
INSERT INTO PROFISSIONAL (Matricula_profissional, Nome_profissional, RG, genero, cpf, Dt_admissao, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_Cep, telefone_1, whatsapp, email, salario, observacoes, feedback, numero_conselho, tipo_conselho, FK_PERMISSAO_id_permissao)
VALUES
(1, 'João Silva', '1234567', 'M', '12345678901', '2020-01-01', 'Rua Principal', '10', NULL, 'Centro', 'Cidade A', '12345-678', '987654321', NULL, 'joao.silva@example.com', 5000, NULL, NULL, 12345, 'CRM', 1),
(2, 'Maria Oliveira', '2345678', 'F', '23456789012', '2020-01-01', 'Rua Secundária', '20', NULL, 'Bairro A', 'Cidade B', '23456-789', '987654321', NULL, 'maria.oliveira@example.com', 5500, NULL, NULL, 23456, 'CRM', 2),
(3, 'Carlos Santos', '3456789', 'M', '34567890123', '2020-01-01', 'Avenida Principal', '30', NULL, 'Centro', 'Cidade A', '34567-890', '987654321', NULL, 'carlos.santos@example.com', 6000, NULL, NULL, 34567, 'CRM', 3),
(4, 'Ana Souza', '4567890', 'F', '45678901234', '2020-01-01', 'Avenida Secundária', '40', NULL, 'Bairro B', 'Cidade B', '45678-901', '987654321', NULL, 'ana.souza@example.com', 5800, NULL, NULL, 45678, 'CRM', 4),
(5, 'Pedro Lima', '5678901', 'M', '56789012345', '2020-01-01', 'Rua Principal', '50', NULL, 'Centro', 'Cidade A', '56789-012', '987654321', NULL, 'pedro.lima@example.com', 5200, NULL, NULL, 56789, 'CRM', 5);

-- Populando tabela CONSULTORIO
INSERT INTO CONSULTORIO (numero_do_consultorio, descricao, FK_PROFISSIONAL_matricula_profissional, FK_CLINICA_id_clinica)
VALUES
(1, 'Consultório para atendimento geral', 1, 1),
(2, 'Consultório para especialidades médicas', 2, 1),
(3, 'Consultório para exames', 3, 1);

-- Populando tabela PONTO
INSERT INTO PONTO (data, hora, tipo_registro, FK_PROFISSIONAL_Matricula_profissional)
VALUES
('2024-05-01', '08:00', true, 1),
('2024-05-02', '09:00', true, 2),
('2024-05-03', '08:30', true, 3),
('2024-05-04', '07:45', true, 4),
('2024-05-05', '10:00', true, 5);

-- Populando tabela CATEGORIA
INSERT INTO CATEGORIA (id_categoria, tipo_categoria, descricao)
VALUES
(1, 'Médico', 'Profissionais formados em medicina'),
(2, 'Enfermeiro', 'Profissionais com formação em enfermagem'),
(3, 'Técnico de Enfermagem', 'Profissionais com formação técnica em enfermagem'),
(4, 'Fisioterapeuta', 'Profissionais com formação em fisioterapia'),
(5, 'Recepcionista', 'Profissionais responsáveis pelo atendimento ao público');



-- Populando tabela PACIENTE
INSERT INTO PACIENTE (CPF_paciente, nome_paciente, dt_nascimento, RG, genero, nome_responsavel, contato_emergencia, observacoes, end_logradouro, end_numero, end_complemento, end_bairro, end_cidade, end_Cep, Telefone_1, whatsapp, email)
VALUES
('12345678901', 'Lucas Oliveira', '1990-05-01', '12345678', 'M', 'Mariana Oliveira', '987654321', NULL, 'Rua Principal', '100', NULL, 'Centro', 'Cidade A', '12345-678', '987654321', NULL, 'lucas.oliveira@example.com'),
('23456789012', 'Mariana Santos', '1995-06-02', '23456789', 'F', 'Pedro Santos', '987654321', NULL, 'Rua Secundária', '200', NULL, 'Bairro A', 'Cidade B', '23456-789', '987654321', NULL, 'mariana.santos@example.com'),
('34567890123', 'Pedro Souza', '1980-07-03', '34567890', 'M', 'Maria Souza', '987654321', NULL, 'Avenida Principal', '300', NULL, 'Centro', 'Cidade A', '34567-890', '987654321', NULL, 'pedro.souza@example.com'),
('45678901234', 'Julia Lima', '1988-08-04', '45678901', 'F', 'Carlos Lima', '987654321', NULL, 'Avenida Secundária', '400', NULL, 'Bairro B', 'Cidade B', '45678-901', '987654321', NULL, 'julia.lima@example.com'),
('56789012345', 'Luana Oliveira', '1992-09-05', '56789012', 'F', 'Lucas Oliveira', '987654321', NULL, 'Rua Principal', '500', NULL, 'Centro', 'Cidade A', '56789-012', '987654321', NULL, 'luana.oliveira@example.com'),
('67890123456', 'Gustavo Silva', '1985-10-06', '67890123', 'M', 'Ana Silva', '987654321', NULL, 'Rua Secundária', '600', NULL, 'Bairro A', 'Cidade B', '67890-123', '987654321', NULL, 'gustavo.silva@example.com'),
('78901234567', 'Ana Lima', '1991-11-07', '78901234', 'F', 'Pedro Lima', '987654321', NULL, 'Avenida Principal', '700', NULL, 'Centro', 'Cidade A', '78901-234', '987654321', NULL, 'ana.lima@example.com'),
('89012345678', 'Rafaela Santos', '1987-12-08', '89012345', 'F', 'Carlos Santos', '987654321', NULL, 'Avenida Secundária', '800', NULL, 'Bairro B', 'Cidade B', '89012-345', '987654321', NULL, 'rafaela.santos@example.com'),
('90123456789', 'Gabriel Souza', '1994-01-09', '90123456', 'M', 'Maria Souza', '987654321', NULL, 'Rua Principal', '900', NULL, 'Centro', 'Cidade A', '90123-456', '987654321', NULL, 'gabriel.souza@example.com'),
('01234567890', 'Gabriel Marmiteiro', '1990-01-09', '910123456', 'M', 'Pedro Souza', '987654321', NULL, 'Rua adjacencia', '900', NULL, 'Centro', 'Cidade A', '90123-456', '987654321', NULL, 'bgtes@example.com');

-- Populando tabela PRONTUARIO
INSERT INTO PRONTUARIO (id_prontuario, tipo_de_atendimento, data_do_ultimo_atendimento, diagnostico, tratamento, historico_medico, FK_PACIENTE_CPF_paciente)
VALUES
(41, 'Consulta Geral', '2024-05-01', 'Saudável', 'Nenhum', 'Nenhum', '12345678901'),
(42, 'Consulta Especializada', '2024-05-02', 'Alergia a penicilina', 'Evitar penicilina', 'Histórico de alergias', '23456789012'),
(43, 'Consulta Geral', '2024-05-03', 'Diabetes', 'Insulina diária', 'Histórico familiar de diabetes', '34567890123'),
(44, 'Consulta Cardiológica', '2024-05-04', 'Hipertensão', 'Medicamento diário', 'Histórico de hipertensão', '45678901234'),
(45, 'Consulta Geral', '2024-05-05', 'Saudável', 'Nenhum', 'Nenhum', '56789012345'),
(46, 'Consulta Respiratória', '2024-05-06', 'Asma', 'Inalador diário', 'Histórico de asma', '67890123456'),
(47, 'Consulta Geral', '2024-05-07', 'Saudável', 'Nenhum', 'Nenhum', '78901234567'),
(48, 'Consulta Geral', '2024-05-08', 'Saudável', 'Nenhum', 'Nenhum', '89012345678'),
(49, 'Consulta Geral', '2024-05-09', 'Saudável', 'Nenhum', 'Nenhum', '90123456789'),
(50, 'Consulta Especializada', '2024-05-10', 'Alergia a frutos do mar', 'Evitar frutos do mar', 'Histórico de alergias', '01234567890');

-- Populando tabela AVALIACAO
INSERT INTO AVALIACAO (id_avaliacao, data, avaliacao_profissional, comunicacao, empatia, comentarios, matricula_profissional)
VALUES
(1, '2024-05-01', 5, 4, 5, 'Ótimo atendimento.', 1 ),
(2, '2024-05-02', 4, 3, 4, 'Bom atendimento.', 2);

-- Populando tabela AGENDAMENTO
INSERT INTO AGENDAMENTO (id_agendamento, data, hora, tipo_atendimento, status, observacoes, custo, FK_PACIENTE_CPF_paciente, FK_PROFISSIONAL_Matricula_profissional)
VALUES
(1, '2024-06-01', '08:00', 'Consulta Geral', true, NULL, NULL, '12345678901', 1),
(2, '2024-06-02', '09:00', 'Consulta Especializada', true, NULL, NULL, '23456789012', 2),
(3, '2024-06-03', '10:00', 'Exame de Sangue', true, NULL, NULL, '34567890123', 3),
(4, '2024-06-04', '11:00', 'Consulta Cardiológica', true, NULL, NULL, '45678901234', 4),
(5, '2024-06-05', '12:00', 'Consulta Geral', true, NULL, NULL, '56789012345', 5);

-- Populando tabela PROFISSIONAL_CATEGORIA_OCUPA
INSERT INTO PROFISSIONAL_CATEGORIA_OCUPA (FK_PROFISSIONAL_Matricula_profissional, FK_CATEGORIA_id_categoria)
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3);

INSERT INTO CLINICA_PROFISSIONAL_POSSUI (FK_CLINICA_id_clinica, FK_PROFISSIONAL_Matricula_profissional)
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

INSERT INTO PROFISSIONAL_PRONTUARIO_ACESSA (FK_PROFISSIONAL_Matricula_profissional, FK_PRONTUARIO_id_prontuario)
VALUES
(1, 41),
(2, 42),
(3, 43),
(4, 44),
(5, 45);

consultas de sql


SELECT P.Nome_profissional, C.tipo_categoria, C.descricao
FROM PROFISSIONAL P
JOIN PROFISSIONAL_CATEGORIA_OCUPA PCO ON P.Matricula_profissional = PCO.FK_PROFISSIONAL_Matricula_profissional
JOIN CATEGORIA C ON PCO.FK_CATEGORIA_id_categoria = C.id_categoria;
Consultar todos os pacientes e seus prontuários:
sql
Copiar código
SELECT P.nome_paciente, PR.diagnostico, PR.tratamento
FROM PACIENTE P
JOIN PRONTUARIO PR ON P.CPF_paciente = PR.FK_PACIENTE_CPF_paciente;
Consultar os agendamentos marcados:
sql
Copiar código
SELECT A.id_agendamento, A.data, A.hora, A.tipo_atendimento, P.nome_paciente, PR.Nome_profissional
FROM AGENDAMENTO A
JOIN PACIENTE P ON A.FK_PACIENTE_CPF_paciente = P.CPF_paciente
JOIN PROFISSIONAL PR ON A.FK_PROFISSIONAL_Matricula_profissional = PR.Matricula_profissional;
Consultar as avaliações dos profissionais:
sql
Copiar código
SELECT A.data, P.Nome_profissional, A.avaliacao_profissional, A.comunicacao, A.empatia, A.comentarios
FROM AVALIACAO A
JOIN PROFISSIONAL P ON A.matricula_profissional = P.Matricula_profissional;