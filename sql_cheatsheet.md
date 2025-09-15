# SQL cheat sheet

## Comandos básicos SQL

- Mostrar as databases existentes
    
    ```sql
        SHOW databases;
    ```
    
- Criar banco de dados e usá-lo

    ```sql
        CREATE DATABASE aula;
        USE aula;
    ```
    
- Verificar em qual banco de dados se está conectado

    ```sql
        SELECT database();
    ```
    
- Criar tabela na base de dados e mostrar tabela

    ~~~sql
        CREATE TABLE exemplo (
            id int, --usar "auto_increment" para automatizar o campo
            nome varchar(100)
            );
        SHOW TABLES;
    ~~~
    
- Criar tabela com restrições

    ```sql
        --"primary key" estabelece a chave primária; "unique" não permite repetições.
        CREATE TABLE cidade (
            id int primary key,
            nome varchar(100),
            sigla char(03) unique
        );
    ```
    
- Tabela com chave estrangeira

    ```sql
        CREATE TABLE cliente (
            id int primary key,
            nome varchar(100),
            idcidade int,
            constraint fkclienteCidade foreign key (idcidade) references cidade(id)
        );
    ```
    
- Tabela com restrições e valores default
    
    ```sql
        CREATE TABLE aluno (
            id int primary key,
            nome varchar(130) not null, --chave não pode ser nula
            genero char(01), --chave com apenas um caracter
            estadoCivil char(01) check (estadoCivil in ('S', 'C', 'V')), --precisa ser um dos 3 valores
            renda decimal(10,2) default 0
        );
    ```
    
- Inserir dados na tabela

    ```sql
        INSERT INTO exemplo (id, nome) values (1, 'Ana');
        SELECT * FROM exemplo;
    ```
    
- Selecionar valores únicos de uma coluna

    ```sql
        SELECT DISTINCT <COLUNA> FROM <TABELA>;
    ```
    
- Alterações em uma tabela (_add_, _modify_, _change_, _drop_)

    ```sql
        ALTER TABLE cidade ADD dddd char(05);
        ALTER TABLE cidade CHANGE dddd ddd char(05);
        ALTER TABLE cidade MODIFY ddd char(03);
        ALTER TABLE cidade DROP <CAMPO>;
    ```
    

- Ordernar tabela por um campo

  ```sql
    SELECT * FROM <TABELA> ORDER BY <CAMPO>;
    SELECT * FROM <TABELA> ORDER BY <CAMPO> desc; --"desc" é em ordem descendente
  ```
```
  ```

## Rodar conteiner MySQL

`docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql:latest`

`docker exec -it <CONT_ID> mysql -p`
