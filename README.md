## Especificações das Funcionalidades

- Automatize a inserção de dados fictícios para uso em ambiente de desenvolvimento. :ok
- Implemente um endpoint para listar *cursos*. Permitindo filtrar pelo nome da universidade, kind, level e/ou shift.
- Implemente um endpoint que permita listar e filtrar *ofertas*. Permitindo filtrar pelo nome da universidade, nome do curso, kind, level, shift e/ou cidade. Além disso, deve ter a possibilidade de ordernar por menor e maior preço com desconto.
- O formato de retorno dos dados é JSON.

## Critérios de Avaliação

- Legibilidade
- Arquitetura e design da aplicação
- Performance
- Facilidade de evolução e manutenção da aplicação
- Testes automatizados
- Documentação

## Exemplo de Dados

Você pode visualizar o retorno esperado para o endpoint de ofertas no arquivo [db.json](db.json), anexo a este desafio.

A estrutura do JSON de ofertas é a seguinte:
```
  {
    "full_price": float,
    "price_with_discount": float,
    "discount_percentage": float,
    "start_date": string,
    "enrollment_semester": string,
    "enabled": boolean,
    "course": {
      "name": string,
      "kind": string,
      "level": string,
      "shift": string
    },
    "university": {
      "name": string,
      "score": float,
      "logo_url": string
    },
    "campus": {
      "name": string,
      "city": string
    }
  }
```
A estrutura do JSON de cursos é a seguinte:

```
  {
    "course": {
      "name": string,
      "kind": string,
      "level": string,
      "shift": string
      "university": {
        "name": string,
        "score": float,
        "logo_url": string
      },
      "campus": {
        "name": string,
        "city": string
      }
    }
  }
```

## Instruções para entrega do projeto

* Desenvolva e versione esse projeto utilizado git.
* Utilize o serviço de hospedagem de código de sua preferência: github, bitbucket, gitlab ou outro.
* Crie um README com instruções claras sobre como executar seu projeto.

## Bônus

- Implementar autenticação da API usando JWT
- Implementar cache nos endpoints
- Disponibilizar sua aplicação online utilizando um serviço de sua preferência, como Heroku ou AWS, por exemplo
