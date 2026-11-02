USE gestao_contatos;

CREATE TABLE contatos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    telefone VARCHAR(20),
    empresa VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO contatos (nome, email, telefone, empresa)
VALUES
('João Silva', 'joao@email.com', '11987654321', 'Tech Solutions'),
('Maria Souza', 'maria@email.com', '11976543210', 'InovaTech'),
('Pedro Santos', 'pedro@email.com', '11965432109', 'DevCorp'),
('Ana Oliveira', 'ana@email.com', '11954321098', 'SoftHouse'),
('Carlos Lima', 'carlos@email.com', '11943210987', 'CodeLab');
