use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cadProd_ex, CadProdExWeb.Endpoint,
http: [port: 4001],
server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :cadProd_ex, CadProdEx.Repo,
database: "cad_prod_test",
hostname: "localhost",
pool: DBConnection.Poolboy,
min_pool_size: 10,
max_pool_size: 20


config :tirexs, :uri, "http://127.0.0.1:9200"

config :cadProd_ex, CadProdEx.Redis.Client,
  hostname: "redis://localhost:6379/1"

config :cadProd_ex, CadProdEx.Product.Elastic,
  index_name: "cadprod_test"