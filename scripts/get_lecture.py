#!/usr/bin/env python3

import requests
from bs4 import BeautifulSoup as soup
from pprint import pprint
page = requests.get("http://www.ufrgs.br/ppgbm/noticias/")
sp = soup(page.content, "html.parser")
page_info = sp.find_all('div', class_='content')
page_link = sp.find_all('section', class_='seminarios-defesas')
#print(page_info[0].find(class_='title').get_text())
#print(page_info[0].find(class_='excerpt').get_text())
for info in page_info:

for teste in page_link:
    links = [link['href'] for link in teste.find_all('a',href=True)]
print(links[0:5])
