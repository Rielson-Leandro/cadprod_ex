use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :cadProd_ex, CadProdExWeb.Endpoint,
  secret_key_base: "jCkrx3qTt7r2XUgzhW42a9ZwyqDbpJkWO3kxzLyPMlqJ6SH6XQkVOC/FuYPODRKj"

# Configure your database
config :cadProd_ex, CadProdEx.Repo,
  database: "cad_prod_development",
  hostname: "localhost"
