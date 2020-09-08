defmodule CadProdEx.Product do
  use Ecto.Schema
  import Ecto.Changeset

@primary_key {:id, :binary_id, autogenerate: true}
  schema "products" do
    field :description, :string
    field :name, :string
    field :preco, :float
    field :qty, :integer
    field :sku, :string
    field :ean, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs \\ %{}) do
    product
    |> cast(attrs, [:sku, :name, :description, :qty, :preco, :ean])
    |> validate_required([:sku, :name, :description, :qty, :preco, :ean])
    |> validate_length(:ean, min: 8, max: 13)
    |> validate_price()
    |> validate_sku()
  end

  def validate_price(changeset) do
    validate_change(changeset, :preco, fn :preco, preco ->
      cond do
      preco <= 0 ->
        [error: "price must be greater than zero"]
      true ->
        []
      end    
    end)
  end

  def validate_sku(changeset) do
    validate_change(changeset, :sku, fn :sku, sku ->
      if String.match?(sku, ~r/^[a-zA-Z0-9\-]+$/) do
        []
      else  
        [error: "invalid character, you can use - and alphanumeric"]
      end    
    end)
  end

  def validate_ean(changeset) do
    validate_change(changeset, :ean, fn :ean, ean ->
      if String.length(ean) in 8..13 do
        []
      else
        [error: "invalid ean size, must contain 8 to 13 digits"]
      end
    end)  
  end
end
