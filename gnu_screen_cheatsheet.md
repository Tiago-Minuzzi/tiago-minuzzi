# GNU Screen cheatsheet

    Por Tiago Minuzzi

## Observações

- Comandos iniciando com `screen` são feitos fora da sessão.

- O comando `ctrl+a` é o modificador principal de dentro de uma sessão.

- Quando se tem o `+` significa que se deve manter pressionada a primeira e apertar a outra, como no caso do modificador principal.

- Um comando como, por exemplo, `ctrl+a, D`, significa: manter pressionado `ctrl` e pressionar `a`, soltar ambos, e em seguida, pressionar `D`.

- Atenção à capitalização (maiúsculas/minúsculas) das letras.

## Comandos

### Básico de manejo de sessão

- `screen -S meuExemplo`: criar sessão com nome.

- `screen -S meuExemplo -t janela`: criar sessão com nome e com nome para janela.    

- `ctrl+a` , `"`: visualizar janelas abertas enquanto dentro da sessão do screen.

- `ctrl+a`, `D`: sair da sessão sem fechá-la (deattach).

- `screen -ls`: listar sessões.

- `screen -r`: retornar à sessão.

- `screen -r meuExemplo` ou `screen -r 123`: retornar a sessão usando nome ou ID da sessão.

### Movimentação e relacionados

- `ctrl+a`, `Esc` ou `ctrl+a`, `[`: Entrar no modo _scrolling_ (comportamento como do mouse) com o teclado.

- Movimentando-se no modo _scrolling_:
  
  - `h` ou `seta esquerda`: movimento para a esquerda.
  
  - `l` ou `seta direita`: movimento para a direita.
  
  - `j` ou `seta baixo`: movimento para a baixo.
  
  - `k` ou `seta cima`: movimento para cima.
  
  - `ctrl+u` : meia tela para cima.
  
  - `ctrl+d` : meia tela para baixo.
  
  - `ctrl+b` : uma tela inteira para cima.
  
  - `ctrl+f` : uma tela inteira para baixo.

- `Esc`: sair do modo _scrolling_ 

- Selecionar texto para copiar enquanto no modo _scrolling_
  
  - ir até a palavra/linha desejada e pressionar `space`;
  
  - usando as setas ou `hjkl` ir até a posição final e pressionar `space` novamente (sai do modo _scrolling_ com o conteúdo copiado).

- `ctrl+a`, `]`: colar texto selecionado.

### Criando _split_ screens

- `ctrl+a`, `|`: cria uma janela à direita da atual dividindo a tela.

- `ctrl+a`, `S`: cria uma janela abaixo da atual dividindo a tela.
  
  

  __Observação:__ ambos os comandos acima criam uma divisão "vazia", _i.e._, sem um shell.



- `ctrl+a`, `Tab`: mover-se para outro _split_.

- `ctrl+a`, `c`: abrir um shell no novo _split_.

- `ctrl+a`, `X`: "matar" o _split_ atual.

- `ctrl+a`, `Q`: "matar" todos _splits_ __exceto__ o atual.


