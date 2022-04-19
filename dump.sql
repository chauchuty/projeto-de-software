
CREATE TABLE `profissional` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `data_nasc` date NOT NULL,
  `cpf` varchar(255) UNIQUE NOT NULL,
  `email` varchar(255) UNIQUE,
  `telefone` varchar(255) UNIQUE,
  `endereco` varchar(255) NOT NULL
);

CREATE TABLE `convenio` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255),
  `desconto` decimal NOT NULL
);

CREATE TABLE `servico` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255),
  `valor` double
);

CREATE TABLE `cliente` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) UNIQUE,
  `telefone` varchar(255) UNIQUE,
  `endereco` varchar(255),
  `fk_convenio` int
);

CREATE TABLE `agendamento` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `data_inicio` date NOT NULL,
  `data_fim` date NOT NULL,
  `fk_cliente` int NOT NULL,
  `fk_profissional` int NOT NULL
);

CREATE TABLE `agendamento_servico` (
  `fk_agendamento` int NOT NULL,
  `fk_servico` int NOT NULL
);

CREATE TABLE `pagamento` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `valor` double NOT NULL,
  `desconto` decimal NOT NULL,
  `status` tinyint DEFAULT 0,
  `fk_agendamento` int NOT NULL
);

ALTER TABLE `cliente` ADD FOREIGN KEY (`fk_convenio`) REFERENCES `convenio` (`id`);

ALTER TABLE `agendamento_servico` ADD FOREIGN KEY (`fk_agendamento`) REFERENCES `agendamento` (`id`);

ALTER TABLE `agendamento` ADD FOREIGN KEY (`fk_cliente`) REFERENCES `cliente` (`id`);

ALTER TABLE `agendamento` ADD FOREIGN KEY (`fk_profissional`) REFERENCES `profissional` (`id`);

ALTER TABLE `agendamento_servico` ADD FOREIGN KEY (`fk_servico`) REFERENCES `servico` (`id`);

ALTER TABLE `pagamento` ADD FOREIGN KEY (`fk_agendamento`) REFERENCES `agendamento` (`id`);
