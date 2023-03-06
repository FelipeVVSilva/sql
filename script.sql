/* Modelagem Básica - 

ENTIDADE=TABELA
CAMPOS = ATRIBUTOS */

CLIENTE

NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM  */

/* FASE 01 E FASE 02 - AD ADM DE DADOS */

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER PROGRAMA DE MODELAGEM

/* FASE 03 - DBA / AD */

MODELAGEM FÍSICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA */

/* CRIANDO O BANCO DE DADOS */

CREATE DATABASE EXEMPLO

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */

CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30),
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100)

);

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES;

USE EXEMPLO;
SHOW TABLES;

USE PROJETO;

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;

-----

/*Tipos de dados */

Todos os banos de dados possuem tipos que devem ser atribuidos aos dados de uma tabela.
Para caracteres literais, temos char e varchar, para números temos int e float, para
objetos como fotos e documentos, temos o blob, para textos extensos, temos o text. 
A disciplina de banco de dados é tão fantástica que ao entendermos o porque das coisas,
podemos iniciar já em modo avançado e um bom exemplo disso são os tipos. Há uma profissão
dentro da área que é a do analista de performance ou tuning, esse profissional é responsável
por analisar o banco de dados e deixá-lo mais rápido. Parece algo avançado, e é! Porém,
com alguas atitudes simples, podemos deixar o banco sem a necessidade de atuação desse profissional.

Cada caracter no banco de dados, vale 1 byte. Sendo assim, se eu entro com o dado JOÃO,
estou entrando com 4 bytes no meu banco. E o que isso tem a ver com a tiagem de tabelas?

O banco de dados funciona como um download de dados da internet. Se baixamos um arquivo de 1 giga,
temos um temo maior que o download de 50 megas, considerando a mesma velocidade de conexão.

Ao tiparmos uma tabela de modo errado ou displicente, vamos aumentar a quantidade de dados que 
será baixada do banco de dados, prolongando assim o tempo de resposta.

Uma comparacao bem didatica é o tipo char e varchar
A palavra var, vem de variant, em ingles, ou seja, que é dinâmica. Logo, vimos que 1 caracter
é igual a 1 byte. Vejamos então a tipagem

varchar(10)
char(10)

entrando a palavra joao

total de bytes varchar(10) = 4 bytes
toal de bytes cahr(10) = 10 bytes

isso ocorre pois o char não varia. Os caracteres restantes serao preenchidos com espaço. 
eles nao ficam vazios. Enquanto que no varchar, o tipo varia conforme o dado.
Entao utilizo sempre o varchar? Não. O charé ligeiramente mais performatico, por nao
ter que gastar tempo variando de tamanho. Entao a regra é utilizar sempre o char quando
sabemos que o numero de caracteres naquela coluna nao vai variar nunca. Por exemplo,
unidade federativa, com dois digitos, sexo com um digito e assim por diante. Vista a diferença
que podemos fazer com uma tipagem correta de tabelas, na próxima aula detalharemos os tipos do mysql
e nos modulos específicos de cada banco, você entenderá os tipos correspondentes no sql server
e no oracle, que mudam muito pouco.

/*  Inserindo dados e valores nulos */

use projeto;

/* Mostrando as tabelas */
show tables

/* exibindo a estrutura de uma tabela */
desc cliente;

/* sintaxe basica de inserção - INSERT INTO TABELA... */

/* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS */

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',22222222222);
						  
/* O COMANDO SELECT 
selecao projecao e juncao
*/

SELECT NOW() as DATA_HORA, 'FELIPE MAFRA' AS PROFESSOR;

SELECT 'FELIPE MAFRA';

SELECT 'BANCO DE DADOS';

/* ALIAS DE COLUNAS */


SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE;

SELECT   EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE;

SELECT   EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE;

/* APENAS PARA FINS ACADEMICOS */

SELECT * FROM CLIENTE;

/*TABELA ERRADA - NAO DIGITE DIRETAMENTE NO BANCO */
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
	SEXO CHAR(1),
	EMAIL VARCHAR(30)
	CPF INT(11),
	TELEFONE VARCHAR(30),
	ENDERECO VARCHAR(100),

);

SELECT * FROM CLIENTE;


/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, TELEFONE FROM CLIENTE;

/* FILTRANDO */

SELECT NOME, SEXO FROM CLIENTE
WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ';

/* UTILIZANDO O LIKE */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QUALQUER COISA */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE 'OSCAR CURY%';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%';

/* Resolvendo o exercício */

CREATE DATABASE LIVRARIA;

USE LIVRARIA;

CREATE TABLE LIVROS(
	LIVRO VARCHAR(100),
	AUTOR VARCHAR(100),
	SEXO CHAR(1),
	PAGINAS INT(5),
	EDITORA VARCHAR(30),
	VALOR FLOAT(10,2),
	UF CHAR(2),
	ANO INT(4)
);

/* VERIFICANDO OS BANCOS */
SHOW DATABASES;

/* CONEVCTANDO A UM BANCO */
USE LIVRARIA;


INSERT INTO LIVROS VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO LIVROS VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO LIVROS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO LIVROS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO LIVROS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO LIVROS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO LIVROS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO LIVROS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO LIVROS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO LIVROS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

/1 – Trazer todos os dados./
select * from livros;

/2 – Trazer o nome do livro e o nome da editora/
SELECT LIVRO, EDITORA
FROM LIVROS;

/3 – Trazer o nome do livro e a UF dos livros publicados por autores do sexo masculino./
SELECT LIVRO, UF
FROM LIVROS
WHERE SEXO = 'M';

SELECT AUTOR, SEXO,LIVRO, UF
FROM LIVROS
WHERE SEXO = 'M';

/4 - Trazer o nome do livro e o número de páginas dos livros publicados por autores do sexo feminino./

SELECT LIVRO, PAGINAS
FROM LIVROS
WHERE SEXO = 'F';

SELECT AUTOR,  LIVRO, PAGINAS
FROM LIVROS
WHERE SEXO = 'F';


/5 – Trazer os valores dos livros das editoras de São Paulo./

SELECT LIVRO, VALOR
FROM LIVROS
WHERE UF = 'SP';

SELECT UF, LIVRO, VALOR
FROM LIVROS
WHERE UF = 'SP';

/6 – Trazer os dados dos autores do sexo masculino que tiveram livros publicados por São Paulo ou Rio de Janeiro (Questão Desafio)./

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE SEXO = 'M'
AND UF = 'SP'
OR UF = 'RJ';

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE 
SEXO = 'M' AND (UF = 'SP' OR UF = 'RJ');

SELECT AUTOR, SEXO, UF
FROM LIVROS
WHERE SEXO = 'M'
AND UF = 'SP'
AND paginas > 100;

/* OPERADORES LÓGICOS 
OR -> PARA QUE A SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
AND -> PARA QUE A SAIDA SEJA VERDADEIRA TODAS AS CONDICOES PRECISAM SER VERDADEIRAS.
*/

/* OR - OU */

SHOW DATABASES;

USE PROJETO;

SELECT * FROM CLIENTE;

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE
SEXO = 'F' OR ENDERECO LIKE '%ESTACIO';

/* AND - E */

SELECT NOME, SEXO, ENDERECO  FROM CLIENTE
WHERE 
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE
SEXO = 'F' AND ENDERECO LIKE '%ESTACIO';

/* COUNT(*), GROUP BY, PERFORMANCE COM OPERADORES
LOGICOS */

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT COUNT(*) AS "Quantidade de Registros da Tab. Cliente"
 FROM CLIENTE;

/* OPERADOR GROUP BY */

SELECT SEXO, COUNT(*)
FROM CLIENTE;

SELECT * FROM CLIENTE;

SELECT SEXO, COUNT(*) 
FROM CLIENTE
GROUP BY SEXO;

/* PERFORMANCE EM OPERADORES LOGICOS */

/* 1 MILHAO DE REGISTROS

PARA CONTAR
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

CONDICAO
SEXO = F
CIDADE = RIO DE JANEIRO

SITUACAO - TRATANDO COM OU / OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = 'F'
OR CIDADE = 'RIO DE JANEIRO';

SITUACAO - TRATANDO COM E / AND
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F';


/* exercicio */

/* Considerando o que vc aprendeu sobre performance, resolva os exercicios abaixo */

SELECT COUNT(*) FROM FUNCIONARIOS;

--Traga os funcionarios que trabalhem
--no departamento de filmes OU no
--departamento de roupas

-- 21 | Filmes   53 | Roupas

--Como estamos trabalhando com OR e a segunda condicao é opcional
--colocamos na primeira condicao quem tem mais chances de uma saida
--verdadeira, pois a segunda condicao nao será checada nesse caso.

select * from funcionarios
where departamento = 'Roupas'
or
departamento = 'Filmes';

SELECT COUNT(*), departamento
FROM FUNCIONARIOS
group by departamento;

SELECT COUNT(*), departamento
FROM FUNCIONARIOS
group by departamento
order by 1;

WHERE DEPARTAMENTO = 'Filmes' OR DEPARTAMENTO = 'Roupas'

--O gestor de marketing pediu a lista das funcionarias (AS) = FEMININO que trabalhem no departamento 
--de filmes ou no departamento lar. Ele necessita enviar um email para as colaboradoras
--desses dois setores. OR +  AND *

--Feminino 491 ocorrencias
select count(*), sexo
from funcionarios
group by sexo;

--52 | Lar  21 Filmes
select count(*), departamento
from funcionarios
group by departamento;

SELECT * FROM FUNCIONARIOS
WHERE
( DEPARTAMENTO = 'Lar' AND SEXO = 'Feminino' )
OR
( DEPARTAMENTO = 'Filmes' AND SEXO = 'Feminino' );

--Traga os funcionarios do sexo masculino
--ou os funcionarios que trabalhem no setor Jardim

SELECT * FROM FUNCIONARIOS
WHERE
SEXO = 'Masculino' OR
DEPARTAMENTO = 'Jardim';

create database exercicio;

use exercicio;

create table funcionarios
  (
      idFuncionario integer,
      nome varchar(100),
      email varchar(200),
      sexo varchar(10),
      departamento varchar(100),
      admissao varchar(10),
      salario integer,
      cargo varchar(100),
      idRegiao int
  );

insert into funcionarios values (1,'Kelley','rkelley0@soundcloud.com','Feminino','Computadores','10/2/2009',67470,'Structural Engineer',2);
insert into funcionarios values (2,'Armstrong','sarmstrong1@infoseek.co.jp','Masculino','Esporte','3/31/2008',71869,'Financial Advisor',2);
insert into funcionarios values (3,'Carr','fcarr2@woothemes.com','Masculino','Automotivo','7/12/2009',101768,'Recruiting Manager',3);
insert into funcionarios values (4,'Murray','jmurray3@gov.uk','Feminino','Joalheria','12/25/2014',96897,'Desktop Support Technician',3);
insert into funcionarios values (5,'Ellis','jellis4@sciencedirect.com','Feminino','Alimentícios','9/19/2002',63702,'Software Engineer III',7);
insert into funcionarios values (6,'Phillips','bphillips5@time.com','Masculino','Ferramentas','8/21/2013',118497,'Executive Secretary',1);
insert into funcionarios values (7,'Williamson','rwilliamson6@ted.com','Masculino','Computadores','5/14/2006',65889,'Dental Hygienist',6);
insert into funcionarios values (8,'Harris','aharris7@ucoz.com','Feminino','Brinquedos','8/12/2003',84427,'Safety Technician I',4);
insert into funcionarios values (9,'James','rjames8@prnewswire.com','Masculino','Joalheria','9/7/2005',108657,'Sales Associate',2);

insert into funcionarios values (11,'Jacobs','jjacobsa@sbwire.com','Feminino','Joalheria','11/27/2003',121966,'Community Outreach Specialist',7);
insert into funcionarios values (12,'Black','mblackb@edublogs.org','Masculino','Roupas','2/4/2003',44179,'Data Coordiator',7);
insert into funcionarios values (13,'Schmidt','sschmidtc@state.gov','Masculino','Bebês','10/13/2002',85227,'Compensation Analyst',3);
insert into funcionarios values (14,'Webb','awebbd@baidu.com','Feminino','Computadores','10/22/2006',59763,'Software Test Engineer III',4);
insert into funcionarios values (15,'Jacobs','ajacobse@google.it','Feminino','Games','3/4/2007',141139,'Community Outreach Specialist',7);
insert into funcionarios values (16,'Medina','smedinaf@amazonaws.com','Feminino','Bebês','3/14/2008',106659,'Web Developer III',1);
insert into funcionarios values (17,'Morgan','dmorgang@123-reg.co.uk','Feminino','Crianças','5/4/2011',148952,'Programmer IV',6);
insert into funcionarios values (18,'Nguyen','jnguyenh@google.com','Masculino','Lar','11/3/2014',93804,'Geologist II',5);
insert into funcionarios values (19,'Day','rdayi@chronoengine.com','Masculino','Eletronicos','9/22/2004',109890,'VP Sales',3);

insert into funcionarios values (21,'Bryant','sbryantk@wunderground.com','Feminino','Industrial','8/12/2005',78052,'Software Consultant',3);
insert into funcionarios values (22,'Alexander','kalexanderl@marketwatch.com','Masculino','Automotivo','12/26/2011',144724,'Marketing Assistant',2);
insert into funcionarios values (23,'Chapman','jchapmanm@archive.org','Feminino','Joalheria','4/12/2001',126103,'Senior Developer',4);
insert into funcionarios values (24,'Kelly','ekellyn@weibo.com','Masculino','Jardim','6/29/2006',144965,'Nurse Practicioner',2);
insert into funcionarios values (25,'Stephens','jstephenso@ow.ly','Masculino','Brinquedos','6/4/2004',70613,'Business Systems Development Analyst',1);
insert into funcionarios values (26,'Porter','vporterp@yelp.com','Feminino','Lar','5/30/2011',90746,'Dental Hygienist',2);
insert into funcionarios values (27,'Owens','cowensq@shareasale.com','Feminino','Lar','5/26/2005',78698,'Executive Secretary',2);
insert into funcionarios values (28,'Scott','cscottr@sphinn.com','Feminino','Books','3/2/2008',63336,'Sales Representative',4);
insert into funcionarios values (29,'Price','cprices@Brasil.gov','Feminino','Roupas','7/5/2013',95436,'Quality Engineer',3);
insert into funcionarios values (30,'Weaver','dweavert@shinystat.com','Masculino','Beleza','2/17/2012',83144,'Account Representative III',2);
insert into funcionarios values (31,'Willis','hwillisu@army.mil','Feminino','Ferramentas','10/21/2012',113507,'Accountant I',7);
insert into funcionarios values (32,'Torres','ltorresv@amazon.de','Masculino','Games','4/7/2014',78245,'Nuclear Power Engineer',6);

/* FILTRANDO VALORES NULOS */

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE sexo = 'F';

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL = NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL;

/* IS OU IS NOT NULL */

/* UTILIZANDO O UPDATE PARA ATUALIZAR VALORES */

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'LILIAN@HOTMAIL.COM';

SELECT NOME, EMAIL
FROM CLIENTE;

/* WHERE - VAI SER O SEU MELHOR AMIGO DA VIDA
PRA VIDA INTEIRA */


SELECT * FROM CLIENTE
WHERE NOME = 'LILIAN';

UPDATE CLIENTE
SET EMAIL = 'JOAOA@IG.COM.BR'
WHERE NOME = 'JOAO';

SELECT NOME, EMAIL
FROM CLIENTE;

UPDATE CLIENTE
SET EMAIL = 'JORGE@IG.COM.BR'
WHERE NOME = 'JORGE';

SELECT NOME, EMAIL
FROM CLIENTE;

/*COMMIT E ROLLBACK */

/* DELETANDO REGISTROS COM A CLAUSULA DELETE */

DELETE FROM CLIENTE; 

SELECT * FROM CLIENTE WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE; -- TOTAL 6

SELECT COUNT(*) FROM CLIENTE -- TOTAL DELETADO 1
WHERE NOME = 'ANA';

DELETE FROM CLIENTE
WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE; -- RESTANTE 5

SELECT 6 - 1;

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE VALUES('CARLA','F','C.LOPES@UOL.COM',45638854,'4575-0048',
'RUA COPPER LEAF - WILLIAMSBURG - KITCHENER');

SELECT * FROM CLIENTE;

DELETE FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'LILIAN@HOTMAIL.COM';

SELECT * FROM CLIENTE
WHERE NOME = 'CARLA'
OR EMAIL = 'LILIAN@HOTMAIL.COM';

SELECT * FROM CLIENTE -- OR TRAZ TODO MUNDO COM PELO MENOS UMA DAS DUAS CONDICOES
WHERE NOME = 'CARLA'
AND EMAIL = 'LILIAN@HOTMAIL.COM';

DELETE FROM CLIENTE -- TRAZ APENAS O REGISTRO QUE SATISFACA AS DUAS CONDICOES
WHERE NOME = 'CARLA'
AND EMAIL = 'LILIAN@HOTMAIL.COM';

SELECT * FROM CLIENTE;

/* ENTRANDO COM MAIS TELEFONES */

UPDATE CLIENTE 
SET TELEFONE = '97865434'
WHERE NOME = 'JOAO';

SELECT * FROM CLIENTE;

UPDATE CLIENTE 
SET TELEFONE = '22923110 - 97865434'
WHERE NOME = 'JOAO';

SELECT * FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT ENDERECO, COUNT(*) FROM CLIENTE
GROUP BY ENDERECO;

/*  HISTORIA DA MODELAGEM 

DECADA DE 70, EUA - CRISE DO SOFTWARE
FOI A CRISE QUE ATINGIU NAO SOMENTE A AREA DE TECNOLOGIA
MAS TAMBÉM TODAS AS EMPRESAS QUE UTILIZAVAM DE SISTEMAS
TECNOLOGICOS PARA CONTROLAR SEUS NEGOCIOS.

NAQUELA EPOCA, PROGRAMAR ERA UM PROCESSO ARTESANAL.
BASTAVA OLHAR O CODIGO QUE VOCE SABERIA QUEM O
ESCREVEU, TAO POUCOS ERAM OS PROGRAMADORES EACHTAO ARCAICO ERAM
OS METODOS DE PROGRAMACAO. EM UM PRIMEIRO MOMENTO,
OS PROFISSIONAIS DE TI VIRAM A NECESSIDADE DE SE PROGRAMAR
E INICIARAM SUA CAMINHADA, CONSTRUINDO SISTEMAS QUE ATENDIAM
NUM PRIMEIRO MOMENTO, MAS DEPOIS TRAZIAM INFORMACOES ERRADAS,
PROVOCANDO A FALENCIA DE DIVERSAS EMPRESAS. LEMBRE-SE: INFORMACOES
ERRADAS PODEM LEVAR A SUA EMPRESA A FALENCIA, E FOI ISSO QUE ACONTECEU.
ISSO OCORRIA POIS OS PROFISSIONAIS SABIAM PROGRAMAR MAS ENTENDIAM APENAS
DO NEGOCIO DAS EMPRESAS DAS QUAIS FAZIAM PARTE. SER TER O KNOW HOW
DOS DEMAIS NEGOCIOS, OS PROGRAMADORES PROGRAMAVAM VOLTADOS PARA OS
PROCEDIMENTOS, E ESSE FOI UM ERRO MORTAL.

PETER CHEN, VENDO TODO ESSE CENARIO AFIRMOU: NAO PODEMOS CRIAR BANCOS
DE DADOS VOLTADOS PARA PROCEDIMENTOS EMPRESARIAIS, POIS OS PROCEDIMENTOS
SOFREM INTERFERENCIAS EXTERNAS E PODEM SER ALTERADOS. A UNICA COISA
QUE NAO SOFRE ALTERACAO SAO OS DADOS.

POR EXEMPLO, ARMAZENAMOS NO BANCO A VENDA DE JANEIRO, FEVEREIRO E MARCO
O TOTAL DAS VENDAS E O IMPOSTO PAGO AO GOVERNO. 
FAZEMOS ISSO DURANTE MUITO TEMPO. DE UMA HORA PRA OUTRA O GOVERNO
MUDA A ALIQUOTA DO IMPOSTO. COMO FARÁ SENTIDO OS PAGAMENTOS ARMAZENADOS
ANTERIORMENTE? AQUI NOTA-SE QUE ARMAZENAMOS DADOS E ARMAZENAMOS
INFORMACOES CORRESPONDENTES AOS PROCEDIMENTOS EXTERNOS. DEVEMOS
APENAS ARMAZENAR OS DADOS, POIS ELES SAO SUFICIENTES PARA GERAR
A INFORMACAO.

MODELAR É UMA ARTE, ALGO QUE SE APRENDE COM A PRATICA. E VOCES PODEM
SE PERGUNTAR: MAS SE É ALGO QUE SE APRENDE COM A PRATICA, COMO QUEM
ESTA COMEÇANDO, APRENDE?

ASSIM COMO PETER CHEN CRIOU O MODELO DE ENTIDADE E RELACIONAMENTO, O MER,
FORAM CRIADAS FORMAS NORMAIS, QUE SAO DIRETRIZES PARA APLICAR EM
MODELAGEM DE AMBIENTES OLTP OU AMBIENTES TRANSACIONAIS DE BANCOS
DE DADOS.

HOJE TEMOS MAIS DO QUE 3 FORMAS NORMAIS, MAS AO NORMALIZARMOS UM
BANCO ATE A SUA TERCEIRA FORMA, É O SUFICIENTE PARA TER UM
TRABALHO LIMPO E LIVRE DE ERROS. VEREMOS AS TRES FORMAS NORMAIS,
UMA A UMA, DETALHADAMENTE NAS PROXIMAS AULAS.
*/

INSERT INTO CLIENTE VALUES('CARLA','F','C.LOPES@UOL.COM',45638854,'9301-7585',
'RUA COPPER LEAF - WILLIAMSBURG - KITCHENER');

SELECT SEXO, COUNT(*) AS QTD
FROM CLIENTE
GROUP BY SEXO;

/* PRIMEIRA FORMA NORMAL */

/*

1 - TODO CAMPO VETORIZADO SE TORNAR'A OUTRA TABELA

[AMARELO, AZUL, LARANJA, VERDE] -> CORES
[KA, FIESTA, UNO, CIVIC]-> CARROS

2 - TODO CAMPO MULTIVALORADO SE TORNAR'A OUTRA TABELA.
QUANDO O CAMPO FOR DIVIS'IVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE
TODO O REGISTRO COMO SENDO UNICO.
ISSO ;E O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY.


*/

/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

SHOW DATABASES; --> OPCIONAL

DROP TABLE CLIENTE;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,

	FOREIGN KEY(ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/* ENDERECO - OBRIGATORIO 
CADASTRO DE SOMENTE UM.

TELEFONE - NAO OBRIGATORIO
CADASTRO DE MAIS DE UM (OPCIONAL) /*

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

SELECT * FROM CLIENTE;

+-----------+--------+------+----------------+-------------+
| IDCLIENTE | NOME   | SEXO | EMAIL          | CPF         |
+-----------+--------+------+----------------+-------------+
|         1 | JOAO   | M    | JOAOA@IG.COM   | 76567587887 |
|         2 | CARLOS | M    | CARLOSA@IG.COM | 5464553466  |
|         3 | ANA    | F    | ANA@IG.COM     | 456545678   |
|         4 | CLARA  | F    | NULL           | 5687766856  |
|         5 | JORGE  | M    | JORGE@IG.COM   | 8756547688  |
|         6 | CELIA  | M    | JCELIA@IG.COM  | 5767876889  |
+-----------+--------+------+----------------+-------------+

DESC ENDERECO;

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ENDERECO VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);


INSERT INTO ENDERECO VALUES(NULL,'RUA ALFANDEGA','CENTRO','SAO PAULO','SP',5);

SELECT * FROM ENDERECO;

DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO TELEFONE VALUES(NULL,'RES','56576876',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','54768899',2);
INSERT INTO TELEFONE VALUES(NULL,'RES','99667587',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','66687899',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','89986668',5);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88687909',2);

SELECT * FROM TELEFONE;

/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO -> É TUDO QUE VOCE QUER VER NA TELA */

SELECT NOW() AS DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

/* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE
*/

SELECT NOME, SEXO, EMAIL /* PROJECAO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELECAO */

SELECT NUMERO /* PROJECAO */
FROM TELEFONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELECAO */

/* JUNCAO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+--------+----------------+-----------+
| NOME   | EMAIL          | IDCLIENTE |
+--------+----------------+-----------+
| JOAO   | JOAOA@IG.COM   |         1 |
| CARLOS | CARLOSA@IG.COM |         2 |
| ANA    | ANA@IG.COM     |         3 |
| CLARA  | NULL           |         4 |
| JORGE  | JORGE@IG.COM   |         5 |
| CELIA  | JCELIA@IG.COM  |         6 |
+--------+----------------+-----------+

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE, ENDERECO /*ORIGEM */
WHERE IDCLIENTE = ID_CLIENTE; /* JUNCAO */

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* WHERE = SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO 
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; 

+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+

/* WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; -> TABELA VERDADE */

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',15);

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */ 
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /*JUNCAO */
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELECAO */

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE 
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

/*
	
	DML - DATA MANIPULATION LANGUAGE
	DDL - DATA DEFINITION LANGUAGE
	DCL - DATA CONTROL LANGUAGE
	TCL - TRANSACTION CONTROL LANGUAGE

*/

/* INSERT */

INSERT INTO CLIENTE VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ENDERECO VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

SELECT * FROM CLIENTE;

/* FILTROS */

SELECT * FROM CLIENTE
WHERE SEXO = 'M';

/* UPDATE */

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 7;

UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 7;

/* DELETE */ 

INSERT INTO CLIENTE VALUES(NULL,'XXX','M',NULL,'XXX');

SELECT * FROM CLIENTE
WHERE IDCLIENTE = 8;

DELETE FROM CLIENTE WHERE IDCLIENTE = 8;

/* 
  DDL - DATA DEFINITION LANGUAGE
*/

CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PRODUTO VARCHAR(30) NOT NULL,
	PRECO INT,
	FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE */

/* ALTERANDO O NOME DE UMA COLUNA - CHANGE */

ALTER TABLE PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | NO   |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO VALOR_UNITARIO INT;

DESC PRODUTO;

+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| IDPRODUTO      | int(11)     | NO   | PRI | NULL    | auto_increment |
| NOME_PRODUTO   | varchar(30) | NO   |     | NULL    |                |
| VALOR_UNITARIO | int(11)     | YES  |     | NULL    |                |
| FRETE          | float(10,2) | NO   |     | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

/* MODIFY - ALTERANDO O TIPO */

ALTER TABLE PRODUTO
MODIFY VALOR_UNITARIO VARCHAR(50) NOT NULL;

/* ADICIONANDO COLUNAS */

ALTER TABLE PRODUTO
ADD PESO FLOAT(10,2) NOT NULL;

/* APAGANDO UMA COLUNA */

ALTER TABLE PRODUTO
DROP COLUMN PESO;

/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
AFTER NOME_PRODUTO;

ALTER TABLE PRODUTO
DROP COLUMN PESO;

ALTER TABLE PRODUTO
ADD COLUMN PESO FLOAT(10,2) NOT NULL
FIRST;

/* EXERCICIOS DML */

INSERT INTO CLIENTE VALUES(NULL,'FLAVIO','M','FLAVIO@IG.COM','4657765');
INSERT INTO CLIENTE VALUES(NULL,'ANDRE','M','ANDRE@GLOBO.COM','7687567');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','F',NULL,'0876655');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','M','KARLA@GMAIL.COM','545676778');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','M','DANIELE@GMAIL.COM','43536789');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','M',NULL,'774557887');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','M',NULL,'54376457');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','F','ANTONIO@IG.COM','12436767');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','ANTONIO@UOL.COM','3423565');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','M','ELAINE@GLOBO.COM','32567763');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','M','CARMEM@IG.COM','787832213');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','F','ADRIANA@GMAIL.COM','88556942');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','F','JOICE@GMAIL.COM','55412256');

/* CADASTRE UM ENDERECO PARA CADA CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',9);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',10);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',11);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',12);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',13);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',14);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',15);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',16);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',17);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',21);

/* CADASTRE TELEFONES PARA OS CLIENTES */


INSERT INTO TELEFONE VALUES(NULL,'RES','68976565',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99656675',9);
INSERT INTO TELEFONE VALUES(NULL,'CEL','33567765',11);
INSERT INTO TELEFONE VALUES(NULL,'CEL','88668786',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','55689654',11);
INSERT INTO TELEFONE VALUES(NULL,'COM','88687979',12);
INSERT INTO TELEFONE VALUES(NULL,'COM','88965676',13);
INSERT INTO TELEFONE VALUES(NULL,'CEL','89966809',15);
INSERT INTO TELEFONE VALUES(NULL,'COM','88679978',16);
INSERT INTO TELEFONE VALUES(NULL,'CEL','99655768',17);
INSERT INTO TELEFONE VALUES(NULL,'RES','89955665',18);
INSERT INTO TELEFONE VALUES(NULL,'RES','77455786',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','89766554',19);
INSERT INTO TELEFONE VALUES(NULL,'RES','77755785',20);
INSERT INTO TELEFONE VALUES(NULL,'COM','44522578',20);

/* RELATORIO GERAL DE TODOS OS CLIENTES */

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, e.rua, e.bairro, e.cidade, e.estado, t.tipo, t.numero
from cliente c
inner join endereco e
on idcliente = e.id_cliente
inner join telefone t
on idcliente = t.id_cliente; 

/* RELATORIO GERAL DE TODOS OS CLIENTES (TELEFONE E ENDERECO) */

DESC CLIENTE;
DESC ENDERECO;
DESC TELEFONE;

/* RELATÓRIO DOS HOMENS */

select c.idcliente, c.nome, c.sexo, c.email, c.cpf, e.rua, e.bairro, e.cidade, e.estado, t.tipo, t.numero
from cliente c
inner join endereco e
on idcliente = e.id_cliente
inner join telefone t
on idcliente = t.id_cliente
where sexo = 'M';

/* RELATÓRIO DAS MULHERES */


select c.idcliente, c.nome, c.sexo, c.email, c.cpf, e.rua, e.bairro, e.cidade, e.estado, t.tipo, t.numero
from cliente c
inner join endereco e
on idcliente = e.id_cliente
inner join telefone t
on idcliente = t.id_cliente
where sexo = 'F';

/* 12 13 18 19 */

update cliente
set sexo = 'F'
where idcliente = 12;

update cliente
set sexo = 'F'
where idcliente = 13;

update cliente
set sexo = 'F'
where idcliente = 18;

update cliente
set sexo = 'F'
where idcliente = 19;

update cliente
set sexo = 'M'
where idcliente = 16;

select * from cliente 
where idcliente
in (12,13,18,19);

update cliente
set sexo = 'F'
idcliente in (12,13,18,19);

select sexo, count(*) as quantidade
from cliente
group by sexo;

select c.idcliente, c.email
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'F'
and bairro = 'CENTRO'
and cidade = 'RIO DE JANEIRO'
and tipo in ('res', 'com');


select c.nome, c.email, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where tipo = 'Cel'
and estado = 'RJ';

select c.nome, c.email, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'F'
and estado = 'SP';

select c.nome, c.email, e.estado, t.telefone
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;


select  c.nome, 
	    ifnull(c.email, '****') as email,
	    e.estado, 
	    t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente;

select  c.nome, 
		c.sexo, 
		c.email, 
		t.tipo, t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = e.id_cliente; 


/View/

create view relatorio as 
select  c.nome, 
		c.sexo, 
		c.email, 
		t.tipo, t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente; 


select * from relatorio;

/Apagando view/

drop view relatorio;

/Inserindo um prefixo/

create view v_relatorio as 
select  c.nome, 
		c.sexo, 
		ifnull(c.email, '******') as email, 
		t.tipo, t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente; 

select nome, numero, estado, sexo 
from v_relatorio
where sexo = 'F';

/* Order by */

create table alunos(

	numero int,
	nome varchar(30)

);

insert into alunos values(1, 'João');
insert into alunos values(1, 'Maria');
insert into alunos values(2, 'Davi');
insert into alunos values(2, 'Felipe');
insert into alunos values(2, 'Gabriel');
insert into alunos values(3, 'Jorge');
insert into alunos values(1, 'Lucas');
insert into alunos values(4, 'Igor');
insert into alunos values(3, 'Letícia');
insert into alunos values(5, 'Samuel');
insert into alunos values(5, 'Augusto');
insert into alunos values(3, 'Tiago');
insert into alunos values(1, 'Anna');
insert into alunos values(4, 'Antonio');
insert into alunos values(4, 'Sofia');
insert into alunos values(3, 'Celia');
insert into alunos values(2, 'Mateus');
insert into alunos values(5, 'Ryan');

select * from alunos
order by numero;

select * from alunos
order by 1;

select * from alunos
order by 2;

select * from alunos
order by numero, nome;

select nome from alunos
order by numero, nome;

select * from alunos
order by numero asc, nome desc;



select  c.nome, 
		c.sexo, 
		ifnull(c.email, '******') as email, 
		t.tipo, t.numero, 
		e.bairro, 
		e.cidade, 
		e.estado
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
order by nome; 


/* STORED PROCIDURES */

delimiter $

create procedure nome
begin
	
	QUALQUER PROGRAMAÇÃO

end
$

create procedure nome_empresa()
begin

	select 'Universidade dos Dados' as Empresa;

end
$

call nome_empresa()$


create procedure conta()
begin

	select 10 + 10 as Conta;

end
$

drop procedure conta$

create procedure conta(n1 int, n2 int)
begin

	select n1 + n2 as Conta;

end
$

drop database comercio;
drop database exercicio;
drop database livraria;
drop database projeto;

/* PROCEDURES */

create database projeto;

create table curso(

	idcurso int primary key auto_increment,
	nome varchar(30) not null,
	horas int(3) not null,
	valor float(10,2) not null

);

insert into curso values(null, 'Java', 30, 27.90);
insert into curso values(null, 'Fundamentos de banco ded dados', 30, 32);

create view vw_cursos as
	select * from curso;

select * from vw_cursos;

create procedure show_cursos()
begin

	select * from vw_cursos;

end
$

create procedure insert_curso(p_nome varchar(30), p_horas int(3), p_valor float(10,2))
begin

	insert into curso values(null, p_nome, p_horas, p_valor);

end
$

delimiter ;

call insert_curso('Banco de dados avançado', 120, 52.90);
call insert_curso('HTML CSS', 40, 67);
call insert_curso('JavaScript', 53, 32);
call insert_curso('C#', 34, 64);
call insert_curso('Docker', 12, 58);
call insert_curso('API Rest', 8, 0);
call insert_curso('AWS partner certificate', 80, 1319.99);
call insert_curso('Arquitetura de software', 324, 424.99);
call insert_curso('Desenvolvimento de software', 286, 299.99);


call show_cursos();

/* IDS E EMAIL DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E 
NAO TENHAM CELULAR */

select c.idcliente, c.email, c.sexo, e.estado, e.bairro, t.tipo, t.numero
from cliente c
inner join endereco e
on c.idcliente = e.id_cliente
inner join telefone t
on c.idcliente = t.id_cliente
where sexo = 'F'
and bairro = 'Centro'
and estado = 'RJ'
and idcliente not in (

	select c.idcliente
	from cliente c
	inner join telefone t
	on c.idcliente = t.id_cliente
	where t.tipo = 'Cel'

);

select c.idcliente, c.nome, c.sexo, t.tipo
from cliente c
inner join telefone t
on c.idcliente = t.id_cliente
where t.tipo = 'Cel'
and sexo = 'F';

select idcliente, nome from cliente
where idcliente not in (1, 5, 3, 9, 11);

/* Constraints */

create database teste;

use teste;

create table teste(

	idteste int primary key auto_increment,
	nome varchar(30)

); 

alter table teste
add constraint pk_teste primary key(idteste);


create table teste2(

	idteste2 int primary key auto_increment,
	nome varchar(30) ,
	id_teste int

);

alter table teste2
add constraint fk_teste_teste2
foreign key(id_teste)
references teste(idteste);

show create table teste2;

alter table teste2
drop foreign key fk_teste_teste2;

drop table teste;
drop table teste2;

/* DICIONÁRIO DE DADOS */


desc TABLE_CONSTRAINTS;

select CONSTRAINT_SCHEMA as 'BANCO', TABLE_NAME as 'TABELA', CONSTRAINT_TYPE as 'TIPO', CONSTRAINT_NAME as 'NOME'
from TABLE_CONSTRAINTS
where CONSTRAINT_SCHEMA = 'teste';


/* Oficina do seu zé */

create database oficina;

use oficina;

create table cliente(

	idcliente int primary key auto_increment,
	nome varchar(30) not null,
	sexo enum('M','F') not null,
	id_carro int unique

);

create table telefone(

	idtelefone int primary key auto_increment,
	numero varchar(30) not null,
	tipo enum('Res','Com','Cel') not null,
	id_cliente int

);

create table carro(

	idcarro int primary key auto_increment,
	modelo varchar(30) not null,
	placa varchar(30) not null unique,
	id_marca int unique,

);

create table marca(

	idmarca int primary key auto_increment,
	marca varchar(30) unique,

);

create table cor(

	idcor int primary key auto_increment,
	nome varchar(30) not null

);

create table carro_cor(

	id_carro int,
	id_cor int,
	primary key(id_carro, id_cor)

);

alter table telefone
add constraint FK_TELEFONE_CLIENTE
foreign key(id_cliente) 
references cliente(idcliente);

alter table cliente
add constraint FK_CLIENTE_CARRO 
foreign key(id_carro)
references carro(idcarro);

alter table carro
add constraint FK_CARRO_MARCA
foreign key(id_marca)
references marca(idmarca);

alter table carro_cor
add constraint FK_CARRO
foreign key(id_carro)
references carro(idcarro);

alter table carro_cor
add constraint FK_COR 
foreign key(id_cor)
references cor(idcor);

/* ESTRUTURA DE UMA TRIGGER */

CREATE TRIGGER NOME
BEFORE/AFTER INSERT/DELETE/UPDATE ON TABELA
FOR EACH ROW (PARA CADA LINHA)
BEGIN -> INICIO

		QUALQUER COMANDO SQL

END -> FIM

create database triggers;

use triggers;

create table usuario(

	id int primary key auto_increment,
	nome varchar(30) not null,
	login varchar(30) not null,
	senha varchar(30) not null

);

create table bkp_usuario(

	idbackup int primary key auto_increment,
	idusuario int not null,
	nome varchar(30) not null,
	login varchar(30) not null,
	senha varchar(30) not null

);

delimiter $

create trigger bkp_usuario
before delete on usuario
for each row
begin

	insert into bkp_usuario values(null, old.id, old.nome, old.login, old.senha);

end
$

delimiter ;

insert into usuario values(null, 'Felipe Veiga', 'felipe@gmail.com', '1234');

select * from usuario;

delete from usuario where id = 1;

select * from usuario;

select * from bkp_usuario;

/* Comunicação entre bancos */

create database loja;

use loja;

create table produto(

	idproduto int primary key auto_increment,
	nome varchar(30) not null,
	valor float(10,2) not null

);

create database backup;

use backup;

create table bkp_produto(

	idbackup int primary key auto_increment,
	idproduto int,
	nome varchar(30) not null,
	valor float(10,2) not null

);

use loja;


insert into backup.bkp_produto values(null, 1000, 'Teste', 0);

select * from backup.bkp_produto;

delimiter $

create trigger backup_produto
before insert on produto
for each row
begin

	insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor);

end
$

delimiter ;

insert into produto values(null, 'Sabonete', 2.99);
insert into produto values(null, 'Carvão', 49.90);
insert into produto values(null, 'Chocolate', 6.99);
insert into produto values(null, 'Coca-cola 2L', 8.69);
insert into produto values(null, 'Nuggets 500g', 11.99);

select * from backup.bkp_produto;

delimiter $

create trigger backup_produto_delete
before delete on produto
for each row
begin

	insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor);

end
$

delimiter ;

delete from produto 
where idproduto 
in (
	select idproduto where valor > 8
);

select * from backup.bkp_produto;

drop trigger backup_produto;

delimiter $

create trigger backup_produto
after insert on produto
for each row
begin

	insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor);

end
$

insert into produto values(null, 'Paçoca', 1.99);

delimiter ;

select * from backup.bkp_produto;

alter table backup.bkp_produto
add evento char(1);

drop trigger backup_produto_delete;

delimiter $

create trigger backup_produto_delete
before delete on produto
for each row
begin

	insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor, 'D');

end
$

drop trigger backup_produto$

create trigger backup_produto
after insert on produto
for each row
begin

	insert into backup.bkp_produto values(null, new.idproduto, new.nome, new.valor, 'I');

end
$

delimiter ;

insert into produto values(null, 'teste', 10.00);

delete from produto where idproduto = 2;

/* Trigger de auditoria */

drop database loja;
drop database backup;

create database loja;

use loja;

create table produto(

	idproduto int primary key auto_increment,
	nome varchar(30) not null,
	valor float(10,2) not null

);

insert into produto values(null, 'Sabonete', 2.99);
insert into produto values(null, 'Carvão', 49.90);
insert into produto values(null, 'Chocolate', 6.99);
insert into produto values(null, 'Coca-cola 2L', 8.69);
insert into produto values(null, 'Nuggets 500g', 11.99);

/* Quando */
select now();

/* Quem */
select current_user();

create database backup;

use backup;

create table bkp_produto(

	idbackup int primary key auto_increment,
	idproduto int not null,
	nome varchar(30) not null,
	valor_original float(10,2) not null,
	valor_alterado float(10,2) not null,
	data datetime,
	usuario varchar(30),
	evento char(1)

);

use loja;


delimiter $

create trigger backup_produto
after update on produto
for each row
begin

	insert into backup.bkp_produto values(null, old.idproduto, old.nome, old.valor, new.valor, now(), current_user(), 'U');

end
$

delimiter ;

update produto
set valor = 3.99
where idproduto = 1;

select * from backup.bkp_produto;

create database teste002;

use teste002;

create table curso(

	idcurso int primary key auto_increment,
	nome varchar(30) not null,
	horas int(3) not null,
	valor float(20,2) not null,
	id_prereq int

);

alter table curso
add constraint fk_prereq
foreign key(id_prereq)
references curso(idcurso);

insert into curso values(null, 'BD do básico ao avançado', 58, 27.90, null);
insert into curso values(null, 'Análise de Dados', 58, 27.90, 1);
insert into curso values(null, 'Big Data', 58, 27.90, 2);
insert into curso values(null, 'Fundamentos da programação', 58, 27.90, null);

select nome, valor, horas, ifnull(id_prereq, 'Sem requisitos')
from curso;

select c.nome, c.valor, c.horas, ifnull(req.id_prereq, 'Sem requisitos') as 'Prereq'
from curso c 
left join curso req
on req.idcurso = c.id_prereq;

/* Cursores */

create database cursores;

use cursores;

create table vendedor(

	idvendedor int primary key auto_increment,
	nome varchar(50),
	jan int,
	fev int,
	mar int

);

insert into vendedor values(null, 'João', 3111, 4567, 2890);
insert into vendedor values(null, 'Cleber', 8203, 3476, 1245);
insert into vendedor values(null, 'Diana', 6548, 6580, 2384);
insert into vendedor values(null, 'Otávio', 2904, 4985, 3496);
insert into vendedor values(null, 'jonas', 9067, 3492, 2305);

select nome, (jan+fev+mar) as 'Total' from vendedor;

select nome, (jan+fev+mar)/3 as 'Média' from vendedor;

create table vend_total(

	nome varchar(50),
	jan int,
	fev int,
	mar int, 
	total int,
	media int

);

delimiter $

create procedure inseredados()
begin

	declare fim int default 0;
	declare var1, var2, var3, vtotal, vmedia int;
	declare vnome varchar(50);

	declare reg cursor for(
		select nome, jan, fev, mar from vendedor
		);

	declare continue handler for not found set fim = 1;

	open reg;

	repeat 

		feach reg into vnome, var1, var2, var3;
		if not fim then

			set vtotal = var1+var2+var3;
			set vmedia = vtotal/3;

			insert into vend_total values(vnome, var1, var2, var3, vtotal, vmedia);

		end if;
		
	until fim end repeat;

	close reg;
end
$

delimiter ;

call inseredados();

select * from vend_total;

/* 

Segunda forma normal: O campo não chave que depende da totalidade(das chaves primárias) fica na tabela.

Terceira forma normal: O campo não chave que não depende da totalidade(das chaves primárias) e depende de
outro campo não chave, vira outra tabela.

*/

create database consultorio;

use consultorio;

create table paciente(

	idpaciente int primary key auto_increment,
	nome varchar(30) not null,
	sexo char(1) not null,
	email varchar(30) not null,
	nascimento date not null

);

create table medico(

	idmedico int primary key auto_increment,
	nome varchar(30) not null,
	sexo char(1) not null,
	especialidade varchar(30) not null,
	funcionario enum('S','N') not null

);

create table hospital(

	idhospital int primary key auto_increment,
	nome varchar(30) not null,
	bairro varchar(30) not null,
	cidade varchar(30) not null,
	estado char(2) not null

);

create table consulta(

	idconsulta int primary key auto_increment,
	id_paciente int,
	id_medico int,
	id_hospital int,
	data datetime not null,
	diagnostico varchar(255)

);

create table internacao(

	idinternacao int primary key auto_increment,
	quarto int not null,
	entrada datetime not null,
	saida datetime not null,
	observacoes varchar(255),
	id_consulta int unique

);

alter table consulta
add constraint FK_CONSULTA_PACIENTE
foreign key(id_paciente)
references paciente(idpaciente);

alter table consulta
add constraint FK_CONSULTA_MEDICO
foreign key(id_medico)
references medico(idmedico);

alter table consulta
add constraint FK_CONSULTA_HOSPITAL
foreign key(id_hospital)
references hospital(idhospital);

alter table internacao
add constraint FK_INTERNACAO_CONSULTA
foreign key(id_consulta)
references consulta(idconsulta);