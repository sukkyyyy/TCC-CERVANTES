CREATE DATABASE IF NOT EXISTS divine_cherie_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE divine_cherie_db;

CREATE TABLE familias_olfativas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE perfumes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    preco DECIMAL(10, 2) NOT NULL,
    familia_id INT,
    essencia_principal VARCHAR(255) NOT NULL,
    descricao TEXT,
    FOREIGN KEY (familia_id) REFERENCES familias_olfativas(id) ON DELETE SET NULL
);

CREATE TABLE notas_olfativas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    perfume_id INT NOT NULL,
    saida VARCHAR(255),
    corpo VARCHAR(255),
    fundo VARCHAR(255),
    FOREIGN KEY (perfume_id) REFERENCES perfumes(id) ON DELETE CASCADE
);

INSERT INTO familias_olfativas (nome) VALUES
('Amadeirado Oriental'),
('Floral Musk'),
('Aquático Aromático'),
('Amadeirado Especiado'),
('Floral Rosado'),
('Oriental Gourmand'),
('Verde Amadeirado'),
('Aromático Floral'),
('Oriental Amadeirado'),
('Amadeirado Cremoso'),
('Fresco Amadeirado'),
('Cítrico Fresco'),
('Floral Limpo'),
('Oriental Intenso'),
('Frutado Floral'),
('Oriental Âmbar'),
('Frutado Sofisticado'),
('Floral Oriental'),
('Amadeirado Oriental Masculino'),
('Floral Doce');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('ÉCLAT NOIR', 209.90, (SELECT id FROM familias_olfativas WHERE nome='Amadeirado Oriental'), 'Baunilha Negra • Couro • Patchouli', 'Sedutor e sofisticado, Éclat Noir foi criado para pessoas intensas e elegantes. Um perfume misterioso que deixa presença marcante por onde passa.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Pimenta preta, bergamota', 'Jasmim negro, âmbar', 'Baunilha negra, couro e madeiras nobres');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('LUMIÈRE BLANCHE', 179.90, (SELECT id FROM familias_olfativas WHERE nome='Floral Musk'), 'Flores Brancas • Musk • Baunilha Cremosa', 'Uma fragrância delicada e iluminada, perfeita para mulheres elegantes e românticas.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Pera branca, bergamota', 'Jasmim, gardênia', 'Musk branco e baunilha suave');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('AZZURRO OCEANO', 189.90, (SELECT id FROM familias_olfativas WHERE nome='Aquático Aromático'), 'Notas Marinhas • Limão Siciliano • Cedro', 'Refrescante e moderno, transmite liberdade e sensação de brisa do mar.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Limão, menta', 'Lavanda azul, notas oceânicas', 'Cedro e musk');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('INTENSO HOMME', 199.90, (SELECT id FROM familias_olfativas WHERE nome='Amadeirado Especiado'), 'Âmbar • Pimenta • Sândalo', 'Masculino sofisticado e extremamente marcante para homens confiantes.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Cardamomo, bergamota', 'Lavanda, noz-moscada', 'Âmbar, sândalo e vetiver');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('ROSE DELICATE', 169.90, (SELECT id FROM familias_olfativas WHERE nome='Floral Rosado'), 'Rosa Chá • Peônia • Musk', 'Romântico e elegante, perfeito para quem ama fragrâncias femininas suaves.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Framboesa suave', 'Rosas delicadas e peônia', 'Musk e baunilha leve');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('VANILLE DORÉE', 184.90, (SELECT id FROM familias_olfativas WHERE nome='Oriental Gourmand'), 'Baunilha Dourada • Caramelo • Âmbar', 'Doce sofisticado e extremamente viciante, perfeito para noites especiais.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Açúcar mascavo', 'Baunilha cremosa', 'Âmbar e caramelo quente');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('FOREST VERDE', 194.90, (SELECT id FROM familias_olfativas WHERE nome='Verde Amadeirado'), 'Cedro • Folhas Verdes • Vetiver', 'Inspirado na natureza luxuosa e na elegância das florestas profundas.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Folhas verdes frescas', 'Pinheiro e ervas aromáticas', 'Cedro e vetiver');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('LAVANDA SERENA', 164.90, (SELECT id FROM familias_olfativas WHERE nome='Aromático Floral'), 'Lavanda Francesa • Musk • Íris', 'Suave, elegante e relaxante, ideal para o dia a dia.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Lavanda fresca', 'Íris e violeta', 'Musk confortável');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('OUD PREMIER', 229.90, (SELECT id FROM familias_olfativas WHERE nome='Oriental Amadeirado'), 'Oud Árabe • Incenso • Âmbar', 'Luxuoso e exótico, inspirado na perfumaria árabe premium.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Açafrão', 'Oud intenso e rosa oriental', 'Âmbar e incenso');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('SANTAL ÉLÉGANCE', 214.90, (SELECT id FROM familias_olfativas WHERE nome='Amadeirado Cremoso'), 'Sândalo • Baunilha • Musk', 'Elegante e refinado, perfeito para quem ama perfumes sofisticados.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Cardamomo suave', 'Sândalo cremoso', 'Musk quente e baunilha');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('BLEU INFINI', 189.90, (SELECT id FROM familias_olfativas WHERE nome='Fresco Amadeirado'), 'Notas Oceânicas • Bergamota • Cedro Azul', 'Moderno, refrescante e extremamente versátil.');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('CITRUS FRAIS', 159.90, (SELECT id FROM familias_olfativas WHERE nome='Cítrico Fresco'), 'Laranja Siciliana • Limão • Musk', 'Leve, vibrante e perfeito para dias quentes.');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('PUREZA FLORAL', 174.90, (SELECT id FROM familias_olfativas WHERE nome='Floral Limpo'), 'Lírio Branco • Jasmim • Musk', 'Delicado, confortável e elegante como pele limpa e hidratada.');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('ABSOLUTO NOIR', 239.90, (SELECT id FROM familias_olfativas WHERE nome='Oriental Intenso'), 'Incenso • Madeira Negra • Âmbar', 'O perfume mais intenso e luxuoso da coleção Divine Cherie.');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('PÊCHE VELOUTÉE', 169.90, (SELECT id FROM familias_olfativas WHERE nome='Frutado Floral'), 'Pêssego • Flores Brancas • Musk', 'Doce delicado e feminino com toque aveludado irresistível.');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('MAGNÉTIC AMBER', 224.90, (SELECT id FROM familias_olfativas WHERE nome='Oriental Âmbar'), 'Âmbar Dourado • Baunilha • Especiarias', 'Sensual e sofisticado, perfeito para noites elegantes.');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('CHAMPAGNE ÉTERNEL', 219.90, (SELECT id FROM familias_olfativas WHERE nome='Frutado Sofisticado'), 'Champagne Rosé • Pera • Musk', 'Luxuoso e brilhante, inspirado em celebrações inesquecíveis.');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('AURORA DE VÊNUS', 189.90, (SELECT id FROM familias_olfativas WHERE nome='Floral Oriental'), 'Peônia Rosa • Baunilha • Musk Rosado', 'Romântico e encantador, inspirado na delicadeza celestial de Vênus.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Pera doce e frutas vermelhas', 'Peônia rosa e rosas suaves', 'Baunilha cremosa e musk');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('NOIR ECLIPSE', 199.90, (SELECT id FROM familias_olfativas WHERE nome='Amadeirado Oriental Masculino'), 'Couro • Âmbar Negro • Cedro', 'Misterioso, elegante e extremamente marcante.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Pimenta preta e bergamota', 'Lavanda escura e couro', 'Cedro queimado e âmbar negro');

INSERT INTO perfumes (nome, preco, familia_id, essencia_principal, descricao) 
VALUES ('CHERIE', 549.90, (SELECT id FROM familias_olfativas WHERE nome='Floral Doce'), 'Rosa • Baunilha • Musk Branco', 'Doce, feminina e inesquecível. Feita para encantar em todos os momentos.');
INSERT INTO notas_olfativas (perfume_id, saida, corpo, fundo) VALUES (LAST_INSERT_ID(), 'Frutas vermelhas suaves', 'Rosas e flores delicadas', 'Baunilha cremosa e musk');