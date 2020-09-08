# CadProdEx

Objetivo:

Cadstro Simples de produtos, desenvolvido em Elixir e integrando os repositórios de dados MongoDB para armazenamento dos dados.
Redis como um "cache" dos dados para evitar consultas constantes ao MongoDB e Elasticsearch como repositório de logs de alterações.

Index busca os produtos no Elastisearch.
New e Edit salva os dados no MongoDB, Elastisearch e Redis, nessa ordem.
Show busca dos dados no Redis, caso não exista, busca no MongoDB e salva no Redis.

Requisitos:
Elixir
MongoDB
Redis
Elasticserch


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000/products) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
