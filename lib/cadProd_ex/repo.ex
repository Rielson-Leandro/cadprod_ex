defmodule CadProdEx.Repo do
	use Ecto.Repo, otp_app: :cadProd_ex, adapter: Mongo.Ecto


  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
  	{:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end


  defmodule Wrapper do
    def one(query, opts \\ []), do: CadProdEx.Repo.one(query, [ opts])
    def one!(query, opts \\ []), do: CadProdEx.Repo.one!(query, [ opts])
    def all(query, opts \\ []), do: CadProdEx.Repo.all(query, [ opts])
    def get(query, id, opts \\ []), do: CadProdEx.Repo.get(query, id, [ opts])
    def get!(query, id, opts \\ []), do: CadProdEx.Repo.get!(query, id, [ opts])
    def get_by(query, clauses, opts \\ []), do: CadProdEx.Repo.get_by(query, clauses, [ opts])
    def get_by!(query, clauses, opts \\ []), do: CadProdEx.Repo.get_by!(query, clauses, [ opts])
  end


end


