### 1. Definindo o Número Mínimo de Dias (`-m`)

A flag `-m` define o número mínimo de dias que um usuário deve esperar antes de mudar sua senha novamente. Por exemplo, se você quiser que o usuário `maria` espere pelo menos 7 dias após a última mudança de senha:

```bash
sudo chage -m 7 maria
```

### 2. Definindo o Número Máximo de Dias (`-M`)

Esta flag define o número máximo de dias que a senha é válida. Para forçar que o usuário `joao` mude a senha a cada 90 dias:

```bash
sudo chage -M 90 joao
```

### 3. Aviso Antes da Expiração (`-W`)

A flag `-W` define quantos dias antes da expiração da senha o usuário será avisado. Se você quiser que `pedro` receba um aviso 10 dias antes de sua senha expirar:

```bash
sudo chage -W 10 pedro
```

### 4. Dias de Inatividade Após Expiração (`-I`)

Essa flag define quantos dias de inatividade devem ser permitidos após a expiração da senha antes que a conta seja desativada. Se você quiser que `lucas` tenha 5 dias de inatividade após a expiração da senha antes que sua conta seja bloqueada:

```bash
sudo chage -I 5 lucas
```

### 5. Data da Última Mudança de Senha (`-d`)

Define a data da última mudança de senha. Por exemplo, para o usuário `ana`:

```bash
sudo chage -d 2024-01-01 ana
```
