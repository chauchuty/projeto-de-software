CREATE TABLE `servico` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) UNIQUE NOT NULL,
  `descricao` varchar(255),
  `preco` decimal NOT NULL,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp
);

CREATE TABLE `pacote` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) UNIQUE NOT NULL,
  `descricao` varchar(255),
  `fk_promocao` integer,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp
);

CREATE TABLE `pacote_servico` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `fk_servico` int NOT NULL,
  `fk_pacote` int NOT NULL
);

CREATE TABLE `promocao` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(255) UNIQUE NOT NULL,
  `descricao` varchar(255),
  `desconto` decimal DEFAULT 0,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp
);

ALTER TABLE `pacote_servico` ADD FOREIGN KEY (`fk_pacote`) REFERENCES `pacote` (`id`);

ALTER TABLE `pacote_servico` ADD FOREIGN KEY (`fk_servico`) REFERENCES `servico` (`id`);

ALTER TABLE `pacote` ADD FOREIGN KEY (`fk_promocao`) REFERENCES `promocao` (`id`);
