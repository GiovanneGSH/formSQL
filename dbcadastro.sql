drop database dbCadastro;

create database dbCadastro;

use dbCadastro;

create table tbUsuarios(
idUsu int not null auto_increment,
email varchar(100) not null,
senha char(15) not null,
primary key(idUsu));

create table tbAlunos(
idAlu int not null auto_increment,
nome varchar(100) not null,
nomeSocial varchar(100),
cpf char(14) not null unique,
dataDeNascimento date not null,
sexo varchar(1) not null default 'F' check(sexo in('F','M')),
nomeDaMae varchar(100),
idUsu int not null,
primary key(idAlu),
foreign key(idUsu) references tbUsuarios(idUsu));

create table tbDocumentos(
idDoc int not null auto_increment,
tipoDocumento varchar(50) not null,
numeroDocumento varchar(50) not null unique,
orgaoEmissor varchar(50) not null,
estadoEmissor char(2) not null,
idUsu int not null,
idAlu int not null,
primary key(idDoc),
foreign key(idUsu) references tbUsuarios(idUsu),
foreign key(idAlu) references tbAlunos(idAlu));

create table tbEnderecos(
idEnd int not null auto_increment,
cep char(8) not null,
nomeRua varchar(200) not null,
bairro varchar(100) not null,
numero varchar(10) not null,
estado varchar(50) not null,
cidade varchar(50) not null,
complemento varchar(50),
idUsu int not null,
idAlu int not null,
idDoc int not null,
primary key(idEnd),
foreign key(idUsu) references tbUsuarios(idUsu),
foreign key(idAlu) references tbAlunos(idAlu),
foreign key(idDoc) references tbDocumentos(idDoc));

create table tbContatos(
idCon int not null auto_increment,
telRes char(10),
telCom char(10),
telCel char(10) not null,
idUsu int not null,
idAlu int not null,
idDoc int not null,
idEnd int not null,
primary key(idCon),
foreign key(idUsu) references tbUsuarios(idUsu),
foreign key(idAlu) references tbAlunos(idAlu),
foreign key(idDoc) references tbDocumentos(idDoc),
foreign key(idEnd) references tbEnderecos(idEnd));


--VENDO AS ESTRUTURAS DAS TABELAS


desc tbUsuarios;	
desc tbAlunos;
desc tbDocumentos;
desc tbEnderecos;
desc tbContatos;


--INSERINDO DADDOS NAS TABELAS


--INSERT TABELA USUÁRIOS


insert into tbUsuarios(email, senha) values ('jorgeben@gmail.com', '123@456');

insert into tbUsuarios(email, senha) values ('gilbertogil@hotmail.com', '987@654');

select * from tbUsuarios;


--INSERT TABELA ALUNOS


insert into tbAlunos(nome, cpf, dataDeNascimento, sexo, nomeDaMae, idUsu) values ('Jorge Ben Jor', '135.453.586-08', '1939-03-22', 'M', 'Silvia Saint Ben Lima', 1);

insert into tbAlunos(nome, cpf, dataDeNascimento, sexo, nomeDaMae, idUsu) values ('Gilberto Gil', '987.324.789-01', '1942-06-26', 'M', 'Claudina Passos Gil Moreira', 2);

select * from tbAlunos;


--INSERT TABELA DOCUMENTOS


insert into tbDocumentos(tipoDocumento, numeroDocumento, orgaoEmissor, estadoEmissor, idUsu, idAlu) values ('RG', '18.536.344-7', 'SSP', 'SP', 1, 1);

insert into tbDocumentos(tipoDocumento, numeroDocumento, orgaoEmissor, estadoEmissor, idUsu, idAlu) values ('CNH', '001.234.567.89', 'Detran', 'SP', 2, 2);

select * from tbDocumentos;


--INSERT TABELA ENDEREÇOS


insert into tbEnderecos(cep, nomeRua, bairro, numero, estado, cidade, idUsu, idAlu, idDoc) values ('08809-030', 'Rua do Café', 'Vila Industrial', '746', 'São Paulo', 'São Paulo', 1, 1, 1);

insert into tbEnderecos(cep, nomeRua, bairro, numero, estado, cidade, complemento, idUsu, idAlu, idDoc) values ('09275-050', 'Rua do Samba', 'Vila da Barra', '435', 'Bahia', 'Salvador', 'Apto 71', 2, 2, 2);

select * from tbEnderecos;


--INSERT TABELA CONTATOS


insert into tbContatos(telRes, telCel, idUsu, idAlu, idDoc, idEnd) values ('8838-7812', '9378-1273', 1, 1, 1, 1);

insert into tbContatos(telRes, telCom, telCel, idUsu, idAlu, idDoc, idEnd) values ('6345-7128', '1547-6328', '3217-2348', 2, 2, 2, 2);

select * from tbContatos;


--LENDO AS TABELAS


select * from tbUsuarios;

select * from tbAlunos;

select * from tbDocumentos;

select * from tbEnderecos;

select * from tbContatos;


--UPDATE NA TABELA USUÁRIO


select * from tbUsuarios;

update tbUsuarios set senha = 'surfistadeTR3M' where idUsu = 1;

select * from tbUsuarios;


--UPDATE NA TABELA ALUNOS


select * from tbAlunos;

update tbAlunos set nome = 'Jorge Ben' where idAlu = 1;

select * from tbAlunos;


--UPDATE NA TABELA DOCUMENTOS


select * from tbDocumentos;

update tbDocumentos set tipoDocumento = 'RG' where idDoc = 2;

update tbDocumentos set numeroDocumento = '94.346.177-5' where idDoc = 2;

update tbDocumentos set orgaoEmissor = 'SSP' where idDoc = 2;

select * from tbDocumentos;


--UPDATE NA TABELA ENDEREÇOS


select * from tbEnderecos;

update tbEnderecos set nomeRua = 'Av.Adolfo Pinheiro' where idEnd = 1;

update tbEnderecos set bairro = 'Santo Amaro' where idEnd = 1;

update tbEnderecos set numero = '1340' where idEnd = 1;

select * from tbEnderecos;


--UPDATE NA TABELA CONTATOS


select * from tbContatos;

update tbContatos set telCel = '4579-1765' where idCon = 2;

select * from tbContatos;
