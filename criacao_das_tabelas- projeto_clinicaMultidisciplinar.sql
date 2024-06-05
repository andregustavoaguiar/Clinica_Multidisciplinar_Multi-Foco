/* Modelagem_logica - projeto_clinicaMultidisciplinar: */

CREATE TABLE AGENDAMENTO (
    id_agendamento serial NOT NULL PRIMARY KEY,
    data date NOT NULL,
    hora time NOT NULL,
    tipo_atendimento varchar(50) NOT NULL,
    status boolean NOT NULL,
    observacoes varchar(200) NULL,
    custo money NULL,
    FK_PACIENTE_CPF_paciente varchar(14) NOT NULL,
    FK_PROFISSIONAL_Matricula_profissional serial NOT NULL
);

CREATE TABLE PACIENTE (
    CPF_paciente varchar(14) NOT NULL PRIMARY KEY,
    nome_paciente varchar(80) NOT NULL,
    dt_nascimento date NOT NULL,
    RG varchar(50) NOT NULL,
    genero varchar(15) NULL,
    nome_responsavel varchar(80) NOT NULL,
    contato_emergencia varchar(11) NOT NULL,
    observacoes varchar(200) NULL,
    end_logradouro varchar(80) NOT NULL,
    end_numero varchar(10) NULL,
    end_complemento varchar(20) NULL,
    end_bairro varchar(50) NOT NULL,
    end_cidade varchar(50) NOT NULL,
    end_Cep varchar(10) NOT NULL,
    Telefone_1 varchar(11) NOT NULL,
    whatsapp varchar(11) NULL,
    email varchar(255) NULL,
    UNIQUE (email, RG)
);

CREATE TABLE CONSULTORIO (
    numero_do_consultorio integer NOT NULL PRIMARY KEY,
    descricao varchar(200) NULL,
    FK_PROFISSIONAL_matricula_profissional serial NOT NULL,
    FK_CLINICA_id_clinica serial NOT NULL
);

CREATE TABLE PRONTUARIO (
    id_prontuario serial NOT NULL PRIMARY KEY,
    tipo_de_atendimento varchar(40) NOT NULL,
    data_do_ultimo_atendimento date NOT NULL,
    diagnostico varchar(500) NOT NULL,
    tratamento varchar(500) NULL,
    historico_medico varchar(500) NULL,
    FK_PACIENTE_CPF_paciente varchar(14) NOT NULL
);

CREATE TABLE PROFISSIONAL (
    Matricula_profissional serial NOT NULL PRIMARY KEY,
    Nome_profissional varchar(80) NOT NULL,
    RG varchar(50) NOT NULL,
    genero varchar(15) NULL,
    cpf varchar(11) NOT NULL,
    Dt_admissao date NULL,
    end_logradouro varchar(80) NOT NULL,
    end_numero varchar(10) NULL,
    end_complemento varchar(20) NULL,
    end_bairro varchar(50) NOT NULL,
    end_cidade varchar(50) NOT NULL,
    end_Cep varchar(10) NOT NULL,
    telefone_1 varchar(11) NOT NULL,
    whatsapp varchar(11) NULL,
    email varchar(255) NULL,
    salario money NULL,
    observacoes varchar(200) NULL,
    feedback varchar(200) NULL,
    numero_conselho integer NULL,
    tipo_conselho varchar(50) NULL,
    FK_PERMISSAO_id_permissao serial NOT NULL,
    UNIQUE (email, cpf, RG, Matricula_profissional)
);

CREATE TABLE PERMISSAO (
    id_permissao serial PRIMARY KEY,
    permissao varchar(50) NOT NULL,
    ponto boolean NOT NULL,
    adm_todos boolean NOT NULL,
    agendamento boolean NOT NULL,
    prontuario boolean NOT NULL
);

CREATE TABLE CLINICA (
    id_clinica serial NOT NULL PRIMARY KEY,
    Nome_clinica varchar(80) NOT NULL,
    CNPJ varchar(14) NOT NULL,
    end_logradouro varchar(80) NOT NULL,
    end_numero varchar(10) NULL,
    end_complemento varchar(20) NULL,
    end_bairro varchar(50) NOT NULL,
    end_cidade varchar(50) NOT NULL,
    end_Cep varchar(10) NOT NULL,
    telefone_1 varchar(11) NOT NULL,
    whatsapp varchar(11) NULL,
    email varchar(255) NULL,
    UNIQUE (CNPJ, email)
);

CREATE TABLE PONTO (
    id_registro serial NOT NULL PRIMARY KEY,
    data date NOT NULL,
    hora time NOT NULL,
    tipo_registro boolean NOT NULL,
    FK_PROFISSIONAL_Matricula_profissional serial
);

CREATE TABLE AVALIACAO (
    id_avaliacao serial NOT NULL PRIMARY KEY,
    data date NOT NULL,
    avaliacao_profissional integer NOT NULL,
    capacidade integer NOT NULL,
    tempo integer NOT NULL,
    comentarios varchar(200) NOT NULL,
    matricula_profissional serial NOT NULL
);

CREATE TABLE CLINICA_PROFISSIONAL_POSSUI (
    FK_CLINICA_id_clinica serial NOT NULL,
    FK_PROFISSIONAL_Matricula_profissional serial NOT NULL,
    PRIMARY KEY (FK_CLINICA_id_clinica, FK_PROFISSIONAL_Matricula_profissional)
);

CREATE TABLE PROFISSIONAL_PRONTUARIO_ACESSA (
    FK_PROFISSIONAL_Matricula_profissional serial NOT NULL,
    FK_PRONTUARIO_id_prontuario serial NOT NULL,
    PRIMARY KEY (FK_PROFISSIONAL_Matricula_profissional, FK_PRONTUARIO_id_prontuario)
);

CREATE TABLE CATEGORIA (
    id_categoria serial NOT NULL PRIMARY KEY,
    tipo_categoria varchar(50) NOT NULL,
    descricao varchar(200) NULL
);

CREATE TABLE PROFISSIONAL_CATEGORIA_OCUPA (
    FK_PROFISSIONAL_Matricula_profissional serial NOT NULL,
    FK_CATEGORIA_id_categoria serial NOT NULL,
    PRIMARY KEY (FK_PROFISSIONAL_Matricula_profissional, FK_CATEGORIA_id_categoria)
);
 
ALTER TABLE AGENDAMENTO ADD CONSTRAINT FK_AGENDAMENTO_2
    FOREIGN KEY (FK_PACIENTE_CPF_paciente)
    REFERENCES PACIENTE (CPF_paciente)
    ON DELETE CASCADE;
 
ALTER TABLE AGENDAMENTO ADD CONSTRAINT FK_AGENDAMENTO_3
    FOREIGN KEY (FK_PROFISSIONAL_Matricula_profissional)
    REFERENCES PROFISSIONAL (Matricula_profissional)
    ON DELETE CASCADE;
 
ALTER TABLE CONSULTORIO ADD CONSTRAINT FK_CONSULTORIO_2
    FOREIGN KEY (FK_CLINICA_id_clinica)
    REFERENCES CLINICA (id_clinica)
    ON DELETE RESTRICT;
 
ALTER TABLE CONSULTORIO ADD CONSTRAINT FK_CONSULTORIO_3
    FOREIGN KEY (FK_PROFISSIONAL_matricula_profissional)
    REFERENCES PROFISSIONAL (Matricula_profissional);
 
ALTER TABLE PRONTUARIO ADD CONSTRAINT FK_PRONTUARIO_2
    FOREIGN KEY (FK_PACIENTE_CPF_paciente)
    REFERENCES PACIENTE (CPF_paciente)
    ON DELETE CASCADE;
 
ALTER TABLE PROFISSIONAL ADD CONSTRAINT FK_PROFISSIONAL_2
    FOREIGN KEY (FK_PERMISSAO_id_permissao)
    REFERENCES PERMISSAO (id_permissao)
    ON DELETE RESTRICT;
 
ALTER TABLE PONTO ADD CONSTRAINT FK_PONTO_2
    FOREIGN KEY (FK_PROFISSIONAL_Matricula_profissional)
    REFERENCES PROFISSIONAL (Matricula_profissional)
    ON DELETE RESTRICT;
 
ALTER TABLE AVALIACAO ADD CONSTRAINT FK_AVALIACAO_2
    FOREIGN KEY (matricula_profissional)
    REFERENCES PROFISSIONAL (Matricula_profissional);
 
ALTER TABLE CLINICA_PROFISSIONAL_POSSUI ADD CONSTRAINT FK_CLINICA_PROFISSIONAL_POSSUI_1
    FOREIGN KEY (FK_CLINICA_id_clinica)
    REFERENCES CLINICA (id_clinica);
 
ALTER TABLE CLINICA_PROFISSIONAL_POSSUI ADD CONSTRAINT FK_CLINICA_PROFISSIONAL_POSSUI_2
    FOREIGN KEY (FK_PROFISSIONAL_Matricula_profissional)
    REFERENCES PROFISSIONAL (Matricula_profissional);
 
ALTER TABLE PROFISSIONAL_PRONTUARIO_ACESSA ADD CONSTRAINT FK_PROFISSIONAL_PRONTUARIO_ACESSA_1
    FOREIGN KEY (FK_PROFISSIONAL_Matricula_profissional)
    REFERENCES PROFISSIONAL (Matricula_profissional);
 
ALTER TABLE PROFISSIONAL_PRONTUARIO_ACESSA ADD CONSTRAINT FK_PROFISSIONAL_PRONTUARIO_ACESSA_2
    FOREIGN KEY (FK_PRONTUARIO_id_prontuario)
    REFERENCES PRONTUARIO (id_prontuario);
 
ALTER TABLE PROFISSIONAL_CATEGORIA_OCUPA ADD CONSTRAINT FK_PROFISSIONAL_CATEGORIA_OCUPA_1
    FOREIGN KEY (FK_CATEGORIA_id_categoria)
    REFERENCES CATEGORIA (id_categoria);
 
ALTER TABLE PROFISSIONAL_CATEGORIA_OCUPA ADD CONSTRAINT FK_PROFISSIONAL_CATEGORIA_OCUPA_2
    FOREIGN KEY (FK_PROFISSIONAL_Matricula_profissional)
    REFERENCES PROFISSIONAL (Matricula_profissional);