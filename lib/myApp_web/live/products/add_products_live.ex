defmodule MyAppWeb.AddProductsLive do
  use MyAppWeb, :live_view
  alias MyApp.Products
  alias MyApp.Products.Product
  alias MyApp.Repo

  @impl true
  def mount(_params, %{"current_user"=> user}, socket) do

      socket = assign(socket, %{changeset: Products.change_product(%Product{}), user: user})

    {:ok, socket}

  end


  @impl true
  def handle_event("validate", %{"product" => params}, socket) do

    changeset =
      %Product{}
      |> Products.change_product(params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end


  @impl true
  def handle_event("save", %{"product" => product}, socket) do

    changeset = socket.assigns.user
      |> Ecto.build_assoc(:products)
      |> Product.changeset(product)

    case Repo.insert(changeset) do
      {:ok, _product} ->

        {:noreply,
         socket
         |> put_flash(:info, "Producto creado")
         |> redirect(to: Routes.live_path(socket, MyAppWeb.ProductsLive))}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

end
