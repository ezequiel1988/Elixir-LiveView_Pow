defmodule MyAppWeb.ProductsLive do
  use MyAppWeb, :live_view
  alias MyApp.Products


  @impl true
  def mount(_params,  %{"current_user" => user}, socket) do

    socket = assign(socket, list_product: list_of_products(), products: Products.list_products(), loading: true, type: "", user: user )
    {:ok, socket}

  end


  @impl true
  def handle_event("product", %{"product" => product_name}, socket) do

    send(self(), {:productName_not_found, product_name})

    products = Products.list_products_by_criteria(type: product_name)

    socket = assign(socket, products: products, loading: true, type: product_name)

    {:noreply, socket}

  end

  def handle_event("delete", %{"value" => product_id}, socket) do

    product = Products.get_product!(product_id)

    {:ok, _} = Products.delete_product(product)

    {:noreply, assign(socket, :products, Products.list_products())}
  end


  @impl true
  def handle_info({:productName_not_found, product_name}, socket) do

    case Products.get_product_by_name!(product_name) do
      [] ->
        socket=
          socket
          |> put_flash(:error, "no se encontro ningún usuario con este nombre #{product_name}")
          |> assign(products: Products.list_products(),  loading: true)

        {:noreply, socket}

        products ->
          socket =
            socket
            |> clear_flash()
            |> assign( products: products, loading: true)
        {:noreply, socket}


    end
  end

  defp list_of_products do
    [
      "",
      "McBook Pro 16GB RAM",
      "McBook Pro 12GB RAM",
      "Laptop Precision 15 5530 2 en 1"
    ]
  end


end
