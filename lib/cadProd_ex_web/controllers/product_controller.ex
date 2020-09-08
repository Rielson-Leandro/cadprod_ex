defmodule CadProdExWeb.ProductController do
  use CadProdExWeb, :controller
  action_fallback CadProdExWeb.FallbackController

  alias CadProdEx.Product.Service

  def index(conn, _params) do
    products = Service.all()
    render(conn, "index.html", products: products)
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Service.new())
  end

  def create(conn, %{"product" => product_params}) do
    with {:ok, product} <- Service.create(product_params) do
      conn
      |> put_flash(:info, "Product created successfully.")
      |> redirect(to: product_path(conn, :show, product))
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, product} <- Service.get(id) do 
      render(conn, "show.html", product: product)
    end
  end

  def edit(conn, %{"id" => id}) do
    with {:ok, product} <- Service.get(id) do 
         changeset = Service.edit(id) 
      render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    with {:ok, product} <- Service.update(id, product_params) do
      conn   
      |> put_flash(:info, "Product updated successfully.")
      |> redirect(to: product_path(conn, :show, product))
    end
  end

  def delete(conn, %{"id" => id}) do
    Service.delete(id)
    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: product_path(conn, :index))
  end
end
