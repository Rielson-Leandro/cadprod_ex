defmodule CadProdEx.Elasticsearch.Elastic do
  alias Tirexs.HTTP

  def put(path, payload), do: HTTP.put(path, payload)

  def get(path), do: HTTP.get(path)

  def delete(path), do: HTTP.delete(path)
end
