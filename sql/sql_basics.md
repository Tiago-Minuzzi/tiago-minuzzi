# SQL/MariaDB basics

---

## Criar usuário
```
sudo mariadb-admin -u root password foo
```

Se for MySQL:

```
sudo mysqladmin -u root password foo
```

Obs: substituir `foo` pelo password desejado.

---

## Databases

### Mostrar database

```sql
SHOW DATABASES;
```

### Selecionar database

```sql
USE mydb;
```

Onde `mydb` é o nome da database desejada(s).

### Criar database

```sql
CREATE DATABASE mydb;
```

---

## Tabelas

### Mostar tabelas
```sql
SHOW TABLES;
```

### Criar tabela

```sql
CREATE TABLE tabela	(coluna1 TIPO,
					 coluna2 TIPO,
					 coluna3 TIPO,
					);		
```

É possível adicionar mais informações sobre o tipo, valores default etc ao criar a tabela. Exemplo:

```sql
CREATE TABLE tabela	(coluna1 TEXT NOT NULL,
					 coluna2 INTEGER NOT NULL DEFAULT 0,
					 coluna3 DECIMAL(4,4) DEFAULT 1.0,
					);
```

### Mostrar tabela específica

```sql
SELECT * FROM tabela;
```

O asterisco significa todas as colunas. Pode ser substituido pelo nome da(s) coluna(s) desejadas. Exemplo:

```sql
SELECT col1, col2 FROM tabela;	
```

### Verificar colunas da tabela

```sql
DESCRIBE tabela;
```

### Mostrar o número de linhas

```sql
SELECT COUNT(*) FROM tabela;
```

### Criar tabela a partir de arquivo CSV

Antes de importar os dados, deve-se criar a tabela com as colunas correspondentes.

```sql
LOAD DATA LOCAL INFILE '/path/to/file.csv' INTO TABLE tabela FIELDS TERMINATED BY ',';
```

O uso de `LOCAL` é para caso não haja permissão de administrador, caso contrário, não há necessidade de usá-lo.

Para ignorar o header, adicionar `IGNORE 1 LINES`:

```sql
LOAD DATA LOCAL INFILE '/path/to/file.csv' INTO TABLE tabela FIELDS TERMINATED BY ',' IGNORE 1 LINES;
```

Para importar dados de arquivos TSV, apenas suprimir o comando `TERMINATED BY`.

---

## Tipos de dados

### Tipos numéricos

- INT ou INTEGER: Números inteiros.
- BIGINT: Inteiros maiores.
- SMALLINT: Inteiros menores.
- NUMERIC ou DECIMAL: Números de ponto fixo (precisão exata).
- FLOAT: Números de ponto flutuante de precisão simples.
- DOUBLE ou REAL: Números de ponto flutuante de dupla precisão.

### Tipos de texto

- CHAR(n): Strings de tamanho fixo, onde n é o número de caracteres.
- VARCHAR(n): Strings de tamanho variável, onde n é o número máximo de caracteres.
- TEXT: Strings de tamanho variável sem limite máximo específico.

### Tipos de data e hora

- DATE: Data.
- TIME: Hora do dia.
- DATETIME ou TIMESTAMP: Data e hora combinadas.

### Tipos booleanos

- BOOLEAN ou BOOL: Valores verdadeiro ou falso.

### Tipos binários

- BINARY(n): Dados binários de tamanho fixo.
- VARBINARY(n): Dados binários de tamanho variável.
- BLOB: Dados binários de tamanho variável, frequentemente usado para armazenar conteúdo binário grande.

### Tipos de enumeração e conjunto

- ENUM: Um conjunto de valores pré-definidos.
- SET: Uma coleção de valores pré-definidos.

### Tipos JSON

- JSON: Armazena dados em formato JSON.
- JSONB: Armazena dados em formato JSON otimizado para consulta.

### Outros tipos especiais:

- UUID: Identificador único universal.
- XML: Armazena dados em formato XML.
