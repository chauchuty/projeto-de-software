CREATE TABLE `profissional` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `data_nasc` date,
  `doc` varchar(255),
  `fk_cargo` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `aluno` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `data_nasc` date,
  `doc` varchar(16),
  `created_at` timestamp,
  `fk_convenio` int NOT NULL,
  `fk_modalidade` int
);

CREATE TABLE `convenio` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` int,
  `valor` decimal
);

CREATE TABLE `cargo` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255)
);

CREATE TABLE `modalidade` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255),
  `qtde_max_aluno` int,
  `fk_profissional` int NOT NULL,
  `fk_turma` int NOT NULL,
  `fk_horario` int NOT NULL
);

CREATE TABLE `dia_semana` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255)
);

CREATE TABLE `turma` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255),
  `descricao` varchar(255)
);

CREATE TABLE `horario` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `data_inicio` time,
  `data_fim` time
);

CREATE TABLE `dia_semana_modalidade` (
  `fk_dia_semana` int NOT NULL,
  `fk_modalidade` int NOT NULL
);

CREATE TABLE `aluno_modalidade` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fk_aluno` int NOT NULL,
  `fk_modalidade` int NOT NULL
);

CREATE TABLE `exercicios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL
);

ALTER TABLE `aluno` ADD FOREIGN KEY (`fk_convenio`) REFERENCES `convenio` (`id`);

ALTER TABLE `profissional` ADD FOREIGN KEY (`fk_cargo`) REFERENCES `cargo` (`id`);

ALTER TABLE `aluno_modalidade` ADD FOREIGN KEY (`fk_aluno`) REFERENCES `aluno` (`id`);

ALTER TABLE `aluno_modalidade` ADD FOREIGN KEY (`fk_modalidade`) REFERENCES `modalidade` (`id`);

ALTER TABLE `dia_semana_modalidade` ADD FOREIGN KEY (`fk_dia_semana`) REFERENCES `dia_semana` (`id`);

ALTER TABLE `dia_semana_modalidade` ADD FOREIGN KEY (`fk_modalidade`) REFERENCES `modalidade` (`id`);
