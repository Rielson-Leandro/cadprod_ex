defmodule CadProdEx.Product.Cache do
	alias CadProdEx.{Redis.Client, Product}


  def get(product_id) do
    product = Client.get(product_id)
    if !is_nil(product) do
      product_ = Poison.decode!(product, %{keys: :atoms!})
      struct(Product, product_)  
    end
  end


	def set(product) do
		params = Map.from_struct(product) |> Map.delete(:__meta__)
		Client.set(product.id, Poison.encode!(params))
		product
	end

  def delete(product), do: Client.delete(product.id)

end