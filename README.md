# CMJP Parser

**Weekend, hackaton project. Use at your own risk. No test coverage.**

**Developed during the [Open Data Day 2016](http://opendataday.org), in João Pessoa, Brazil**

Scraper and parser for João Pessoas's City Council (Câmara Municipal de João Pessoa).

* João Pessoa's City Council webiste: http://cmjp.pb.gov.br/
* Information system, from where we scrap the data: http://177.200.32.195:9673/sapl/default_index_html

## Features

### Scraps and parses all petitions from councilors

We scrap all petitions and group them by councilors.

Source: http://177.200.32.195:9673/sapl/relatorios_administrativos/resumoPropositurasAutor/resumoPropositurasAutor_index_html

### Automatic petitions classification based on keywords

On `models/proposal` we define categories and regular expressions to be matched against the petition's titles.

## Vocabulary (for pt-BR users)

* Vereadores: councilors
* Proposituras: petitions
* Requerimentos (um tipo específico de propositura): requests

## Usage

Check the `examples` folder.

## Credits

* Fernando Brito ([GitHub](https://github.com/fernandobrito))
* David Guilherme ([GitHub](https://github.com/davidguilherme))
* Jaelson Carvalho ([GitHub](https://github.com/jcarva))
