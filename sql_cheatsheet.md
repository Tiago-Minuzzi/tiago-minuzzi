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
            id int,
            nome varchar(100)
            );
        SHOW TABLES;
    ~~~
    
- Inserir dados na tabela

    ```sql
        INSERT INTO exemplo (id, nome) values (1, 'Ana');
        SELECT * FROM exemplo;
    ```
    
- Selecionar valores únicos de uma coluna

    ```sql
        SELECT DISTINCT <COLUNA> FROM <TABELA>
    ```
    
## Rodar conteiner MySQL

`docker run -d --name mysql-container -e MYSQL_ROOT_PASSWORD=my-secret-pw mysql:latest`

`docker exec -it <CONT_ID> mysql -p`
