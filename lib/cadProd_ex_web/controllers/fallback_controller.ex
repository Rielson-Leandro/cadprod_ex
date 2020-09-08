defmodule CadProdExWeb.FallbackController do
  use CadProdExWeb, :controller


  def call(conn, {:error, "Product Not Found"}) do
    conn
    |> put_flash(:error, "Product Not Found")
    |> redirect(to: product_path(conn, :index))
  end

  def call(%Plug.Conn{private: %{phoenix_action: action}} = conn, {:error, changeset}) do
  	views = %{create: "new", update: "edit"}
  	render(conn, "#{views[action]}.html", changeset: changeset)
  end



end  