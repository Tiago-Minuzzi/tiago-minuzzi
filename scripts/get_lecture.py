#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup as soup
from pprint import pprint
page = requests.get("http://www.ufrgs.br/ppgbm/noticias/")
sp = soup(page.content, "html.parser")
page_info = sp.find_all('div', class_='content')
page_link = sp.find_all('section', class_='seminarios-defesas')

for info in page_info[0:5]:
    # Get info data and type of lecture
    title = info.find(class_='title').get_text().strip()
    data, ttl = title.split('–')
    data = data.strip()
    ttl = ttl.strip()
    # Get name and description
    excerpt = info.find(class_='excerpt').get_text().strip()
    name, lect = excerpt.split('\n')
    name = name.strip()
    lect = lect.strip()
    # Print info
    print(ttl)
    print(f'Data: {data}')
    print(name)
    print(f'Tema: {lect}'+'\n')

#for teste in page_link:
#    links = [link['href'] for link in teste.find_all('a',href=True)]
#print(links[0:5])
