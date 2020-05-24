defmodule MyAppWeb.UpdateProductsLive do
  use MyAppWeb, :live_view
  alias MyApp.Products
  alias MyApp.Products.Product
  alias MyApp.Repo



  @impl true
  def mount(%{"product_id" => product_id}, _session, socket) do

    product = Products.get_product!(product_id)

    socket = assign(socket, %{changeset: Products.change_product(product)})
    {:ok, socket}

  end

  @impl true
  def handle_event("save", %{"product" => product}, socket) do

    product_to_update =  Products.get_product! product["id"]

    case Products.update_product(product_to_update, product) do
      {:ok, _product} ->
        {:noreply,
         socket
         |> put_flash(:info, "Producto actualizado")
         |> redirect(to: Routes.live_path(socket, MyAppWeb.ProductsLive))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end

  end


  @impl true
  def handle_event("validate", %{"product" => params}, socket) do

    changeset =
      %Product{}
      |> Products.change_product(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

end
