# Rails Base Project

Esse projeto serve de base para criação de novos projetos de API em Ruby on Rails.

## Configurando o ambiente

Para gerenciar a versão do Ruby e isolar as Gems do projeto utilizamos por padrão o [RVM](https://rvm.io/).

A versão do Ruby utilizada como base para esse projeto é a versão 2.7.2 e o Rails a versão 6.1.

Instale o Ruby utilizando o RVM.

```
rvm install 2.7.2
```

Cria um gemset para instalar as Gems do projeto

```
rvm gemset create nome_do_gemset
```

Garanta que estará na versão correta do ruby e dentro do gemset que você criou.

```
rvm use 2.7.2@nome_do_gemset
```

Dentro da pasta do projeto, instale as gems

```
bundle install
```

### Postgres

Por padrão o banco de dados utilizado no projeto é o PostgresSQL. Tenha ele instalado na máquina.

### Iniciando o projeto

O primeiro passo é criação do banco de dados. Verifique no arquivo database.yml se as informações para conexão estão corretas.

```
rails db:create
```

Com o banco criado, vamos iniciar a aplicação.

```
rails s
```

Para verificar se está tudo certo, acesse:

```
localhost:3000/healthcheck
```

Deve aparecer JSON com o nome do projeto e a data atual.

## Desafio

A idéia é criar uma RestAPI com as operações básica de um CRUD.

Como sugestão podemos criar um cadastro de pessoas.

Campos

| Nome     | Tipo    | É obrigatório |
| -------- | ------- | ------------- |
| name     | string  | sim           |
| cpf      | string  | sim           |
| email    | string  | não           |
| address  | string  | não           |
| birthday | date    | não           |
| active   | boolean | sim           |
