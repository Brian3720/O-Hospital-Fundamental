-- Cria a tabela de médicos
CREATE TABLE medico (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  tipo ENUM('generalista', 'especialista', 'residente') NOT NULL,
  PRIMARY KEY (id)
);

-- Cria a tabela de especialidades
CREATE TABLE especialidade (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  medico_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (medico_id) REFERENCES medico(id)
);

-- Cria a tabela de pacientes
CREATE TABLE paciente (
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  endereco VARCHAR(255) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  email VARCHAR(255) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  rg VARCHAR(20) NOT NULL,
  convenio_nome VARCHAR(255) NOT NULL,
  convenio_cnpj VARCHAR(14) NOT NULL,
  convenio_tempo_carencia INT NOT NULL,
  PRIMARY KEY (id)
);

-- Cria a tabela de consultas
CREATE TABLE consulta (
  id INT NOT NULL AUTO_INCREMENT,
  data_hora DATETIME NOT NULL,
  medico_id INT NOT NULL,
  paciente_id INT NOT NULL,
  valor DECIMAL(10,2),
  convenio_nome VARCHAR(255),
  convenio_numero_cartao VARCHAR(20),
  especialidade_nome VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (medico_id) REFERENCES medico(id),
  FOREIGN KEY (paciente_id) REFERENCES paciente(id)
);

-- Cria a tabela de receitas
CREATE TABLE receita (
  id INT NOT NULL AUTO_INCREMENT,
  consulta_id INT NOT NULL,
  medicamento_nome VARCHAR(255) NOT NULL,
  quantidade INT NOT NULL,
  instrucoes_uso TEXT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (consulta_id) REFERENCES consulta(id)
);
