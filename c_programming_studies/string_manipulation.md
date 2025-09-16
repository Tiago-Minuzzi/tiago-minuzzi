# Manipulação de strings em C

| Evite         | Use                         |
| ------------- | --------------------------- |
| `gets()`      | `fgets()`                   |
| `strcpy()`    | `strncpy()` / `strlcpy()`   |
| `strcat()`    | `strncat()` / `strlcat()`   |
| `sprintf()`   | `snprintf()`                |
| `scanf("%s")` | `fgets()` ou `scanf("%Ns")` |
| `strtok()`    | `strtok_r()`                |

