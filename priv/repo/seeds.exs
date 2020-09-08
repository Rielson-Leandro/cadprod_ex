# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CadProdEx.Repo.insert!(%CadProdEx.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

names = ~w(Notebook Computador Geladeira Celular PlayStation)
descripions = ["Melhor Notebook de Todos", "Melhor Computador de Todos", "Melhor Geladeira de Todas", "Melhor Celular de Todos", "Melhor PlayStation de Todos"]
skus = ~w(10000 10001 10002 10003 10004)
eans = ~w(789098232 7890982321 7890982322 7890982323 7890982325 )

for {{name, username}, password} <- name |> Enum.zip(usernames) |> Enum.zip(passwords) do
  Repo.insert!(%User{
    name: name, 
    username: username, 
    password: password
  })
end