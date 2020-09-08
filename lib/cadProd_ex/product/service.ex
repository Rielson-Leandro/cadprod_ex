defmodule CadProdEx.Product.Service do
	alias CadProdEx.{Repo, Product, Product.Cache, Product.Elastic}
 
  def all do 
    with {:ok, _, elastic_result} <- Elastic.get_all(),
         %{hits: %{hits: products}} <- elastic_result do
      Enum.map(products, fn els_product ->
        product_params = Map.put(els_product[:_source], :id, els_product[:_id])
        struct(Product, product_params) 
      end)
    else
      {_, _, elastic_result} ->
        {:error, elastic_result}

      error ->
        {:error, inspect(error)}

    end
  end

  def new, do: Product.changeset(%Product{})

  def create(params) do
    with changeset <- Product.changeset(%Product{}, params),
         {:ok, product} <- Repo.insert(changeset),
         product <- set(product) do
      {:ok, product}    
    end
  end

  def update(product_id, params) do
    with {:ok, product} <- get(product_id),
         changeset <- Product.changeset(product, params),
         {:ok, product} <- Repo.update(changeset) do
      if (changeset.changes != %{}), do: set(product)
      {:ok, product}
    end
  end

  def edit(product_id) do
    with {:ok, product} <- get(product_id) do
      Product.changeset(product)
    end
  end

  def delete(product_id) do
    product = %Product{id: product_id}
    Cache.delete(product)
    Repo.delete(product)
    Elastic.delete(product)
  end

  def get(product_id) do
    with nil <- Cache.get(product_id),
         product = %Product{} <- Repo.get(Product, product_id) do  
      {:ok, set(product)} 
    else
      product = %Product{} ->
        {:ok, product}

      _ ->
        {:error, "Product Not Found"} 
    end
  end

  defp set(product) do 
    Elastic.put(product)
    Cache.set(product)
  end

end
