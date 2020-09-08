defmodule CadProdExWeb.ProductControllerTest do
  use CadProdExWeb.ConnCase, async: false

  alias CadProdEx.Product
  alias CadProdEx.Product.Service
  alias CadProdEx.Repo

  @valid_attrs %{description: "some description", ean: "7892319302312", name: "some name", preco: 120.5, qty: 42, sku: "some-sku"}
  @invalid_attrs %{}
 
  defp del(id), do: Service.delete(id)

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, product_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing products"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, product_path(conn, :new)
    assert html_response(conn, 200) =~ "New product"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, product_path(conn, :create), product: @valid_attrs
    product = Repo.get_by!(Product, @valid_attrs)
    assert redirected_to(conn) == product_path(conn, :show, product.id)
    del(product.id)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, product_path(conn, :create), product: @invalid_attrs
    assert html_response(conn, 200) =~ "New product"
  end

  test "shows chosen resource", %{conn: conn} do
    product = Repo.insert! %Product{}
    conn = get conn, product_path(conn, :show, product)
    assert html_response(conn, 200) =~ "Show product"
    del(product.id)
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 400, fn ->
      get conn, product_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    product = Repo.insert! %Product{}
    conn = get conn, product_path(conn, :edit, product)
    assert html_response(conn, 200) =~ "Edit product"
    del(product.id)
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    product = Repo.insert! %Product{}
    conn = put conn, product_path(conn, :update, product), product: @valid_attrs
    assert redirected_to(conn) == product_path(conn, :show, product)
    assert Repo.get_by(Product, @valid_attrs)
    del(product.id)
  end
end
