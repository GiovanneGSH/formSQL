drop database dbCadastro;

create database dbCadastro;

use dbCadastro;

create table tbUsuario(
idUsu int not null auto_increment,
email varchar(100) not null,
senha varchar(15) not null
);

create table tbAluno(
idAlu int not null auto_increment,
nome varchar(100) not null,
nomeSocial varchar(100),
cpf char(11) not null unique,
dataDeNascimento date not null,
sexo varchar(1) not null default 'F' check(sexo in('F','M')),
nomeDaMae(100)
);

create table tbDocumento(
idDoc int not null auto_increment,
tipoDocumento varchar(50) not null,
numeroDocumento varchar(50) not null,
orgaoEmissor varchar(50) not null,
estadoEmissor varchar(2) not null
);

create table tbEndereco(
idEnd int not null auto_increment,
cep char(8) not null,
nomeRua varchar(200) not null,
bairro varchar(100) not null,
numero varchar(10) not null,
estado varchar(50) not null,
cidade varchar(50) not null,
complemento varchar(50)
);

create table tbContato(
idCon int not null auto_increment,
telRes char(10),
telCom char(10),
telCel char(10) not null
);

