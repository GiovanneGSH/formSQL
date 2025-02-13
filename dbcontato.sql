-- apagar o banco de dados

drop database dbContato;

-- criar o banco de dados

create database dbContato;

--acessar o banco de dados

use dbContato;

--criar as tabelas

create table tbFormulario(
idForm int not null auto_increment,
nome varchar(100) not null,
email varchar(100) not null,
telCel char(10) not null,
mensagem text not null,
primary key(idForm));

--visualizaar a estrutura da tabela

desc tbFormulario;

--inserir registros nas tabelas do db

insert into tbFormulario(nome, email, telCel, mensagem)
	values('Giovanne Silveira','giovannegsh@gmail.com','94513-8385','Estou com problemas no SQL');

--visualizando os registros das tabelas

select * from tbFormulario;

--alterando o registro das tabelas

update tbFormulario set nome = 'Lima Batista', email = 'limabatista@gmail.com', telCel = '94387-1205', mensagem = 'Nova mensagem.' where idForm = 1;

--visualizando os registros das tabelas

select * from tbFormulario;

--excluindo registros das tabelas 

delete from tbFormulario where idForm = 1;

select * from tbFormulario;




