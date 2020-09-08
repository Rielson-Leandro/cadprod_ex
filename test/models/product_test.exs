defmodule CadProdEx.ProductTest do
  use ExUnit.Case, async: false

  alias CadProdEx.Product

  @valid_attrs %{description: "some description", ean: "7892319302312", name: "some name", preco: 120.5, qty: 42, sku: "some-sku"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Product.changeset(%Product{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "shouldn't update price to zero" do
    Map.put(@valid_attrs, :preco, 0.0)
    Product.changeset(%Product{}, @valid_attrs)
    assert {:error, "price must be greater than zero"}
  end

  test "shouldn't create product with invalid character in sku" do
    Map.put(@valid_attrs, :sku, "invalid sku/")
    Product.changeset(%Product{}, @valid_attrs)
    assert {:error, "invalid character, you can use - and alphanumeric"}
  end

  test "shouldn't create product with invalid ean" do
    Map.put(@valid_attrs, :ean, "23424")
    Product.changeset(%Product{}, @valid_attrs)
    assert {:error, "invalid ean size, must contain 8 to 13 digits"}
  end 
  
  test "Shold create product with valid sku" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

  test "Shold create product with valid ean" do
    changeset = Product.changeset(%Product{}, @valid_attrs)
    assert changeset.valid?
  end

end
