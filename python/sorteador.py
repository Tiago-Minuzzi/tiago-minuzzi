import random
from collections import Counter

print('### Digite FIM para terminar de adicionar ###')

lista_de_itens = []
try:
    rodadas = int(input('- Digite o número de rodadas desejadas: '))
except ValueError:
    print('Valor inválido. Por favor, digite um número inteiro.')
    exit()

while True:
    item = input('- Digite o item: ')
    if item=='FIM':
        break
    lista_de_itens.append(item)

itens = set(lista_de_itens)

escolhas = []
try:
    for n in range(rodadas):
        escolha = random.choice(list(itens))
        escolhas.append(escolha)

    print('\n- Sorteando...\n')
    contador = Counter(escolhas).most_common()

    for n, (i, j) in enumerate(contador):
        n+=1
        print(f'{n}. {i}: {j}')
except IndexError:
    print('>>> Nehum valor adicionado na lista.')

