defmodule CadProdEx.Product.Elastic do
  alias  CadProdEx.Elasticsearch.Elastic

  def put(product) do
    params = Map.from_struct(product) |> Map.delete(:__meta__)
    params = Map.put(params, :updated_at, NaiveDateTime.to_iso8601(product.updated_at))
    params = Map.put(params, :inserted_at, NaiveDateTime.to_iso8601(product.inserted_at))
    path = uri("id/#{product.id}")
    Elastic.put(path, params)
  end

  def get_all do
    path = uri("_search?q=*")
    Elastic.get(path)
  end

  def delete(product) do
    path = uri("id/#{product.id}")
    Elastic.delete(path)
  end

  defp uri(path), do: "/#{index_name()}/#{path}"

  defp index_name, do: config()[:index_name]

  defp config, do: Application.get_env(:cadProd_ex, __MODULE__)
end

