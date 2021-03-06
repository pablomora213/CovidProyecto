# W5-ETL-Project_Pablo



![Covid](https://c.tenor.com/ok5e0hJqBFQAAAAd/coronavirus-sad.gif)


## Objetivo:

El objetivo de este proyecto es conseguir informacion de 3 fuentes distintas mediante distintos métodos (Scraping, selenium, apis y descarga de CSVs) con el fin de meterla en SQL para poder tratarla y conseguir distintas conclusiones.



## DOCUMENTOS:

La información la he sacado de los siguientes enlaces aunque las tablas las he limpiado a mi medida dejando los datos que iba a necesitar. Están alojadas en la carpeta "data".

- [deaths](https://www.kaggle.com/dhruvildave/covid19-deaths-dataset)

- [HappinessAlcoholConsumption](https://www.kaggle.com/marcospessotto/happiness-and-alcohol-consumption)

- [medallas](https://es.wikipedia.org/wiki/Anexo:Medallero_hist%C3%B3rico_de_los_Juegos_Ol%C3%ADmpicos_de_verano)

- [poblacion](https://www.populationpyramid.net/es/poblaci%C3%B3n-por-pais/2020/)


El documento scraping se trata de un jupyter con el que he conseguido la información. 
Covid_sql es un jupyter con el que he generado el dataframe, las tablas y he cargado los csv al sql.
El jupyter Covid_mongo se trata de subir los csv a mongo y la realización de una query.
CovidUniqueData es un documento con el que hago un dataframe de un set de los países que hay en los distintos CSVs para relacionarlos todos en SQL.
CovidJupy es como he tratado los datos para poder manejarlos y relacionarlos como cambiar la sintaxis de los nombres de los países para que coincidiesen. 
Por último, SQLcoviddata es un archivo de visual code en donde está el SQL de los CSVs relacionados. 

## LIBRERÍAS IMPORTADAS (technology stack):

import requests as req
from bs4 import BeautifulSoup as bs
import pandas as pd
import json
import selenium
from selenium import webdriver
import os
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
import time.

- [requests](https://docs.python-requests.org/en/latest/) as req
- [BeautifulSoup](https://github.com/python/typeshed) as bs
- [selenium](https://www.selenium.dev/documentation/)
- [pandas](https://pandas.pydata.org/) as pd
- [numpy](https://numpy.org/) as np

- [Translator](https://github.com/ssut/py-googletrans)


